<?php
/**
 * 优惠券
 * User: heyiw
 * Date: 2018/1/28
 * Time: 18:15
 */

namespace app\api\model;
use app\api\model\User;
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
    public static function userCoupon( $uid=-1,$type=0 ){
        $now =date('Y-m-d H:i:s',time());
        $datas =[];
        //获取优惠券列表
        $data = Db::name('coupon')->alias('c')
            ->join('coupon_type t','t.coupon_type_id = c.coupon_type_id','LEFT')
            ->where([
                'uid'=>$uid,
                'state' => $type
            ])->field(
                'c.start_time,c.end_time,coupon_name,c.coupon_id,t.coupon_type_id'
            )->select()->toArray();
        //获取优惠券对应的商品
        foreach ( $data as $item) {
            $names = '';
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
     * 获取用户对应商品可使用的优惠券
     * @param int $uid
     * @param array $cartInfo
     * @return array
     */
    public static function useCoupon( $uid = -1 ,$cartListId = [],$totalPrice = 0){
        $user = User::getInfoById( $uid);
        $names =  '';
        $datas =[];
        $now =date('Y-m-d H:i:s',time());

        //获取优惠券列表
        $data = Db::name('coupon')->alias('c')
            ->join('coupon_type t','t.coupon_type_id = c.coupon_type_id','LEFT')
            ->where([
                'uid'=>$uid,
                'state' => 0
            ])->field(
                'c.start_time,c.end_time,coupon_name,c.coupon_id,t.coupon_type_id,c.money,t.need_user_level'
            )->select()->toArray();

        //获取优惠券对应的商品
        foreach ( $data as &$item) {
            $goodsRow = Db::name('coupon_goods')
                ->where([
                    'coupon_type_id' => $item['coupon_type_id']
                ])
                ->field('goods_id')
                ->select()->toArray();
            //检测变量
            $isOk = false;

//            if($item['need_user_level']<= $user['rank_id']){
                if( $goodsRow != []){
                    //优惠券是否在购物车商品列表中
                    foreach ($goodsRow as $gItem) {
                        if( in_array($gItem['goods_id'],$cartListId) && $item['money'] <= $totalPrice ){
                            $isOk = true;
                        }
                    }
                    $item['is_ok'] = $isOk;
                }else{
                    $item['is_ok'] = true;
                }
//            }

        }

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
            if( $names != '' ){
                $datas[] = $item;
            }
        }

        return $data;
    }
    /**
     * 获取在线优惠券列表
     * @return array
     */
    public static function getCouponList(){

        $map['start_time']      = ['<=',time()];
        $map['end_time']        = ['>=',time()];
        $map['is_show']         = ['=',1];
        $row = Db::name('coupon_type')
            ->field('coupon_type_id,coupon_name,money,count,max_fetch,at_least,need_user_level,range_type,start_time,end_time')
            ->where($map)
            ->select()->toArray();
        foreach ($row as &$item) {
            $item['start_time'] = date('Y-m-d',$item['start_time']);
            $item['end_time']   = date('Y-m-d',$item['end_time']);
            $item['range_type']   = $item['range_type']==0?'部分商品可用':'全商品可用';
        }

        return $row;
    }

    /**
     * 获取优惠券信息
     * @param int $id
     * @return array
     */
    public static function getInfoById( $uid,$id = -1 ){
        $now =date('Y-m-d H:i:s',time());

        $map['start_time']      = ['<=',$now];
        $map['end_time']        = ['>=',$now];
        $map['state']           = ['=',0];
        $map['coupon_id']       = ['=',$id];
        $map['uid']             = ['=',$uid];
        $row = Db::name('coupon')->field('coupon_id,coupon_type_id')->where($map)->find();

        $data = Db::name('coupon_type')->field('coupon_name,money')->where(['coupon_type_id'=>$row['coupon_type_id']] )->find();
        $data['id'] = $row['coupon_id'];

        return $data;
    }

    public static function addUserCoupon( $uid = -1,$cid = -1  ){
        //领取优惠券个数
        $couponGetNumber = Db::name('coupon')->where(['coupon_type_id'=>$cid])->count();

        //查询当前优惠券信息
        $map['start_time']      = ['<=',time()];
        $map['end_time']        = ['>=',time()];
        $map['coupon_type_id']  = ['=',$cid];
        $coupon = Db::name('coupon_type')->where($map)->find();
        //判断是否达到领取上线
        if( $couponGetNumber >= $coupon['count']){
            return false;
        }
        //判断用户领取最大领取个数
        if( $coupon['max_fetch'] != 0 ){
            $userGetNumber = Db::name('coupon')->where(['uid'=>$uid])->count();
            if( $userGetNumber > $coupon['max_fetch']){
                    return false;
            }
        }
        //判断用户等级是否符合
        $user = User::get(['id'=>$uid]);
        if( $user['rank_id'] != $coupon['need_rank']){
            return false;
        }

        $data = [
            'coupon_type_id'    => $coupon['coupon_type_id'],
            'coupon_code'       => time().rand(111,999),
            'uid'               => $uid,
            'money'             => $coupon['money'],
            'get_type'          => 1,
            'fetch_time'        => date('Y-m-d',time()),
            'start_time'        => date('Y-m-d',$coupon['start_time']),
            'end_time'          => date('Y-m-d',$coupon['end_time']),
        ];
        $row = Db::name('coupon')->insert( $data );

        return $row;
    }

    public static function updateCoupon($id){
        Db::name('coupon')->where(['coupon_id'=>$id])->update([
            'use_time'=>time(),
            'state' => 1
        ]);
    }

}