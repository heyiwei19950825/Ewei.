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
//admin
Route::get('admin/refund/refundlist', 'admin/Order/refundList');//退货订单
Route::get('admin/apply/vip', 'admin/User/vipList');//VIP用户申请




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
Route::get('api/:version/goods/count', 'api/:version.Goods/goodsCount');
Route::get('api/:version/goods/vip', 'api/:version.Goods/vipGoods');
Route::get('api/:version/Goods/integral', 'api/:version.Goods/getIsIntegralGoods');//积分兑换商品


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
Route::post('api/:version/address/save', 'api/:version.Address/createOrUpdateAddress');
Route::get('api/:version/address', 'api/:version.Address/getUserAddress');
Route::post('api/:version/address/delete', 'api/:version.Address/deleteAddress');

//Order
Route::post('api/:version/order/place', 'api/:version.Order/placeOrder');
Route::post('api/:version/order/updatestatus', 'api/:version.Order/updateStatus');
Route::get('api/:version/order/delorder', 'api/:version.Order/delOrder');
Route::get('api/:version/order/detail', 'api/:version.Order/getDetail');
//Route::put('api/:version/order/delivery', 'api/:version.Order/delivery');

//不想把所有查询都写在一起，所以增加by_user，很好的REST与RESTFul的区别
Route::get('api/:version/order/list', 'api/:version.Order/getSummaryByUser');
Route::get('api/:version/order/paginate', 'api/:version.Order/getSummary');

//Pay
Route::get('api/:version/pay/pre_order', 'api/:version.Pay/getPreOrder');
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


//搜索
Route::get('api/:version/search/index', 'api/:version.Search/getAll');
Route::get('api/:version/search/helper', 'api/:version.Search/helper');



//购物车
Route::post('api/:version/cart/add', 'api/:version.Cart/add');
Route::get('api/:version/cart/goodscount', 'api/:version.Cart/goodsCount');
Route::get('api/:version/cart/index', 'api/:version.Cart/index');
Route::post('api/:version/cart/update', 'api/:version.Cart/updateCarts');
Route::post('api/:version/cart/checked', 'api/:version.Cart/checked');
Route::post('api/:version/cart/delete', 'api/:version.Cart/deleteCarts');
Route::get('api/:version/cart/checkout', 'api/:version.Cart/checkoutCarts');
Route::get('api/:version/cart/checkstatus', 'api/:version.Cart/checkGoodsStatus');


//城市地址列表
Route::get('api/:version/region/list', 'api/:version.Region/regionList');


//足迹
Route::get('api/:version/footprint/list', 'api/:version.Footprint/getList');

//收藏
Route::get('api/:version/collect/list', 'api/:version.Collect/getList');
Route::post('api/:version/collect/addordelete', 'api/:version.Collect/addOrDelete');

//优惠券
Route::get('api/:version/coupon/userCouponList', 'api/:version.Coupon/getUserCouponList');
Route::get('api/:version/coupon/useCouponList', 'api/:version.Coupon/getUseCouponList');
Route::post('api/:version/coupon/userGetCoupon', 'api/:version.Coupon/userGetCoupon');


//积分购买
Route::post('api/:version/integral/integralCart', 'api/:version.Integral/integralCart');

//开团
Route::get('api/:version/collective/getList', 'api/:version.Collective/getList');
Route::post('api/:version/collective/cart', 'api/:version.Collective/Cart');
Route::get('api/:version/collective/detail', 'api/:version.Collective/getOne');
Route::get('api/:version/collective/order', 'api/:version.Collective/orderList');
Route::get('api/:version/collective/detailbyid', 'api/:version.Collective/detailByID');


//用户反馈
Route::post('api/:version/feedBack/add', 'api/:version.FeedBack/add');


//文章评论
Route::post('api/:version/comment/articlepost', 'api/:version.Comment/addArticleComment');
Route::get('api/:version/comment/articlecount', 'api/:version.Comment/articleCommentCount');
Route::get('api/:version/comment/articlelist', 'api/:version.Comment/articleCommentList');



Route::post('api/:version/user/applyvip', 'api/:version.user/applyVip');
Route::get('api/:version/shop/helper', 'api/:version.Shop/helper');

Route::get('api/:version/getApi', 'api/:version.QueryLists/index');
Route::post('api/:version/tengxunyun', 'api/:version.TengxunyunTest/index');



//定时任务
Route::get('api/:version/collective/check', 'api/:version.Collective/checkCollectiveStatus');//团购失败退款任务
Route::get('api/:version/order/check', 'api/:version.Order/checkOrderStatus');//删除超时订单


//return [
//        ':version/banner/[:location]' => 'api/:version.Banner/getBanner'
//];

//Route::miss(function () {
//    return [
//        'msg' => 'your required resource are not found',
//        'error_code' => 10001
//    ];
//});



