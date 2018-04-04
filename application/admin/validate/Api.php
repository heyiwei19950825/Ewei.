<?php
namespace app\admin\validate;

use think\Validate;

class Api extends Validate
{
    protected $rule = [
        'name'   => 'require',
        'api' => 'require',
        'type'  => 'require',
        'key'  => 'require'
    ];

    protected $message = [
        'name.require'   => '请输入接口名称',
        'api.require' => '请输入接口地址',
        'type.require'  => '请选择接口访问类型',
        'key.require'  => '请接口关键字',
    ];
}