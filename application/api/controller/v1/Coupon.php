<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/1/29
 * Time: 0:38
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\Coupon as CouponModel;
use app\api\service\Token;


class Coupon extends  BaseController
{
    public $uid = '';

    public function _initialize()
    {
        parent::_initialize();
        $this->uid = Token::getCurrentUid();
    }

    /**
     * 获取用户优惠券列表
     * @return array
     */
    public function getUserList(){
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];
        $row['data'] = CouponModel::userCoupon( $this->uid);

        return $row;
    }
}