<?php
/**
 * 路由注册
 *
 * 以下代码为了尽量简单，没有使用路由分组
 * 实际上，使用路由分组可以简化定义
 * 并在一定程度上提高路由匹配的效率
 */

// 写完代码后对着路由表看，能否不看注释就知道这个接口的意义
use think\Route;
//index
Route::get('api/:version/Index/index', 'api/:version.Index/index');

//Sample
Route::get('api/:version/sample/:key', 'api/:version.Sample/getSample');
Route::post('api/:version/sample/test3', 'api/:version.Sample/test3');

//Miss 404
//Miss 路由开启后，默认的普通模式也将无法访问
//Route::miss('api/v1.Miss/miss');

//Banner
Route::get('api/:version/banner/:id', 'api/:version.Banner/getBanner');

//Theme
// 如果要使用分组路由，建议使用闭包的方式，数组的方式不允许有同名的key
//Route::group('api/:version/theme',[
//    '' => ['api/:version.Theme/getThemes'],
//    ':t_id/Goods/:p_id' => ['api/:version.Theme/addThemeGoods'],
//    ':t_id/Goods/:p_id' => ['api/:version.Theme/addThemeGoods']
//]);

Route::group('api/:version/theme',function(){
    Route::get('', 'api/:version.Theme/getSimpleList');
    Route::get('/:id', 'api/:version.Theme/getComplexOne');
    Route::post(':t_id/Goods/:p_id', 'api/:version.Theme/addThemeGoods');
    Route::delete(':t_id/Goods/:p_id', 'api/:version.Theme/deleteThemeGoods');
});

//Route::get('api/:version/theme', 'api/:version.Theme/getThemes');
//Route::post('api/:version/theme/:t_id/Goods/:p_id', 'api/:version.Theme/addThemeGoods');
//Route::delete('api/:version/theme/:t_id/Goods/:p_id', 'api/:version.Theme/deleteThemeGoods');

//Goods
Route::post('api/:version/Goods', 'api/:version.Goods/createOne');
Route::delete('api/:version/Goods/:id', 'api/:version.Goods/deleteOne');
Route::get('api/:version/Goods/by_category/paginate', 'api/:version.Goods/getByCategory');
Route::get('api/:version/Goods/by_category', 'api/:version.Goods/getAllInCategory');
Route::get('api/:version/Goods/detail', 'api/:version.Goods/getOne');
Route::get('api/:version/Goods/recent', 'api/:version.Goods/getRecent');

//Category
//Route::get('api/:version/category', 'api/:version.Category/getCategories');
// 正则匹配区别id和all，注意d后面的+号，没有+号将只能匹配个位数
//Route::get('api/:version/category/:id', 'api/:version.Category/getCategory',[], ['id'=>'\d+']);
//Route::get('api/:version/category/:id/Goodss', 'api/:version.Category/getCategory',[], ['id'=>'\d+']);
Route::get('api/:version/Category/all', 'api/:version.Category/getAllCategories');
Route::get('api/:version/Category/list', 'api/:version.Category/getCategoryByCId');


//Token
Route::post('api/:version/token/user', 'api/:version.Token/getToken');

Route::post('api/:version/token/app', 'api/:version.Token/getAppToken');
Route::post('api/:version/token/verify', 'api/:version.Token/verifyToken');

//Address
Route::post('api/:version/address', 'api/:version.Address/createOrUpdateAddress');
Route::get('api/:version/address', 'api/:version.Address/getUserAddress');

//Order
Route::post('api/:version/order', 'api/:version.Order/placeOrder');
Route::get('api/:version/order/:id', 'api/:version.Order/getDetail',[], ['id'=>'\d+']);
Route::put('api/:version/order/delivery', 'api/:version.Order/delivery');

//不想把所有查询都写在一起，所以增加by_user，很好的REST与RESTFul的区别
Route::get('api/:version/order/by_user', 'api/:version.Order/getSummaryByUser');
Route::get('api/:version/order/paginate', 'api/:version.Order/getSummary');

//Pay
Route::post('api/:version/pay/pre_order', 'api/:version.Pay/getPreOrder');
Route::post('api/:version/pay/notify', 'api/:version.Pay/receiveNotify');
Route::post('api/:version/pay/re_notify', 'api/:version.Pay/redirectNotify');
Route::post('api/:version/pay/concurrency', 'api/:version.Pay/notifyConcurrency');

//Message
Route::post('api/:version/message/delivery', 'api/:version.Message/sendDeliveryMsg');


//上传图片插件api
Route::get('api/:version/ueditor/index', 'api/:version.Ueditor/index');
Route::post('api/:version/ueditor/index', 'api/:version.Ueditor/index');
Route::post('api/:version/upload/upload', 'api/:version.Upload/upload');


//article
Route::get('api/:version/Article/list', 'api/:version.Article/articleList');
Route::get('api/:version/Article/detail', 'api/:version.Article/articleOne');
Route::get('api/:version/Article/related', 'api/:version.Article/relatedByCid');


//keyword

Route::get('api/:version/search/index', 'api/:version.Search/getAll');








//return [
//        ':version/banner/[:location]' => 'api/:version.Banner/getBanner'
//];

//Route::miss(function () {
//    return [
//        'msg' => 'your required resource are not found',
//        'error_code' => 10001
//    ];
//});



