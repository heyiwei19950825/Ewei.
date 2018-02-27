<?php
$root = \think\Request::instance()->root();

$root = str_replace('/index.php', '', $root);
define("__ROOT__", $root);


define("REWRITE_MODEL", false); // 设置伪静态
                                // 入口文件,系统未开启伪静态
$rewrite = REWRITE_MODEL;
if (! $rewrite) {
    define('__URL__', \think\Request::instance()->domain() . \think\Request::instance()->baseFile());
} else {
    // 系统开启伪静态
    if (empty($root)) {
        define('__URL__', \think\Request::instance()->domain());
    } else {
        define('__URL__', \think\Request::instance()->domain() . \think\Request::instance()->root());
    }
}
define('UPLOAD', "uploads"); // 上传文件路径
define('ADMIN_MODULE', "admin"); // 重新定义后台模块

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
        // 是否开启路由
        'url_route_on'           => true,
        // 是否强制使用路由
        'url_route_must'         => false,


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
	        'ADMIN_IMG' => __ROOT__ . '/public/admin/images',
	        'ADMIN_CSS' => __ROOT__ . '/public/admin/css',
	        'ADMIN_JS' => __ROOT__ . '/public/admin/js',
	        'PLATFORM_IMG' => __ROOT__ . '/public/platform/images',
	        'PLATFORM_CSS' => __ROOT__ . '/public/platform/css',
	        'PLATFORM_JS' => __ROOT__ . '/public/platform/js',
	        '__TEMP__' => __ROOT__ . '/template',
	        '__ROOT__' => __ROOT__,
	        'UPLOAD_URL' => __URL__ . '/' . ADMIN_MODULE,
	        'PLATFORM_MAIN' => __URL__ . '/platform',
	        'ADMIN_MAIN' => __URL__ . '/' . ADMIN_MODULE,
	        'APP_MAIN' => __URL__ . '/wap',
	        'SHOP_MAIN' => __URL__ . '',
	        '__UPLOAD__' => __ROOT__,
	        '__MODULE__' => '/' . ADMIN_MODULE,
	        '__ADDONS__' => __ROOT__ . '/addons', // 插件目录
	                                          
	        // 上传文件路径
	        'UPLOAD_GOODS' => UPLOAD . '/goods/', // 存放商品图片主图
	        'UPLOAD_GOODS_SKU' => UPLOAD . '/goods_sku/', // 存放商品sku图片
	        'UPLOAD_GOODS_BRAND' => UPLOAD . '/goods_brand/', // 存放商品品牌图
	        'UPLOAD_GOODS_GROUP' => UPLOAD . '/goods_group/', // 存放商品分组图片
	        'UPLOAD_GOODS_CATEGORY' => UPLOAD . '/goods_category/', // 存放商品分组图片
	        'UPLOAD_COMMON' => UPLOAD . '/common/', // 存放公共图片、网站logo、独立图片、没有任何关联的图片
	        'UPLOAD_AVATOR' => UPLOAD . '/avator/', // 存放用户头像
	        'UPLOAD_PAY' => UPLOAD . '/pay/', // 存放支付生成的二维码图片
	        'UPLOAD_ADV' => UPLOAD . '/image_collection/', // //存放广告位图片，由于原“advertising”文件夹名称会被过滤掉。2017年9月14日 14:58:07 修改为“image_collection”
	        'UPLOAD_EXPRESS' => UPLOAD . '/express/', // 存放物流
	        'UPLOAD_CMS' => UPLOAD . '/cms/', // 存放文章图片
	        'UPLOAD_VIDEO' => UPLOAD . "/video/"
	    ],

	    // +----------------------------------------------------------------------
	    // | Trace设置 开启 app_trace 后 有效
	    // +----------------------------------------------------------------------
	    'trace' => [
	        // 内置Html Console 支持扩展
	        'type' => 'Html',
	    ],
	    //开启自动写入时间
//	    'auto_timestamp' => true,
	]

];