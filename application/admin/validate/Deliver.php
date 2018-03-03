<?php
namespace app\admin\validate;

use think\Validate;

class Deliver extends Validate
{
    protected $rule = [
        'order_no'  =>'require|number',
        'express_name'   => 'require',
        'express_no' => 'require',
        'express_company'  => 'require',
        'shipping_time'  => 'require',
        'goods_list'  => 'require'
    ];

    protected $message = [
        'order_id.require'   => '没有指定订单',
        'express_name.require'   => '必须填写包裹名称',
        'express_no.require' => '必须填写订单号',
        'express_company.require'  => '必须选择快递公司',
        'shipping_time.number'   => '必须填写发货时间',
        'goods_list.number'   => '必须选取发送的商品'
    ];
}