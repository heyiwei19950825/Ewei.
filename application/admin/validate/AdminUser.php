<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 管理员验证器
 * Class AdminUser
 * @package app\admin\validate
 */
class AdminUser extends Validate
{
    protected $rule = [
        'name'             => 'require|unique:admin_user',
        'username'         => 'require|unique:admin_user',
        'password'         => 'confirm:confirm_password',
        'confirm_password' => 'confirm:password',
        'status'           => 'require',
        'group_id'         => 'require'
    ];

    protected $message = [
        'name.require'             => '请输入用户名',
        'name.unique'              => '用户名已存在',
        'username.require'         => '请输入登录账户',
        'username.unique'          => '登录账户已存在',
        'password.confirm'         => '两次输入密码不一致',
        'confirm_password.confirm' => '两次输入密码不一致',
        'status.require'           => '请选择状态',
        'group_id.require'         => '请选择所属权限组'
    ];
}