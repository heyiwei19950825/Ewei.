<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/1/22
 * Time: 22:26
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\UserAddress;
use app\api\service\Cart as CartService;
use app\api\service\Token;
use app\api\validate\Cart as CartValidate;
use app\api\model\Cart as CartModel;
use app\api\model\Region;
use app\api\model\Coupon;
use app\api\model\Goods;
use app\api\model\Express;
use think\Db;


class Cart extends BaseController
{
    public $uid = '';

    public function _initialize()
    {
        parent::_initialize();
        $this->uid = Token::getCurrentUid();
    }

    public function index(){
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];
        //获取购物车商品列表
        $data  = CartModel::getCartAll($this->uid );
        //统计购物车商品数据
        $count = CartModel::cartCount($this->uid );

        $row['data'] = [
            'cartList' => $data,
            'cartTotal'=>[
                'goodsCount' => $count['goodsCount'],
                'goodsAmount' => $count['goodsAmount'],
                'checkedGoodsAmount' => $count['checkedGoodsAmount'],
                'checkedGoodsCount' => $count['checkedGoodsCount'],
            ]
        ];

        return $row;
    }

    /**
     * 修改购物车
     * @return array
     */
    public function updateCarts(){
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];
        $params = $this->request->param();
        (new CartValidate())->goCheck();

        $params['uid'] = $this->uid;
        $data = CartModel::updateNumber( $params);
        if( $data != 1 ){
            $row['errmsg'] = '网络异常';
            $row['errno']  = 20001;
        }
        return $row;

    }
    /**
     * 全选购物车
     * @return array
     */
    public function checked(){
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];
        $params = $this->request->param();
        (new CartValidate())->goCheck();

        $params['uid'] = $this->uid;

        $data = CartModel::updateChecked($params);
        //获取购物车商品列表
        $cartData  = CartModel::getCartAll($this->uid );
        //统计购物车商品数据
        $cartCount = CartModel::cartCount($this->uid );

        $row['data'] = [
            'cartList' => $cartData,
            'cartTotal'=>[
                'goodsCount' => $cartCount['goodsCount'],
                'goodsAmount' => $cartCount['goodsAmount'],
                'checkedGoodsAmount' => $cartCount['checkedGoodsAmount'],
                'checkedGoodsCount' => $cartCount['checkedGoodsCount'],
            ]
        ];

        if( $data != 1 ){
            $row['errmsg'] = '网络异常';
            $row['errno']  = 20001;
        }
        return $row;
    }

    /**
     * 删除购物车
     * @return array
     */
    public function deleteCarts(){
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];
        $params = $this->request->param();
        (new CartValidate())->goCheck();


        $params['uid'] = $this->uid;
        $data = CartModel::deleteCart($params);

        //获取购物车商品列表
        $cartData  = CartModel::getCartAll($this->uid );
        //统计购物车商品数据
        $cartCount = CartModel::cartCount($this->uid );

        $row['data'] = [
            'cartList' => $cartData,
            'cartTotal'=>[
                'goodsCount' => $cartCount['goodsCount'],
                'goodsAmount' => $cartCount['goodsAmount'],
                'checkedGoodsAmount' => $cartCount['checkedGoodsAmount'],
                'checkedGoodsCount' => $cartCount['checkedGoodsCount'],
            ]
        ];


        if( $data != 1 ){
            $row['errmsg'] = '网络异常';
            $row['errno']  = 20001;
        }
        return $row;
    }


    /**
     *  添加购物车 信息
     */
    public function add(){
        $params = $this->request->param();
        (new CartValidate())->goCheck();


        $cart = new CartService();
        $row = $cart->add($this->uid , $params);

        $row['data'] = [
            'openAttr' => false,
            'cartTotal'=>[
                'goodsCount' => CartModel::cartCount($this->uid )['goodsCount'],
            ]
        ];
        return $row;
    }

    /**
     * 统计购物车中商品数量
     * @return array
     */
    public function goodsCount(){
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];
        $row['data'] = [
            'cartTotal'=>[
                'goodsCount' => CartModel::cartCount($this->uid)['goodsCount'],
            ]
        ];

        return $row;
    }

    /**
     * 确认购物车
     * @return array
     */
    public function checkoutCarts(){
        //初始化数据
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];
        $goodsTotalPrice = $orderTotalPrice = $actualPrice= $freightPrice = $couponPrice = $couponId = $rankDiscount = $userCouponList = $couponPrice = 0;
        ;
        $freight = $goodsInfo = $checkedCoupon = [];
        $nowTime = date('Y-m-d',time());
        $couponId = $this->request->param('couponId');//使用的优惠券ID
        $addressId = $this->request->param('addressId');//收货地址
        $goodsId = $this->request->param('goodsId');//商品ID
        $num = $this->request->param('num');//商品ID
        $userInfo = Db::name('user')->alias('u')->join('user_rank r','u.rank_id = r.rank_id','LEFT')->where(['u.id'=>$this->uid])->find();//用户信息


        //数据验证
        (new CartValidate())->goCheck();


        //购物车商品列表
        if($goodsId == 0 ){
            $cartList = CartModel::getCartAll($this->uid,true);
        }else{
            $field = '';
            $goods = Goods::getProductDetail($goodsId,$field);
            $goods['num'] = $num;
            $goods['price'] = $goods['sp_price'];
            $goods['goods_id'] = $goods['id'];
            $goods['goods_name'] = $goods['name'];
            $goods['thumb'] = self::prefixDomain($goods['thumb']);
            $goods['goods_picture'] = $goods['thumb'];
//            $goods['goods_picture'] = $goods['shop_name'];
            $goods['shop_id'] = $goods['sid'];
            $cartList[] = $goods;
        }
//    var_dump($cartList);die;
        //收货地址
        $userAddressModel = new UserAddress();
        if( $addressId == 0){
           $addressMap = ['user_id'=>$this->uid,'is_default'=>1];
          
        }else{
            $addressMap = ['user_id'=>$this->uid,'id'=>$addressId];
        }

        $address = $userAddressModel->where($addressMap)->find();
        if( !empty($address) ){
            $address['province_name'] = Region::getRegionName($address['province_id']);
            $address['city_name'] = Region::getRegionName($address['city_id']);
            $address['district_name'] = Region::getRegionName($address['district_id']);
            $address['full_region'] = $address['province_name'] . $address['city_name'] . $address['district_name'];
        }else{
            $address = ['id'=>0];
        }


        //优惠券 总数
        $couponNumber = Coupon::countCoupon( $this->uid);
        if( $couponId != 0 ){
            //选中的优惠券信息
            $checkedCoupon = Coupon::getInfoById($this->uid,$couponId);
            $couponPrice = $checkedCoupon['money']*100;
        }


        //计算价格
        foreach ($cartList as $item) {
            //商品总价格
            $goodsTotalPrice += ($item['price']*100) * $item['num'];
            $goodsInfo = Goods::getProductDetail($item['goods_id'],'eid');
            if( !array_key_exists($goodsInfo['eid'],$freight)){
                //运费
                $express = Express::getDetail($goodsInfo['eid'],'cost,company_name');
                $freight[$goodsInfo['eid']] = array(
                    'name' => $express['company_name'],
                    'cost'=>$express['cost']*100,
                );
            }
        }
        //计算运费
        foreach ($freight as $item ){
            $freightPrice += $item['cost']+0;
        }

        //计算 会员等级获得优惠价格折扣
        if( $userInfo['rank_id'] != 0){
            $rankDiscount = $goodsTotalPrice*100 - ($goodsTotalPrice* ($userInfo['rank_discount'])*10);
        }

        //最后商品订单价格   商品总价格 + 运费 - 会员折扣
        $actualPrice = $goodsTotalPrice - ($rankDiscount/100) + $freightPrice - $couponPrice;
        $row['data'] = [
            'checkedAddress'=>$address,//收货地址
            'checkedGoodsList'=> $cartList,//购物车列表
            'checkedCoupon'=>$checkedCoupon,//选中的优惠券ID
            'couponNumber'=>$couponNumber,//优惠券数量
            'rankDiscount' => round($rankDiscount/10000,2),//会员折扣
            'goodsTotalPrice'=>$goodsTotalPrice/100,//商品总价
            'orderTotalPrice'=>$orderTotalPrice,//订单价格
            'actualPrice'=>round($actualPrice/100,2),//最后的价格
            'freightPrice' => round($freightPrice/100,2),//运费
            'couponPrice' => $couponPrice/100,//优惠券价格
        ];


        return $row;
    }



}