<?php

namespace app\api\model;

use think\Model;
use think\Config;
use think\Db;

class Order extends BaseModel
{
    /**
     * 添加订单信息
     */
    public static function addOrder( $param = [] ){
        if( !is_array($param) || $param == [] ){
            return [];
        }
        Db::name('order')->insert($param);

        $id = Db::name('order')->getLastInsID();

        if( empty($id) || !$id  || $id == 0){
            return 0;
        }

        //创建订单商品表数据

        return $id;
    }

    /**
     * 修改订单状态
     * @param array $param
     */
    public static function updateOrderStatic($param = [] ){

        $updateExecute = Db::name('order')->where(['id'=>$param['id'],'buyer_id'=>$param['uid']]);
        $row = $updateExecute->update(['order_status'=>$param['status']]);
        $orderInfo = $updateExecute->field('order_type')->find();

        //检查判断订单如果是团购订单  则修改对应的团购信息
        if( $param['status'] == 8 && $orderInfo != NULL && $orderInfo['order_type'] == 1 ){
            Db::name('user_collective')->where(['order_id'=>$param['id']])->update(['status'=>1]);
        }

        return $row;
    }

    public static function getSummaryByUser( $param,$uid){
        $row = [];
        $param['buyer_id'] = $uid;
        if( $param['type'] != '9999' && $param['type'] != ''){//不是全部查询
            if( $param['type'] == '4' ){//退换货
                $param['order_status'] = ['in','4,5,6'];
            }else{
                $param['order_status'] = $param['type'];
            }
        }
        unset($param['type']);
        $data = Db::name('order')->where($param)->order('create_time desc,order_status asc')->select();
        $orderConfig = Config::get('order')['status'];

        foreach ( $data as$key=> $item){
            $row[$key]['id'] = $item['id'];
            $row[$key]['order_sn'] = $item['order_no'];
            $row[$key]['order_status_text'] = $orderConfig[$item['order_status']];
            $row[$key]['actual_price'] = $item['order_money'];
            $row[$key]['handleOption'] = $item['order_status'] == 1 ? true:false;
            $row[$key]['order_type'] = $item['order_type'];
            $row[$key]['point'] = $item['point'];
            $row[$key]['order_status'] = $item['order_status'];
            $row[$key]['goodsList'] = Db::name('order_product')->where(['order_id'=>$item['id']])->field('num,goods_name,goods_picture')->select()->toArray();
        }

        return $row;
    }


    /**
     * 删除订单信息
     * @param  [type] $id  [description]
     * @param  [type] $uid [description]
     * @return [type]      [description]
     */
    public static function delOrder( $id,$uid ){
        $updateExecute = Db::name('order')->where(['id'=>$id,'buyer_id'=>$uid]);
        $orderInfo = $updateExecute->field('order_type')->find();

        //检查判断订单如果是团购订单  则修改对应的团购信息
        if( $orderInfo != NULL && $orderInfo['order_type'] == 1 ){
            Db::name('user_collective')->where(['order_id'=>$id])->update(['status'=>1]);
        }

        $row = Db::name('order')->where(['id'=>$id,'buyer_id'=>$uid])->delete();

        return $row;
    }

    /**
     * 通过订单Id查询
     * @return array
     */
    public static function getGoodsInfoByOrderId( $param = []){
        $row = Db::name('order_product')->alias('p')
            ->join('order o','p.order_id = o.id','LEFT')
            ->where($param)
            ->find();

        return $row;
    }

    /**
     * 检测订单状态判断是否支付是否已过期
     */
    public static function checkAndDelOrder(){
        //查询已过期并且未支付的订单
        $row = Db::name('order')->where([
            'order_status' => 0
        ])->select();

        foreach ($row as $item) {
            if( $item['create_time'] + 1800 < time() ){
                //删除订单
                Db::name('order')->where([
                    'id'=>$item['id']
                ])->delete();
                //删除订单相关商品
                Db::name('order_product')->where([
                    'order_id'=>$item['id']
                ])->select();
                //判断是否是团购
                if( $item['order_type'] == 1 ){
                    Db::name('user_collective')->where([
                        'order_id'=>$item['id']
                    ])->delete();
                }
            }
        }
    }
}
