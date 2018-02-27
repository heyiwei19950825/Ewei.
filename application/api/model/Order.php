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

    }

    public static function getSummaryByUser( $uid,$type,$page,$ize){
        $row = [];
        $map['buyer_id'] = $uid;
        if( $type != '9999' ){//不是全部查询
            if( $type == '4' ){//退换货
                $map['order_status'] = ['in','4,5,6'];
            }else{
                $map['order_status'] = $type;
            }
        }

        $data = Db::name('order')->where($map)->order('create_time desc,order_status asc')->select();
        $orderConfig = Config::get('order')['status'];

        foreach ( $data as$key=> $item){
            $row[$key]['id'] = $item['id'];
            $row[$key]['order_sn'] = $item['order_no'];
            $row[$key]['order_status_text'] = $orderConfig[$item['order_status']];
            $row[$key]['actual_price'] = $item['order_money'];
            $row[$key]['handleOption'] = $item['order_status'] == 1 ? true:false;
            $row[$key]['order_type'] = $item['order_type'];
            $row[$key]['point'] = $item['point'];
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
        $row = [];
        $row = Db::name('order')->where()->update(['order_status'=>10]);
        return $row;
    }
}
