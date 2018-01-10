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
	// public function getOrderAll( $param ){
	// 	//初始化数据
	// 	$data = [];
	// 	$map  = [];
	// 	$map2  = [];
	// 	$param['page'] = empty($param['page'])?1:$param['page'];
	// 	$data['param'] = $param;

	// 	//条件参数判断添加
	// 	if( !empty($param['user_name'])){
 //        }else{
 //        	$data['param']['user_name'] = '';
 //        }
 //        if( !empty($param['user_phone'])){
 //        }else{
 //        	$data['param']['user_phone'] = '';
 //        }
 //        // echo $this->unicode_encode($param['keyword']);die;
 //        if( !empty($param['keyword'])){
 //        	// $map['snap_items'] =['like', "%".$this->unicode_encode($param['keyword'])."%"];
 //        	$map['snap_name'] =['like', "%{$param['keyword']}%"];
 //        }else{
 //        	$data['param']['keyword'] = '';
 //        }
 //        //开始时间
 //        if( !empty($param['start_time'])){
 //        	$map['create_time'] =['>', strtotime(urldecode($param['start_time']))];
 //        	$data['param']['start_time'] = $param['start_time'];
 //        }else{
 //        	$data['param']['start_time'] = '';
 //        }
 //        //结束时间
 //        if( !empty($param['end_time'])){
 //        	$map2['create_time'] =['<', strtotime(urldecode($param['end_time']))];
 //        	$data['param']['end_time'] = $param['end_time'];
 //        }else{
 //        	$data['param']['end_time'] = '';
 //        }

 //        //状态查询
 //        if(!empty($param['status'])){
 //        	$map['status']=$param['status'];
 //        }
 //        //用户名称
 //        if( !empty($param['user_name'])){
 //        	$userWhere['nickname'] = ['like',"%{$param['user_name']}%"];
 //        }

 //       	//用户手机号
 //        if( !empty($param['user_name'])){
 //        	$userWhere['mobile']   = ['like',"%{$param['user_phone']}%"];
 //        }
 //        if(  !empty($param['user_name']) ||  !empty($param['user_phone'])){
 //        	$map['user_id'] = Db::name('user')->field('id')
 //        	->where($userWhere)
 //        	->find()['id'];
 //        }
        

	// 	//数据查询
	// 	$order_list = $this->order(['create_time' => 'DESC'])
	// 		->where($map)
	// 		->where($map2)
	// 		->paginate(15, false, ['page' => $param['page']])->toArray();
	// 		// echo $this->getLastSql();die;
	// 	//分页使用
	// 	$data['page'] = $this->order(['create_time' => 'DESC'])
	// 		->field('id')
	// 		->where($map)
	// 		->paginate(15, false, ['page' => $param['page']])->render();


	// 	$data['data'] = [];
	// 	foreach ($order_list['data'] as $key => $value) {
	// 		$data['data'][$key] = $value;
	// 		//处理收货地址信息
	// 		$data['data'][$key]['snap_address'] = json_decode($value['snap_address'],true);
	// 		//订单内商品信息
	// 		$data['data'][$key]['snap_items'] = json_decode($value['snap_items'],true);

	// 		//根据 user_id查询用户名称和手机号
	// 		$data['data'][$key]['user'] = Db::name('user')->field('nickname,mobile')->find($value['user_id']);

	// 		//订单状态名称修改
	// 		switch ($value['status']) {
	// 			case 1:
	// 				$data['data'][$key]['status'] = '未支付';
	// 				break;
	// 			case 2:
	// 				$data['data'][$key]['status'] = '已支付';
					
	// 				break;
	// 			case 3:
	// 				$data['data'][$key]['status'] = '已发货';
	// 				break;
	// 			case 4:
	// 				$data['data'][$key]['status'] = '已支付[库存不足]';
	// 				break;
	// 			case 5:
	// 				$data['data'][$key]['status'] = '已完成';
	// 				break;
	// 			case 6:
	// 				$data['data'][$key]['status'] = '已关闭';
	// 				break;
	// 			case 7:
	// 				$data['data'][$key]['status'] = '订单异常';
	// 				break;
	// 			default:
	// 				$data['data'][$key]['status'] = '订单异常';
	// 				break;
	// 		}
	// 	}

	// 	return $data;
	// }

    // function unicode_encode($name)  
    // {  
    //     $name = iconv('UTF-8', 'UCS-2', $name);  
    //     $len = strlen($name);  
    //     $str = '';  
    //     for ($i = 0; $i < $len - 1; $i = $i + 2)  
    //     {  
    //         $c = $name[$i];  
    //         $c2 = $name[$i + 1];  
    //         if (ord($c) > 0)  
    //         {    // 两个字节的文字  
    //             $str .= '\u'.base_convert(ord($c), 10, 16).base_convert(ord($c2), 10, 16);  
    //         }  
    //         else  
    //         {  
    //             $str .= $c2;  
    //         }  
    //     }  
    //     return $str;  
    // } 

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




}