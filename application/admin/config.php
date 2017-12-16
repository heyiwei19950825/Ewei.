<?php

return [
    // +----------------------------------------------------------------------
    // | 后台模板设置
    // +----------------------------------------------------------------------

    'template' => [
        // 模板路径
        'view_path' => '../themes/admin/',
         // 默认输出类型
	    'default_return_type'    => 'html',
	    // 默认AJAX 数据返回格式,可选json xml ...
	    'default_ajax_return'    => 'json',

        // auth配置
	    'auth'                   => [
	        // 权限开关
	        'auth_on'           => 1,
	        // 认证方式，1为实时认证；2为登录认证。
	        'auth_type'         => 1,
	        // 用户组数据不带前缀表名
	        'auth_group'        => 'auth_group',
	        // 用户-用户组关系不带前缀表
	        'auth_group_access' => 'auth_group_access',
	        // 权限规则不带前缀表
	        'auth_rule'         => 'auth_rule',
	        // 用户信息不带前缀表
	        'auth_user'         => 'admin_user',
	    ],

	    // 全站加密密钥（开发新站点前请修改此项）
	    'salt'                   => '1dFlxLhiuLqnUZe9kA',

	    // 验证码配置
	    'captcha'                => [
	        // 验证码字符集合
	        'codeSet'  => '2345678abcdefhijkmnpqrstuvwxyzABCDEFGHJKLMNPQRTUVWXY',
	        // 验证码字体大小(px)
	        'fontSize' => 22,
	        // 是否画混淆曲线
	        'useCurve' => true,
	        // 验证码位数
	        'length'   => 4,
	        // 验证成功后是否重置
	        'reset'    => true
	    ],


	    // +----------------------------------------------------------------------
	    // | 模板设置
	    // +----------------------------------------------------------------------

	    // 手机模板开启
    	'mobile_theme'          => false,

    	// 视图输出字符串内容替换
	    'view_replace_str'      => [
	        '__UPLOAD__' => '/public/uploads',
	        '__STATIC__' => '/public/static',
	        '__IMAGES__' => '/public/static/images',
	        '__JS__'     => '/public/static/js',
	        '__CSS__'    => '/public/static/css',
	    ],

	    // +----------------------------------------------------------------------
	    // | Trace设置 开启 app_trace 后 有效
	    // +----------------------------------------------------------------------
	    'trace' => [
	        // 内置Html Console 支持扩展
	        'type' => 'Html',
	    ],

	]

];