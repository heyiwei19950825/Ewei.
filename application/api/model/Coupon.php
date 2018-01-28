<?php
/**
 * 优惠券
 * User: heyiw
 * Date: 2018/1/28
 * Time: 18:15
 */

namespace app\api\model;

use think\Db;

class Coupon extends BaseModel
{
    /**
     * 统计用户的优惠券总数
     * @param $uid
     * @return int
     */
    public static function countCoupon( $uid ){
        $nowTime = date('Y-m-d',time());
        $sql = "SELECT count(coupon_id) as number FROM ewei_coupon WHERE uid = {$uid} AND state=0 AND start_time < '{$nowTime}' AND end_time > '{$nowTime}'";

        $row = Db::query($sql);

        return $row[0]['number'];
    }

    /**
     * 查询用户的优惠券信息
     * @param $uid
     * @return array
     */
    public static function userCoupon( $uid ){
        $now =date('Y-m-d H:i:s',time());
        $names =  '';
        $datas =[];
        //获取优惠券列表
        $data = Db::name('coupon')->alias('c')
            ->join('coupon_type t','t.coupon_type_id = c.coupon_type_id','LEFT')
            ->where([
                'uid'=>$uid
            ])->field(
                'c.start_time,c.end_time,coupon_name,c.coupon_id,t.coupon_type_id'
            )->select()->toArray();
        //获取优惠券对应的商品
        foreach ( $data as $item) {
            $goodsRow = Db::name('coupon_goods')->alias('c')
                ->join('goods g','c.goods_id = g.id','LEFT')
                ->where([
                    'coupon_type_id' => $item['coupon_type_id']
                ])
                ->field('g.name,g.btime,g.etime,g.status')
                ->select()->toArray();

            $map['g.btime']   = ['<=',$now];
            $map['g.etime']   = ['>=',$now];
            $map['g.status']  = ['=',1];
            if( empty($goodsRow) ){
                $item['goods_list'] = 'all';
            }else{
                foreach ($goodsRow as $items){
                    if( $items['btime'] > $now || $items['etime'] < $now || $items['status'] == 0 ){
                        unset($items);
                    }else{
                        $names .= $items['name'].';';
                    }

                }
            }
            $item['goods_name'] = trim($names,';');
            $datas[] = $item;
        }

        return $datas;
    }

    /**
     * 获取在线优惠券列表
     * @return array
     */
    public static function getCouponList(){
        $row = [];
        return $row;
    }

}