<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/1/23
 * Time: 1:12
 */

namespace app\api\service;

use app\api\model\Goods;
use app\api\model\Cart as CartModel;

class Cart
{
    protected $uid;
    function __construct()
    {
    }

    public function add($uid, $params){
        //检测商品库存和状态

        $row = $this->checkGoods($params);

        //成功
        if( $row['errno'] == 0 ){
            $row = $row['data'];
            $params['goods_name']= $row['name'];
            $params['price']= $row['sp_price'];
            $params['goods_picture']=  config('setting.domain').$row['thumb'];
            $params['shop_id']= $row['sid'];
            $rows = CartModel::add($uid, $params);
        }else{//错误
            $rows = $row;
        }


        return $rows;
    }

    public function checkGoods( $params){
        $field = 'sp_inventory,btime,etime,status,name,sid,thumb,sp_price';
        $goodsInfo = Goods::getProductDetail($params['goodsId'],$field);
        //商品不存在
        if( empty( $goodsInfo )){
            return [
                'errno' => '4005',
                'errmsg' => '已下架',
            ];
        }
        //未审核通过
        if( $goodsInfo['status'] == 0 || $goodsInfo['status'] == '0'  ){
            return [
                'errno' => '4003',
                'errmsg' => '已下架',
            ];
        }
        //未到开始时间或已过上架时间
        if( !$goodsInfo['btime'] > date('Y-m-d H:i:s',time())){
            return [
                'errno' => '4002',
                'errmsg' => '抢购还没有开始',
            ];
        }

        if( !$goodsInfo['etime'] >= date('Y-m-d H:i:s',time()) ){
            return [
                'errno' => '4006',
                'errmsg' => '已下架',
            ];
        }

        //库存不足
        if( $goodsInfo['sp_inventory'] < $params['number']){
            return [
                'errno' => '4004',
                'errmsg' => '库存不足',
            ];
        }

        return [
            'errno' => '0',
            'errmsg' => '',
            'data'   => $goodsInfo
        ];
    }

}