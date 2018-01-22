<?php

namespace app\api\model;

use phpDocumentor\Reflection\Types\Array_;
use think\Model;

class Cart extends BaseModel
{

    /**
     * 添加购物车
     * @param int $uid
     * @param array $params
     * @return mixed
     */
   public static  function add($uid = -1, $params = []){
       $row = self::where([
           'uid' => $uid,
           'goods_id' => $params['goodsId']
       ])->find();

       //未添加过此商品
       if( empty($row) ){
           $createRow = self::create(
               [
                   'uid'                =>$uid,
                   'shop_id'            =>$params['shop_id'],
                   'shop_name'          =>'自选平台',
                   'goods_id'           =>$params['goodsId'],
                   'goods_name'         =>$params['goods_name'],
                   'price'              => (($params['price'] *100) * $params['number'])/100 ,
                   'num'                =>$params['number'],
                   'goods_picture'      =>$params['goods_picture'],
               ]
           );
           $state = $createRow->id;
       }else{
           $row->num = $row->num +$params['number'];
           $row->price = (($params['price'] * 100) * $row->num)/100;
           $state = $row->save();
       }
       if( empty( $state) ){
           return [
               'errno' => '4007',
               'errmsg' => '系统繁忙，稍后尝试',
           ];
        }
       return [
           'errno' => '0',
           'errmsg' => '添加成功~'
       ];
   }

    /**
     * 统计购物车商品数量
     * @param int $uid
     * @return array
     */
    public static function cartCount( $uid=-1 ){
        $sql = "SELECT sum(num)  AS goodsCount, sum(price) AS goodsAmount FROM ewei_cart WHERE  uid = {$uid}";
        $row = self::query( $sql );
        $data = [];
        if( empty($row[0]['goodsCount']) ||  empty($row[0]['goodsAmount'])  ){
            $data['goodsCount']         = 0;
            $data['goodsAmount']        = 0;
            $data['checkedGoodsAmount'] = 0;
            $data['checkedGoodsCount']  = 0;
        }else{
            $count = $row[0];
            $data['goodsCount']         = $count['goodsCount'];
            $data['goodsAmount']        = $count['goodsAmount'];
            $data['checkedGoodsAmount'] = $count['goodsAmount'];
            $data['checkedGoodsCount']  = $count['goodsCount'];
        }

        return $data;
    }

    /**
     * 获取购物车列表商品
     * @param int $uid
     * @return array
     */
    public static function getCartAll( $uid = -1 ){
        $row = self::where([
            'uid' => $uid
        ])->order('id desc')->select()->toArray();
        if( empty($row) ){
            return [];
        }
        return $row;
    }


}
