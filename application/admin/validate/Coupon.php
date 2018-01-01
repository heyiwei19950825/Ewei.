<?php
namespace app\admin\validate;

use think\Validate;

class Coupon extends Validate
{
    protected $rule = [
        'coupon_name' => 'require',
        'money'       => 'require|number',
        'count'       => 'number',
        'at_least'    => 'require',
        'start_time'  => 'require',
        'end_time'    => 'require|gt:start_time',
        'thumb'       => 'require',
    ];

    protected $message = [
        'coupon_name.require' => '请输入优惠券名称',
        'money.require'       => '请输入面值',
        'at_least.require'    => '请输入消费金额',
        'money.number'        => '面额必须是数字',
        'count.number'        => '个数必须是数字',
        'start_time.require'  => '请输入开始时间',
        'end_time.require'    => '请输入结束时间',
        'end_time.gt'         => '结束时间必须大于开始时间',
        'thumb.require'       => '请上传缩略图',
    ];
}