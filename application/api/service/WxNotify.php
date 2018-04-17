<?php
/**
 * Created by Ewei.
 * Author: Ewei.
 * 微信公号: 眉山同城

 * Date: 2017/2/28
 * Time: 18:12
 */

namespace app\api\service;


use app\api\model\GoodsCollective;
use app\api\model\InternetOrder;
use app\api\model\Order;
use app\api\model\Goods;
use app\api\model\OrderProduct;
use app\api\model\User;
use app\api\model\UserCollective;
use app\api\service\Order as OrderService;
use app\common\model\InternetMachine;
use app\common\model\InternetOrderMachine;
use app\lib\enum\OrderStatusEnum;
use think\Db;
use think\Exception;
use think\Loader;
use think\Log;
use app\common\model\Shop;

Loader::import('WxPay.WxPay', EXTEND_PATH, '.Api.php');

//Loader::import('WxPay.WxPay', EXTEND_PATH, '.Data.php');


class WxNotify extends \WxPayNotify
{
    public function NotifyProcess($data, &$msg)
    {
        if ($data['result_code'] == 'SUCCESS') {
            $orderNo = $data['out_trade_no'];
            Log::write($data,'notice');
            Db::startTrans();
            try {

                $order = Order::where('order_no', '=', $orderNo)->lock(true)->find();
                if(!empty($order)){
                    $this->updateOrderStatus($order, true,$data);
                }else{
                    //网吧订单
                   $order = InternetOrder::where('order_no', '=', $orderNo)->lock(true)->find();
                    if($order['status'] == 0){
                        //修改订单状态
                        $this->updateInternetOrder($order);
                    }

                    return true;
                }

                if ($order['order_status'] == 0 ) {
                    $service = new OrderService();
                    $status = $service->checkOrderStock($order['id']);
                    $status['pass'] = true;
                    if ($status['pass']) {
                        $this->updateOrderStatus($order, true,$data);
                        $this->updateShopBrief($data['total_fee'],$order);
                        $this->updateUserIntegral($order);
                        $this->reduceStock($status);

                        //团购订单
                        if( $order['order_type'] == 1 ){
                            $this->updateCollectiveStatus($order['id']);
                        }

                    } else {
                        $this->updateOrderStatus($order['id'], false,$data);
                    }
                }
                Db::commit();
            } catch (Exception $ex) {
                Db::rollback();
                Log::error($ex->getMessage());
                // 如果出现异常，向微信返回false，请求重新发送通知
                return false;
            }
        }
        return true;
    }

    /**
     * 网吧修改状态
     */
    private  function updateInternetOrder($order){
        //修改状态
        Db::startTrans();
        try {
            InternetOrder::where('order_no', '=', $order['order_no'])
                ->update(['status' => 1,'pay_time'=>time()]);
            InternetOrderMachine::where('order_no','=',$order['order_no'])
                ->update(['status'=>1]);
            $machineList = InternetOrderMachine::where('order_no','=',$order['order_no'])->select()->toArray();
            $uid = '';
            foreach ($machineList as $k=>$v){
                InternetMachine::where(['number'=>$v['machine_number']])->update([
                    'status' => 2,
                    'order_no'=>$order['order_no']
                ]);
                $uid = $v['uid'];
            }
            //系统配置  获得积分比例
            $rule = Db::name('internet_bar_setting')->where([
                'uid' =>1
            ])->field('integral')->find();

            $integral = $order['order_money']*$rule['integral'];

            //修改用户积分
            User::where([
                'id' => $uid
            ])->setInc('integral', $integral);

            //记录日志
            User::updateUserIntegral($uid,$integral,1,'订座获得积分');

            //增加下单数量
            Db::name('statistics')->where(['uid'=>1])->setInc('success_order_number');
            //增加下单成功交易金额
            Db::name('statistics')->where(['uid'=>1])->setInc('success_order_money',$order['order_money']);
            //总收入
            Db::name('statistics')->where(['uid'=>1])->setInc('income',$order['order_money']);

            //积分增长数
            Db::name('statistics')->where(['uid'=>1])->setInc('integral_number',$integral);
            Db::commit();
        } catch (Exception $ex) {
            Db::rollback();
            Log::error($ex->getMessage());
            // 如果出现异常，向微信返回false，请求重新发送通知
            return false;
        }
    }

    private function reduceStock($status)
    {
        foreach ($status['pStatusArray'] as $singlePStatus) {
            Goods::where('id', '=', $singlePStatus['id'])
                ->setDec('sp_inventory', $singlePStatus['count']);

            Goods::where('id', '=', $singlePStatus['id'])
                ->setInc('sp_market', $singlePStatus['count']);


        }
    }

    private function updateUserIntegral($orderInfo){
        User::where('id', '=', $orderInfo['buyer_id'])
            ->setInc('integral', $orderInfo['give_point']);

    }

    private function updateOrderStatus($order, $success,$data)
    {
        $status = $success ? OrderStatusEnum::PAID : OrderStatusEnum::PAID_BUT_OUT_OF;

        //判断是否是团购
        if( $order['order_type'] == 1){
            $status = 9;
        }

        Order::where('id', '=', $order['id'])
            ->update(['order_status' => $status,'transaction_id'=>$data['transaction_id'],'pay_time'=>time()]);
    }

    private function updateShopBrief($free,$order){

        $shop = Shop::where('id','=',$order['shop_id'])->find();

        //总销售额【不计算退款】
        $freeNum = $shop['shop_sales'];
        $freeNum = $freeNum*100 + ($free+0);
        $freeNum = round($freeNum/100,2);

        //账户余额
        $account = $shop['shop_account'];
        $account = $account*100 + ($free+0);
        $account = round($account/100,2);

        Shop::where('id','=',$order['shop_id'])
            ->update(['shop_sales'=>$freeNum,'shop_account'=>$account]);

    }

    /**
     * 修改团购信息数据
     * @param $orderId
     */
    private function updateCollectiveStatus($orderId){
        //查询开团规则
        $collective = UserCollective::get(['order_id'=>$orderId]);
        //查询该团 参与人数
        $joinList = UserCollective::all(['collective_no'=>$collective['collective_no']])->toArray();
        $joinNum = count($joinList);

        //判断是否达到人数要求
        if( $collective['num'] == $joinNum){
            //修改开团状态
            UserCollective::update(['status'=>1],['collective_no'=>$collective['collective_no']]);
            //修改订单状态
            Order::where('id', '=', $orderId)
                ->update(['order_status' => 1]);
        }else if($collective['num'] > $joinNum){
            //修改开团状态
            UserCollective::update(['status'=>0],['order_id'=>$orderId]);
        }
    }
}