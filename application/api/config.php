<?php
//配置文件
define("__ROOT__", ROOT_PATH);


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
	 'default_return_type'    => 'json',
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
    ]
];