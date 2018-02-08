<?php
/**
 * Created by 七月.
 * Author: 七月
 * 微信公号：小楼昨夜又秋风
 * 知乎ID: 七月在夏天
 * Date: 2017/2/22
 * Time: 21:52
 */

namespace app\api\controller\v1;

use app\api\controller\BaseController;
use app\api\model\Order as OrderModel;
use app\api\service\Order as OrderService;
use app\api\service\Token;
use app\api\validate\IDMustBePositiveInt;
use app\api\validate\OrderPlace;
use app\api\validate\PagingParameter;
use app\lib\exception\OrderException;
use app\lib\exception\SuccessMessage;
use think\Controller;

use app\api\model\GoodsCollective as GoodsCollectiveModel;
use app\api\model\UserAddress;
use app\api\model\Goods as GoodsModel;
use app\api\model\Region;
use app\api\model\Express;
use app\api\model\Shop;
use app\api\model\User;
use app\api\model\Cart as CartModel;
use app\api\model\Coupon;
use think\Request;
use think\Db;


class Order extends BaseController
{
    protected $beforeActionList = [
        'checkExclusiveScope' => ['only' => 'placeOrder'],
        'checkPrimaryScope' => ['only' => 'getDetail,getSummaryByUser'],
        'checkSuperScope' => ['only' => 'delivery,getSummary']
    ];

    public $uid = '';

    public function _initialize()
    {
        parent::_initialize();
        $this->uid = Token::getCurrentUid();
    }
    
    /**
     * 下单
     * @url /order
     * @HTTP POST
     */
//    public function placeOrder()
//    {
//        (new OrderPlace())->goCheck();
//        $products = input('post.products/a');
//        $uid = Token::getCurrentUid();
//        $order = new OrderService();
//        $status = $order->place($uid, $products);
//        return $status;
//    }
    public function placeOrder(){
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];
        $finish_time = $pay_time  = 0;
        $order_status = 1;

        $goodsId = $this->request->param('goodsId',0);
        $num = $this->request->param('num',0);
        $addressId = $this->request->param('addressId',0);
        $type = $this->request->param('type','default');


        //收货地址
        $userAddressModel = new UserAddress();
        if( $addressId != 0 ){
            $addresssMap = ['id'=>$addressId,'user_id'=>$this->uid];
        }else{
            $addresssMap = ['is_default'=>1,'user_id'=>$this->uid];
        }
        $address = $userAddressModel->where($addresssMap)->find();
        $addressOld = $address->toArray();

        //没有添加收货地址
        if( empty($addressOld)){
            $row = ['errmsg'=>'请选择或创建收货地址','errno'=>1,'data'=>[]];
            return $row;
        }


        if( !empty($address) ){
            $address['province_name'] = Region::getRegionName($address['province_id']);
            $address['city_name'] = Region::getRegionName($address['city_id']);
            $address['district_name'] = Region::getRegionName($address['district_id']);
            $address['full_region'] = $address['province_name'] . $address['city_name'] . $address['district_name'];
        }else{
            $address = ['id'=>0];
        }


        //获取用户信息
        $userInfo = Db::name('user')->alias('u')->join('user_rank r','u.rank_id = r.rank_id','LEFT')->where(['u.id'=>$this->uid])->find();//用户信息


        //获取商品详情
        if( $goodsId == 0 ){
            $goodsPrice = $orderTotalPrice = $actualPrice= $freightPrice = $couponPrice = $couponId = $rankDiscount = $userCouponList = $couponPrice = $shipping_company_id = $order_type = 0;
            $couponId = $this->request->param('couponId');//使用的优惠券ID

            $freight = $goodsInfo = $checkedCoupon = [];
            $cartList = CartModel::getCartAll($this->uid,true);
            //优惠券 总数
            if( $couponId != 0 ){
                //选中的优惠券信息
                $checkedCoupon = Coupon::getInfoById($this->uid,$couponId);
                $couponPrice = $checkedCoupon['money']*100;
                Coupon::updateCoupon($couponId);
            }

            //计算价格
            foreach ($cartList as $item) {
                //商品总价格
                $goodsPrice += ($item['price']*100) * $item['num'];
                $goodsInfo = GoodsModel::getProductDetail($item['goods_id'],'eid');
                if( !array_key_exists($goodsInfo['eid'],$freight)){
                    //运费
                    $express = Express::getDetail($goodsInfo['eid'],'cost,company_name,id');
                    $freight[$goodsInfo['eid']] = array(
                        'name' => $express['company_name'],
                        'cost'=>$express['cost']*100,
                    );
                }
                $shipping_company_id = $express['id'];
            }
            //计算运费
            foreach ($freight as $item ){
                $freightPrice += $item['cost']+0;
            }

            //计算 会员等级获得优惠价格折扣
            if( $userInfo['rank_id'] != 0){
                $rankDiscount = $goodsPrice*100 - ($goodsPrice* ($userInfo['rank_discount'])*10);
            }

            //最后商品订单价格   商品总价格 + 运费 - 会员折扣
            $actualPrice = $goodsPrice - ($rankDiscount/100) + $freightPrice - $couponPrice;

            $order_type = 0;
            $goodsPrice =$goodsPrice/100;
            $actualPrice = round($actualPrice/100,2);
        }else{
            $goodsPrice = 0;
            $field = '';
            $product = GoodsModel::getProductDetail($goodsId,$field);
            $product['thumb'] = self::prefixDomain($product['thumb']);
            
            //判断是否团购或者是积分购买
            if( $type == 'integral'){
                if($product['is_integral'] == 0 ){
                    $row['errmsg'] = '非法请求';
                    $row['errno']  = 10001;
                    return  $row;
                }
                $goodsIntegral = $product['sp_integral'];
                $order_type = 2;
                if($userInfo['integral'] < $goodsIntegral){
                    $row = ['errmsg'=>'积分不足','errno'=>1,'data'=>[]];

                    return $row;
                }

                $goodsPrice = 0;
            }elseif( $type == 'collective'){
                if($product['is_collective'] == 0 ){
                    $row['errmsg'] = '非法请求';
                    $row['errno']  = 10001;
                    return  $row;
                }
                //团购信息
                $product['collective'] = GoodsCollectiveModel::getCollectiveByGid($product['id']);
                $goodsPrice = $product['collective']['goods_price'] * $num;

                $order_type = 1;
            }

            //运费
            $express = Express::getDetail($product['eid'],'cost,company_name,id');
            $freightPrice = $express['cost'];
            $shipping_company_id = $express['id'];

            //最终价格   商品价格 + 运费
            $actualPrice = $goodsPrice + ($express['cost']+0);
            //查询商家信息
            $shopName = Shop::getShopInfoById($product['sid'],'shop_name');

        }

        //检测 并扣除用户积分
        if($goodsPrice ==0 && $type=='integral' && ($freightPrice+0) == 0){
            $integralRow = User::updateUserIntegral($this->uid,$goodsIntegral,0);
            if( $integralRow == 1 ){
                $finish_time = time();
                $pay_time = time();
                $order_status = 2;
            }
        }



        //创建成功添加订单信息
        $param = [
            'shipping_type' => 1,//订单配送方式
            'order_from'  => '小程序',//订单来源
            'order_no'  => date('YmdHis',time()).rand(1000,9999),//订单编号
            'out_trade_no'  => '',//外部交易号
            'order_type'  => $order_type,//订单类型
            'payment_type'  => 1,//支付类型。取值范围：1.WEIXIN (微信支付) 2.INTEGRAL (积分支付)
            'buyer_id' => $this->uid,//买家id
            'user_name' => $userInfo['nickname'],//买家会员名称
            'buyer_ip' => Request::ip(0,true),//买家ip
            'buyer_message' => '',//买家附言
            'receiver_mobile' => $addressOld['mobile'],//收货人的手机号码
            'receiver_province' => $addressOld['province_id'],//收货人所在省
            'receiver_city' => $addressOld['city_id'],//收货人所在城市
            'receiver_district' => $addressOld['district_id'],//收货人所在街道
            'receiver_address' => $addressOld['address'],//收货人详细地址
            'receiver_zip' => '0000',//收货人邮编
            'receiver_name' => $address['name'],//收货人姓名
//            'shop_id' => $product['sid'],//卖家店铺id
//            'shop_name' => $shopName['shop_name'],//卖家店铺名称
            'seller_memo' => '',//卖家对订单的备注
            'goods_money' => $goodsPrice,//商品总价
            'order_money' => $actualPrice,//订单总价
            'point'=>$order_type == 2?$goodsIntegral:0,//订单消耗积分
            'point_money'=>0,//订单消耗积分抵多少钱
            'coupon_money'=>0,//订单代金券支付金额
            'coupon_id'=>0,//订单代金券id
            'user_money'=>0,//订单余额支付金额
            'user_platform_money'=>0,//用户平台余额支付
            'promotion_money'=>0,//订单优惠活动金额
            'shipping_money'=>$freightPrice/100,//订单运费
            'pay_money'=>0,//订单实付金额
            'refund_money'=>'',//订单退款金额
//            'give_point'=>$product['give_integral'],//订单赠送积分
            'order_status'=>$order_status,//订单状态
            'pay_status'=>'0',//订单付款状态
            'shipping_status'=>'0',//订单配送状态
            'shipping_company_id'=>0,//配送物流公司ID
            'give_point_type'=>'',//积分返还类型 1 订单完成  2 订单收货 3  支付订单
            'pay_time'=>$pay_time,//订单付款时间
            'sign_time'=>'',//买家签收时间
            'consign_time'=>'',//卖家发货时间
            'create_time'=>time(),//订单创建时间
            'finish_time'=>$finish_time,//订单完成时间
            'is_deleted'=>'',//订单是否已删除
            'operator_type'=>'',//操作人类型  1店铺  2用户
            'operator_id'=>'',//操作人id
            'refund_balance_money'=>'',//订单退款余额
            'fixed_telephone'=>'',//固定电话
        ];
        $orderId = OrderModel::addOrder($param);

        //检测订单是否添加成功
        if( $orderId == 0 ){
            $row = ['errmsg'=>'添加订单信息错误','errno'=>1,'data'=>[]];
            return $row;
        }
        //添加订单关联商品
        if( $goodsId == 0 ){
            foreach ($cartList as $product){
                $data = [
                    'order_id'=>$orderId,//
                    'goods_id'=>$product['id'],
                    'goods_name'=>$product['goods_name'],
                    'price'=>$product['price'],//商品价格
                    'cost_price'=>$product['price'],//商品成本价
                    'num'=>$product['num'],//购买数量
                    'goods_money'=>$product['price']*$product['num'],//商品总价
                    'goods_picture'=>$product['goods_picture'],//商品图片
                    'shop_id'=>$product['shop_id'],//商铺ID
                    'buyer_id'=>$this->uid,//用户ID
                    'point_exchange_type'=>0,//积分兑换类型0.非积分兑换1.积分兑换
                    'goods_type'=>1,//商品类型
                    'order_type'=>$param['order_type'],//订单类型
                    'order_status'=>$param['order_status'],//订单状态
//                    'give_point'=>$param['give_point'],//订单赠送积分
                    'shipping_status'=>$param['shipping_status'],//订单配送状态
                ];

                Db::name('order_product')->insert($data);
            }
        }else{
            $data = [
                'order_id'=>$orderId,//
                'goods_id'=>$product['id'],
                'goods_name'=>$product['name'],
                'price'=>$product['sp_price'],//商品价格
                'cost_price'=>$product['sp_price'],//商品成本价
                'num'=>$num,//购买数量
                'goods_money'=>$goodsPrice,//商品总价
                'goods_picture'=>$product['thumb'],//商品图片
                'shop_id'=>$product['sid'],//商铺ID
                'buyer_id'=>$this->uid,//用户ID
                'point_exchange_type'=>0,//积分兑换类型0.非积分兑换1.积分兑换
                'goods_type'=>1,//商品类型
                'order_type'=>$param['order_type'],//订单类型
                'order_status'=>$param['order_status'],//订单状态
//                'give_point'=>$param['give_point'],//订单赠送积分
                'shipping_status'=>$param['shipping_status'],//订单配送状态
            ];
            Db::name('order_product')->insert($data);
        }

        //团购添加
        if( $type == 'collective' ) {
            $data = [
                'order_id' => $orderId,
                'uid'=>$this->uid,
                'gid' => $goodsId,
                'gid' => $goodsId,
                'num' => $num,
                'u_name' => $userInfo['nickname'],
                'u_portrait' => $userInfo['portrait'],
                'limit_time' => $product['collective']['time'],
                'add_time' => time(),
                'identity' => 1
            ];
            Db::name('user_collective')->insert($data);
        }

        $row['data'] = [
            'orderInfo' => [
                'order_sn'=> $param['order_no'],
                'user_id'=> $param['buyer_id'],
                'consignee'=>$param['receiver_name'],//收件人
                'mobile'=> $param['receiver_mobile'],//手机号
                'province'=> $param['receiver_province'],
                'city'=> $param['receiver_city'],
                'address'=> $param['receiver_district'],
                'freight_price'=> $param['shipping_money'],
                'coupon_id'=> 0,
                'coupon_price'=> 0,
                'add_time'=> time(),
                'goods_price'=> $param['goods_money'],
                'order_price'=> $param['order_money'],
                'actual_price'=> $param['order_money'],
                'id' => $orderId
            ]
        ];
        return $row;
    }

    /**
     * 获取订单详情
     * @param $id
     * @return static
     * @throws OrderException
     * @throws \app\lib\exception\ParameterException
     */
    public function getDetail($id)
    {
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];
        $note = [1=>'未支付',2=>'已支付'];

        (new IDMustBePositiveInt())->goCheck();
        $orderDetail = OrderModel::get($id);
        if (!$orderDetail)
        {
            throw new OrderException();
        }
        $orderDetail['order_status_text'] = $note[$orderDetail['order_status']];

        $address['province_name'] = Region::getRegionName($orderDetail['receiver_province']);
        $address['city_name'] = Region::getRegionName($orderDetail['receiver_city']);
        $address['district_name'] = Region::getRegionName($orderDetail['receiver_district']);
        $orderDetail['full_region'] = $address['province_name'] . $address['city_name'] . $address['district_name'];

        $orderDetail->hidden(['prepay_id']);
        $orderGoods = Db::name('order_product')->where(['order_id'=>$orderDetail['id']])->select()->toArray();
        $row['data'] =[
            'orderInfo'=>$orderDetail,
            'orderGoods' => $orderGoods,
            'handleOption' => $orderDetail['order_status'] == 1 ? true:false
        ];

        return $row;
    }

    /**
     * 删除订单
     * @return [type] [description]
     */
    public function delOrder(){
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];
        (new IDMustBePositiveInt())->goCheck( $id );
        $orderDetail = OrderModel::del($id);

        return $row;
    }



























    /**
     * 根据用户id分页获取订单列表（简要信息）
     * @param int $page
     * @param int $size
     * @return array
     * @throws \app\lib\exception\ParameterException
     */
    public function getSummaryByUser($page = 1, $size = 15)
    {
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];

//        (new PagingParameter())->goCheck();
        $uid = Token::getCurrentUid();
        $pagingOrders = OrderModel::getSummaryByUser($uid, $page, $size);

        if ( empty($pagingOrders) )
        {
            $row = ['errmsg'=>'暂无数据','errno'=>1,'data'=>[]];
        }

        $row['data'] = $pagingOrders;
        return $row;


    }

    /**
     * 获取全部订单简要信息（分页）
     * @param int $page
     * @param int $size
     * @return array
     * @throws \app\lib\exception\ParameterException
     */
    public function getSummary($page=1, $size = 20){
        (new PagingParameter())->goCheck();
//        $uid = Token::getCurrentUid();
        $pagingOrders = OrderModel::getSummaryByPage($page, $size);
        if ($pagingOrders->isEmpty())
        {
            return [
                'current_page' => $pagingOrders->currentPage(),
                'data' => []
            ];
        }
        $data = $pagingOrders->hidden(['snap_items', 'snap_address'])
            ->toArray();
        return [
            'current_page' => $pagingOrders->currentPage(),
            'data' => $data
        ];
    }

    public function delivery($id){
        (new IDMustBePositiveInt())->goCheck();
        $order = new OrderService();
        $success = $order->delivery($id);
        if($success){
            return new SuccessMessage();
        }
    }
}






















