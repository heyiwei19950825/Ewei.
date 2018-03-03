<?php
/**
 * Created by Ewei.
 * Author: Ewei.
 * 微信公号: 眉山同城

 * Date: 2017/2/28
 * Time: 18:12
 */

namespace app\api\service;


use app\api\model\Order;
use app\api\model\Goods;
use app\api\model\User;
use app\api\service\Order as OrderService;
use app\lib\enum\OrderStatusEnum;
use app\lib\order\OrderStatus;
use think\Db;
use think\Exception;
use think\Loader;
use think\Log;
use app\common\model\Shop;

Loader::import('WxPay.WxPay', EXTEND_PATH, '.Api.php');

//Loader::import('WxPay.WxPay', EXTEND_PATH, '.Data.php');


class WxNotify extends \WxPayNotify
{
//    protected $data = <<<EOD
//<xml><appid><![CDATA[wxaaf1c852597e365b]]></appid>
//<bank_type><![CDATA[CFT]]></bank_type>
//<cash_fee><![CDATA[1]]></cash_fee>
//<fee_type><![CDATA[CNY]]></fee_type>
//<is_subscribe><![CDATA[N]]></is_subscribe>
//<mch_id><![CDATA[1392378802]]></mch_id>
//<nonce_str><![CDATA[k66j676kzd3tqq2sr3023ogeqrg4np9z]]></nonce_str>
//<openid><![CDATA[ojID50G-cjUsFMJ0PjgDXt9iqoOo]]></openid>
//<out_trade_no><![CDATA[A301089188132321]]></out_trade_no>
//<result_code><![CDATA[SUCCESS]]></result_code>
//<return_code><![CDATA[SUCCESS]]></return_code>
//<sign><![CDATA[944E2F9AF80204201177B91CEADD5AEC]]></sign>
//<time_end><![CDATA[20170301030852]]></time_end>
//<total_fee>1</total_fee>
//<trade_type><![CDATA[JSAPI]]></trade_type>
//<transaction_id><![CDATA[4004312001201703011727741547]]></transaction_id>
//</xml>
//EOD;

    public function NotifyProcess($data, &$msg)
    {
//        $data = $this->data;
        if ($data['result_code'] == 'SUCCESS') {
            $orderNo = $data['out_trade_no'];
            Db::startTrans();
            try {
                $order = Order::where('order_no', '=', $orderNo)->lock(true)->find();
                $this->updateOrderStatus($order->id, true);
                if ($order->order_status == 0 ) {
                    $service = new OrderService();
                    $status = $service->checkOrderStock($order->id);
                    Log::debug($status);
                    $status['pass'] = true;
                    if ($status['pass']) {
                        $this->updateOrderStatus($order->id, true);
                        $this->updateShopBrief($data['total_fee'],$order);
                        $this->updateUserIntegral($order->id);
                        $this->reduceStock($status);
                    } else {
                        $this->updateOrderStatus($order->id, false);
                    }
                }
                Db::commit();
            } catch (Exception $ex) {
                Db::rollback();
                Log::error($ex);
                // 如果出现异常，向微信返回false，请求重新发送通知
                return false;
            }
        }
        return true;
    }


    private function reduceStock($status)
    {
//        $pIDs = array_keys($status['pStatus']);
        foreach ($status['pStatusArray'] as $singlePStatus) {
            Goods::where('id', '=', $singlePStatus['id'])
                ->setDec('sp_inventory', $singlePStatus['count']);
            Goods::where('id', '=', $singlePStatus['id'])
                ->setInc('sp_market', $singlePStatus['count']);

        }
    }

    private function updateUserIntegral($orderId){
        $orderInfo = Order::where('id','=',$orderId)->find();

        User::where('id', '=', $orderInfo->buyer_id)
            ->setInc('integral', $orderInfo->give_point);
    }

    private function updateOrderStatus($orderID, $success)
    {
        $status = $success ? OrderStatusEnum::PAID : OrderStatusEnum::PAID_BUT_OUT_OF;
        Order::where('id', '=', $orderID)
            ->update(['order_status' => $status]);
    }

    private function updateShopBrief($free,$order){
        $freeNum = Shop::where('id','=',$order['shop_id'])->find()->shop_sales;
        $freeNum = $freeNum*100 + ($free+0);
        $freeNum = round($freeNum/100,2);
        Shop::where('id','=',$order['shop_id'])
            ->update(['shop_sales'=>$freeNum]);
    }
}