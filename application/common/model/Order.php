<?php
namespace app\common\model;

use app\common\model\BaseModel;
use app\common\model\OrderGoods as OrderGoodsModel;
use app\common\model\GoodsSku as GoodsSkuModel;
use app\common\model\Province as ProvinceModel;
use app\common\model\City as CityModel;
use app\common\model\District as DistrictModel;
use app\common\model\Order\OrderStatus;
use app\common\model\AlbumPicture as AlbumPictureModel;
use think\Db;
use think\Config;

class Order extends BaseModel
{
    /**
     * 订单查询
     * @param $page
     * @param $size
     * @param $condition
     * @param $desc
     * @return array
     */
    public function getOrderList($page,$size,$condition,$desc,$isPage = true){
        $field = 'o.id,o.seller_memo,o.order_no,o.shop_id,o.shop_name,o.order_from,o.order_type,o.order_status,o.user_name,o.order_type,o.buyer_message,o.receiver_mobile,o.cancel_note,o.receiver_name,o.order_money,o.create_time,p.goods_name,point';
        if( $isPage ){
            $order_list  = Db::name('order')->alias('o')->field($field)->join('order_product p','p.order_id = o.id')->where($condition)->order($desc)->group('o.order_no')->paginate($size, false, ['page' => $page]);
        }else{
            $order_list  = Db::name('order')->alias('o')->field($field)->join('order_product p','p.order_id = o.id')->where($condition)->order($desc)->group('o.order_no')->limit(1,$size)->select();
        }

        return $order_list;
    }

    /**
     * 今日订单数据金额统计
     * @return [type] [description]
     */
    public static function accountCount($time = '1 DAY'){
        $amountSql =  'SELECT COUNT(order_momey) as money FROM ewei_order WHERE DATE_SUB(CURDATE(), INTERVAL '.$time.') <= DATE(create_time)';

        $todayAmount = Db::query($amountSql);

        return $todayAmount[0]['money'];
    }

    /**
     * 统计有效订单总数
     * @return [type] [description]
     */
    public static function getCount( $state = 0,$type= 'id'){
        $where = '';
        if($state != 0){
            $where = 'WHERE order_status = '.$state;
        }
        $sql = ' SELECT COUNT('.$type.') as number FROM ewei_order '.$where;

        $row = Db::query($sql);

        return $row[0]['number'];
    }



    /**
     * 统计有效订单总数
     * @return [type] [description]
     */
    public static function getOrderCount( ){

        $sql = 'SELECT order_status,COUNT(id) AS number FROM ewei_order WHERE 1 = 1 GROUP BY order_status';
        
        $row = Db::query($sql);

        return $row;
    }


    /**
     * 获取订单详情
     * @param $id
     * @return array|false|mixed|\PDOStatement|string|\think\Model
     */
    public function getOrderDetail( $id ){
        $row = Db::name('order')->where(['id'=>$id])->find();
        if( empty( $row ) ){
            return [];
        }
        $orderConfig = Config::get('order');
        $row['from']       = $row['order_from'];//订单来源
        $row['type']       = $row['order_type'];//订单类型
        $row['status']     = $row['order_status'];//订单状态

        $row['order_status'] = $orderConfig['status'][$row['order_status']];
        $row['order_type'] = $orderConfig['type'][$row['order_type']];//订单类型
        $row['order_from'] = $orderConfig['from'][$row['order_from']];//订单来源

        return $row;
    }


    public function cancel( $id = -1,$note ){
        $data = [
            'order_status'=> 8,
            'cancel_note' => $note
        ];
        $row = $this->where(['id'=>$id])->update($data);
        return $row;
    }
}