<?php

namespace app\api\model;

use think\Db;

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
                   'cid'                =>$params['cid'],
                   'shop_id'            =>$params['shop_id'],
                   'shop_name'          =>'自选平台',
                   'goods_id'           =>$params['goodsId'],
                   'goods_name'         =>$params['goods_name'],
                   'price'              =>$params['price'] ,
                   'num'                =>$params['number'],
                   'cost_price'         =>$params['cost_price'],
                   'vip_price'          =>$params['vip_price'],
                   'goods_picture'      =>$params['goods_picture'],
               ]
           );
           $state = $createRow->id;
       }else{
           $row->num = $row->num +$params['number'];
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
        $sql = "SELECT count(id)  AS goodsCount, sum(price * num) AS goodsAmount,sum( vip_price * num ) AS goodsVipAmount FROM ewei_cart WHERE  uid = {$uid}";
        $checkSql = "SELECT count(id)  AS goodsCount, sum(price * num) AS goodsAmount,sum( vip_price * num ) AS goodsVipAmount FROM ewei_cart WHERE  uid = {$uid} AND checked = 1";
        $row = self::query( $sql );
        $checkRow = self::query( $checkSql );
        $data = [];
        if( empty($row[0]['goodsCount']) ||  empty($row[0]['goodsAmount'])  ){
            $data['goodsCount']         = 0;
            $data['goodsAmount']        = 0;
            $data['checkedGoodsAmount'] = 0;
            $data['checkedGoodsCount']  = 0;
        }else{
            $count = $row[0];
            $data['goodsCount']         = $count['goodsCount'];
            $data['goodsAmount']        = $count['goodsVipAmount']!=0 ? $count['goodsVipAmount']:$count['goodsAmount'];

            if($checkRow[0]['goodsCount'] == 0 ){
                $data['checkedGoodsAmount'] = 0;
            }else{
                $data['checkedGoodsAmount'] = !empty($checkRow[0]['goodsAmount'])&&$count['goodsVipAmount']!=0 ?$checkRow[0]['goodsVipAmount']:$checkRow[0]['goodsAmount'];
            }
            $data['checkedGoodsCount']  = !empty($checkRow[0]['goodsCount'])?$checkRow[0]['goodsCount']:0;
        }

        return $data;
    }

    /**
     * 获取购物车列表商品
     * @param int $uid
     * @param bool $ckeched
     * @return $this|array
     */
    public static function getCartAll( $uid = -1,$ckeched=false ){
        $row = self::where([
            'uid' => $uid,
        ]);
        if( $ckeched ){
            $row->where([
                'checked'=> 1
            ]);
        }

        $data = $row->order('id desc')->select()->toArray();

        if( empty($data) ){
            return [];
        }

        return $data;
    }

    /**
     * 修改购物车商品数量
     * @param $req
     * @return $this
     */
    public  static function updateNumber( $req ){
        //修改购物车商品价格和数量
        $row = self::where([
            'goods_id' => $req['goodsId'],
            'id'=>$req['id'],
            'uid'=> $req['uid']
        ])->update([
            'num'  => $req['number'],
        ]);

        return $row;
    }

    /**
     * 修改购物车选中状态
     * @param $req
     * @return bool
     */
    public static function updateChecked($req){
        $productIds = explode(',',$req['productIds']);
        foreach ($productIds as $id ){
            self::where([
                'id' => $id,
                'uid'=> $req['uid']
            ])->update([
                'checked'  => $req['isChecked'],
            ]);
        }

        return true;
    }

    /**
     * 删除购物车
     * @param $req
     * @return bool
     */
    public static function deleteCart($req){
        $productIds = explode(',',$req['productIds']);
        foreach ($productIds as $id ){
            self::where([
                'id' => $id,
                'uid'=> $req['uid']
            ])->delete();
        }

        return true;
    }


}
