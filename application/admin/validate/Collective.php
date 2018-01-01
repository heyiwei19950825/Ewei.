<?php
namespace app\admin\validate;

use think\Validate;

class Goods extends Validate
{
    protected $rule = [
        'state'       => 'require|number',
        'goods_id'    => 'require|number',
        'user_number' => 'require|number',
        'goods_price' => 'require|number',
        'time'        => 'require|number',
        'start_time'  => 'require|number',
        'end_time'    => 'require|number',
    ];

    protected $message = [
        'cid.require'   => '请选择所属栏目',
        'name.require' => '请输入标题',
        'sort.require'  => '请输入排序',
        'sort.number'   => '排序只能填写数字'
    ];
}