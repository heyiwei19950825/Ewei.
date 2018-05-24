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
//=============================================admin====================================================================
Route::get('admin/refund/refundlist', 'admin/Order/refundList');//退货订单
Route::get('admin/apply/vip', 'admin/User/vipList');//VIP用户申请


Route::get('admin/internet/setting', 'admin/Subscribe/setting');//网吧配置
Route::post('admin/internet/internetMachineAdd', 'admin/Subscribe/internetMachineAdd');//生成网吧机器数量
Route::post('admin/internet/relevanceCheck', 'admin/Subscribe/relevanceCheck');//网吧机器配置列表
Route::post('admin/internet/relevanceSave', 'admin/Subscribe/relevanceSave');//保存网吧机器配置
Route::post('admin/internet/internetBarSting', 'admin/Subscribe/internetBarSting');//保存网吧配置
Route::get('admin/finance/internet', 'admin/Subscribe/internetFinance');//网吧财务报表
Route::post('admin/finance/internet', 'admin/Subscribe/internetFinance');//网吧财务报表

Route::post('admin/internet/delRule', 'admin/Subscribe/delRule');//删除配置规则
Route::get('admin/virtual/goods', 'admin/Goods/virtual');//虚拟商品
Route::post('admin/internet/orderList', 'admin/Subscribe/getOrderList');//订单列表
Route::get('admin/internet/orderList', 'admin/Subscribe/getOrderList');//订单列表
Route::get('admin/signin/setting', 'admin/Promotion/signIn');//签到配置数据获取
Route::post('admin/signin/setting', 'admin/Promotion/signIn');//签到数据提交



//=============================================api====================================================================
//index
Route::get('api/:version/Index/index', 'api/:version.Index/index');

//Sample
Route::get('api/:version/sample/:key', 'api/:version.Sample/getSample');
Route::post('api/:version/sample/test3', 'api/:version.Sample/test3');

//Miss 404
//Miss 路由开启后，默认的普通模式也将无法访问
//Route::miss('api/v1.Miss/miss');

//Banner
//Route::get('api/:version/banner/:id', 'api/:version.Banner/getBanner');

Route::group('api/:version/theme',function(){
    Route::get('', 'api/:version.Theme/getSimpleList');
    Route::get('/:id', 'api/:version.Theme/getComplexOne');
    Route::post(':t_id/Goods/:p_id', 'api/:version.Theme/addThemeGoods');
    Route::delete(':t_id/Goods/:p_id', 'api/:version.Theme/deleteThemeGoods');
});

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
Route::get('api/:version/goods/virtual', 'api/:version.Goods/getGoodsList');//虚拟物品


//Category
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

//Nav 导航
Route::post('api/:version/nav/list', 'api/:version.Nav/navList');


//上传图片插件api
Route::get('api/:version/ueditor/index', 'api/:version.Ueditor/index');
Route::post('api/:version/ueditor/index', 'api/:version.Ueditor/index');
Route::post('api/:version/upload/upload', 'api/:version.Upload/upload');
Route::post('api/:version/upload/uploadBase64Img', 'api/:version.Upload/uploadBase64Img');//上传base64位图片


//article
Route::get('api/:version/Article/list', 'api/:version.Article/articleList');
Route::get('api/:version/Article/detail', 'api/:version.Article/articleOne');
Route::get('api/:version/Article/related', 'api/:version.Article/relatedByCid');
Route::get('api/:version/Article/articleCategoryList', 'api/:version.Article/articleCategoryList');



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
Route::get('api/:version/coupon/list', 'api/:version.Coupon/couponList');
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
Route::get('api/:version/feedBack/category', 'api/:version.FeedBack/category');
Route::post('api/:version/feedBack/send', 'api/:version.FeedBack/create');//创建反馈


//文章评论
Route::post('api/:version/comment/articlepost', 'api/:version.Comment/addArticleComment');
Route::get('api/:version/comment/articlecount', 'api/:version.Comment/articleCommentCount');
Route::get('api/:version/comment/articlelist', 'api/:version.Comment/articleCommentList');


//店铺
Route::post('api/:version/user/applyvip', 'api/:version.user/applyVip');
Route::get('api/:version/shop/helper', 'api/:version.Shop/helper');
Route::get('api/:version/shop/enter', 'api/:version.Shop/Enter');//商铺入驻
Route::post('api/:version/shop/enter', 'api/:version.Shop/Enter');//商铺入驻
Route::get('api/:version/shop/shopList', 'api/:version.Shop/getList');
Route::get('api/:version/shop/shopInfo', 'api/:version.Shop/shopInfo');//获取商家信息
Route::get('api/:version/shop/getShopCategory', 'api/:version.Shop/getShopCategory');//获取商家分类
Route::get('api/:version/shop/goodsByCategory', 'api/:version.Shop/getGoodsByCategoryId');//获取商家分类
Route::get('api/:version/shop/getOneGoods', 'api/:version.Shop/getOneGoods');//获取商家单个商品信息
Route::get('api/:version/shop/shopGroup', 'api/:version.Shop/shopGroup');///获取商家分组
//Route::get('api/:version/shop/goodsByCategory', 'api/:version.Shop/getGoodsByCategory');//获取商家所有分类和分类商品

Route::get('api/:version/getApi', 'api/:version.QueryLists/index');
Route::post('api/:version/tengxunyun', 'api/:version.TengxunyunTest/index');

//网吧 interent
Route::post('api/:version/internet/api', 'api/:version.Internet/internetAjax');//获取网吧电脑信息
Route::get('api/:version/internet/api', 'api/:version.Internet/internetAjax');//获取网吧电脑信息
Route::post('api/:version/internet/config', 'api/:version.Internet/internetConfig');//获取网吧配置
Route::post('api/:version/internet/addorder', 'api/:version.InternetOrder/addOrder');//创建订单
Route::get('api/:version/internet/orderlist', 'api/:version.InternetOrder/orderList');//订单列表


Route::post('api/:version/internet/authenticationuser', 'api/:version.User/authenticationUser');//用户认证

Route::get('api/:version/prize/rule', 'api/:version.Prize/rule');//抽奖规则接口
Route::post('api/:version/prize/win', 'api/:version.Prize/win');//用户中奖
Route::post('api/:version/user/win', 'api/:version.User/win');//用户中奖信息
Route::get('api/:version/integral/log', 'api/:version.User/integralLog');//积分日志记录
Route::post('api/:version/order/pay', 'api/:version.Pay/pay');//微信支付信息
Route::post('api/:version/prize/check', 'api/:version.Prize/check');//检测用户是否参与过



//微信
Route::get('api/:version/wechat/response', 'api/:version.WeChat/response');
Route::post('api/:version/wechat/user', 'api/:version.User/getUserInfo');
Route::post('api/:version/wechat/config', 'api/:version.WeChat/wxConfig');


//定时任务
Route::get('api/:version/collective/check', 'api/:version.Collective/checkCollectiveStatus');//团购失败退款任务
Route::get('api/:version/order/check', 'api/:version.Order/checkOrderStatus');//删除超时订单
Route::get('api/:version/goods/check', 'api/:version.Goods/checkGoodsStatus');//检测商品状态




//其他单独接口

Route::get('api/:version/banner/getList', 'api/:version.Banner/getList');////获取轮播图信息
Route::get('api/:version/notice/getList', 'api/:version.Inform/getList');////公告列表
Route::get('api/:version/article/getList', 'api/:version.Article/getList');////文章列表
Route::get('api/:version/article/getInfo', 'api/:version.Article/getInfo');////文章列表



