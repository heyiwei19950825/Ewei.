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

class Order extends BaseModel
{
    /*
     * (non-PHPdoc)
     * @see \data\api\IOrder::getOrderList()
     */
    public function getOrderList($page_index = 1, $page_size = 0, $condition = '', $order = '')
    {
        // 查询主表
        $order_list = $this->pageQuery($page_index, $page_size, $condition, $order, '*');
        if (! empty($order_list['data'])) {
            foreach ($order_list['data'] as $k => $v) {
                // 查询订单项表
                $order_item = new OrderGoodsModel();
                $order_item_list = $order_item->where([
                    'order_id' => $v['id']
                ])->select();

                // 通过sku_id查询ns_goods_sku中code
                foreach ($order_item_list as $key => $val) {
                    // 查询商品sku表开始
                    $goods_sku = new GoodsSkuModel();
                    $goods_sku_info = $goods_sku->getInfo([
                        'sku_id' => $val['sku_id']
                    ], 'code');
                    $order_item_list[$key]['code'] = $goods_sku_info['code'];
                    // 查询商品sku结束
                }
                
                $province_name = "";
                $city_name = "";
                $district_name = "";
                
                $province = new ProvinceModel();
                $province_info = $province->getInfo(array(
                    "province_id" => $v["receiver_province"]
                ), "*");
                if (count($province_info) > 0) {
                    $province_name = $province_info["province_name"];
                }
                $order_list['data'][$k]['receiver_province_name'] = $province_name;
                $city = new CityModel();
                $city_info = $city->getInfo(array(
                    "city_id" => $v["receiver_city"]
                ), "*");
                if (count($city_info) > 0) {
                    $city_name = $city_info["city_name"];
                }
                $order_list['data'][$k]['receiver_city_name'] = $city_name;
                $district = new DistrictModel();
                $district_info = $district->getInfo(array(
                    "district_id" => $v["receiver_district"]
                ), "*");
                if (count($district_info) > 0) {
                    $district_name = $district_info["district_name"];
                }
                $order_list['data'][$k]['receiver_district_name'] = $district_name;
                foreach ($order_item_list as $key_item => $v_item) {
                    
                    $picture = new AlbumPictureModel();
                    // $order_item_list[$key_item]['picture'] = $picture->get($v_item['goods_picture']);
                    $goods_picture = $picture->get($v_item['goods_picture']);
                    if (empty($goods_picture)) {
                        $goods_picture = array(
                            'pic_cover' => '',
                            'pic_cover_big' => '',
                            'pic_cover_mid' => '',
                            'pic_cover_small' => '',
                            'pic_cover_micro' => '',
                            "upload_type" => 1,
                            "domain" => ""
                        );
                    }
                    $order_item_list[$key_item]['picture'] = $goods_picture;
                    if ($v_item['refund_status'] != 0) {
                        $order_refund_status = OrderStatus::getRefundStatus();
                        foreach ($order_refund_status as $k_status => $v_status) {
                            
                            if ($v_status['status_id'] == $v_item['refund_status']) {
                                $order_item_list[$key_item]['refund_operation'] = $v_status['refund_operation'];
                                $order_item_list[$key_item]['status_name'] = $v_status['status_name'];
                            }
                        }
                    } else {
                        $order_item_list[$key_item]['refund_operation'] = '';
                        $order_item_list[$key_item]['status_name'] = '';
                    }
                }
                $order_list['data'][$k]['order_item_list'] = $order_item_list;
                $order_list['data'][$k]['operation'] = '';
                // 订单来源名称
                $order_from = OrderStatus::getOrderFrom($v['order_from']);
                $order_list['data'][$k]['order_from_name'] = $order_from['type_name'];
                $order_list['data'][$k]['order_from_tag'] = $order_from['tag'];
                $order_list['data'][$k]['pay_type_name'] = OrderStatus::getPayType($v['payment_type']);
                // 根据订单类型判断订单相关操作
                if ($order_list['data'][$k]['order_type'] == 1) {
                    if ($order_list['data'][$k]['payment_type'] == 6 || $order_list['data'][$k]['shipping_type'] == 2) {
                        $order_status = OrderStatus::getSinceOrderStatus();
                    } else {
                        $order_status = OrderStatus::getOrdercommonStatus();
                    }
                } else {
                    // 虚拟订单
                    $order_status = OrderStatus::getVirtualOrdercommonStatus();
                }
                
                // 查询订单操作
                foreach ($order_status as $k_status => $v_status) {
                    
                    if ($v_status['status_id'] == $v['order_status']) {
                        $order_list['data'][$k]['operation'] = $v_status['operation'];
                        $order_list['data'][$k]['member_operation'] = $v_status['member_operation'];
                        $order_list['data'][$k]['status_name'] = $v_status['status_name'];
                        $order_list['data'][$k]['is_refund'] = $v_status['is_refund'];
                    }
                }
            }
        }
        return $order_list;
    }

    /**
     * 今日订单数据金额统计
     * @return [type] [description]
     */
    public static function accountCount($time = '1 DAY'){
        $amountSql =  'SELECT COUNT(goods_money) as money FROM ewei_order WHERE DATE_SUB(CURDATE(), INTERVAL '.$time.') <= DATE(create_time)';

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
    public static function getGoodsCount( $state = 0,$type= 'id'){
        $where = '';
        if($state != 0){
            $where = 'WHERE order_status = '.$state;
        }
        $sql = ' SELECT COUNT('.$type.') as number FROM ewei_order_goods '.$where;
        
        $row = Db::query($sql);

        return $row[0]['number'];
    }
}