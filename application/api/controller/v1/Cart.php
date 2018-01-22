<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/1/22
 * Time: 22:26
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\service\Cart as CartService;
use app\api\service\Token;
use app\api\validate\Cart as CartValidate;
use app\api\model\Cart as CartModel;

use think\Request;

class Cart extends BaseController
{

    public function index(){
        $uid = Token::getCurrentUid();
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];
        //获取购物车商品列表
        $data  = CartModel::getCartAll($uid);
        //统计购物车商品数据
        $count = CartModel::cartCount($uid);

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
     *  添加购物车 信息
     */
    public function add(){
        $request = Request::instance();
        $params = $request->param();

        (new CartValidate())->goCheck();
        $uid = Token::getCurrentUid();

        $cart = new CartService();
        $row = $cart->add($uid, $params);

        $row['data'] = [
            'openAttr' => false,
            'cartTotal'=>[
                'goodsCount' => CartModel::cartCount($uid)['goodsCount'],
            ]
        ];
        return $row;
    }

    /**
     * 统计购物车中商品数量
     * @return array
     */
    public function goodsCount(){
        $uid = Token::getCurrentUid();
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];
        $row['data'] = [
            'cartTotal'=>[
                'goodsCount' => CartModel::cartCount($uid)['goodsCount'],
            ]
        ];

        return $row;
    }
}