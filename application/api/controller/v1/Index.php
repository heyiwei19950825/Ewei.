<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/1/14
 * Time: 18:03
 */

namespace app\api\controller\v1;

use app\api\controller\BaseController;

use app\api\model\Category;
use app\api\model\Goods;
use app\api\model\BannerItem;
use app\api\model\Order;
use app\api\model\Shop;
use app\api\model\Theme;
use app\api\model\Article;
use app\api\model\Coupon;
use app\api\model\User;
use app\api\model\GoodsCollective;
use app\api\service\Token;
use app\api\model\ArticleCategory;
use app\common\model\PicModel;
use think\Config;
use think\Db;

class Index extends BaseController
{

    public function _initialize()
    {
        parent::_initialize();
        $this->uid = Token::getCurrentUid(1);
    }

    /**
     * 首页数据列表
     */
    public function index(){

        $data = array (
            'appid' => 'wx7766126fba22a12d',
            'bank_type' => 'CFT',
            'cash_fee' => '2',
            'fee_type' => 'CNY',
            'is_subscribe' => 'N',
            'mch_id' => '1488391202',
            'nonce_str' => 'f120idnd7zwr6r9rw5gwo2una1u2y029',
            'openid' => 'oEkHy0MLJ8yelAUfGkPb45qyJ0rE',
            'out_trade_no' => '201804261702302701',
            'result_code' => 'SUCCESS',
            'return_code' => 'SUCCESS',
            'sign' => 'F469E3DBB47EBF40BCC715889D2A97C9',
            'time_end' => '20180426170237',
            'total_fee' => '2',
            'trade_type' => 'JSAPI',
            'transaction_id' => '4200000058201804266274294974',
        );
        $order = Order::where('order_no', '=', $data['out_trade_no'])->lock(true)->find()->toArray();
        //查询订单下的商品信息
        $goodsList = Db::name('order_product')->where(['order_id'=>$order['id']])->field('s_id,num,price,vip_price,goods_money,shipping_money,give_point,goods_id,goods_name')->select();
        $shopArray = [];
        //统计出订单中每个商家获利
        foreach ( $goodsList as $v){
            if(array_key_exists($v['s_id'],$shopArray)){
                $shopArray[$v['s_id']]['money']      += $v['vip_price']!=0?$v['vip_price']*$v['num']:$v['price']*$v['num'];
                $shopArray[$v['s_id']]['goods_id']   .= ','.$v['goods_id'];
                $shopArray[$v['s_id']]['detail']     .= $v['goods_name'].'X'.$v['num'];
            }else{
                $shopArray[$v['s_id']]['goods_id']           = $v['goods_id'];
                $shopArray[$v['s_id']]['detail']             = $v['goods_name'].'X'.$v['num'];
                $shopArray[$v['s_id']]['money']              = $v['vip_price']!=0?$v['vip_price']*$v['num']:$v['price']*$v['num'];
                $shopArray[$v['s_id']]['shipping_money']     = $v['shipping_money'];
            }
        }
        foreach($shopArray as $k=>$v){
            $payment = [
                'out_trade_no'  => $data['out_trade_no'],
                'goods_id'      => $v['goods_id'],
                'shop_id'       => $k,
                'type'          => 1,
                'pay_body'      => '购买商品订单数据',
                'pay_detail'    => $v['detail'],
                'pay_status'    => 2,
                'pay_money'     => $v['money'],
                'pay_type'      => 1,
                'create_time'   => time(),
                'pay_time'      => $data['time_end'],
                'trade_no'      => $data['transaction_id'],
            ];
            //添加支付数据
            Db::name('order_payment')->insert($payment);
            //添加店铺数据
            $shop = Shop::where('id','=',$k)->find();
            //总销售额【不计算退款】
            $freeNum = $shop['shop_sales'];
            $freeNum = $freeNum*100 + ($v['money']*100+0);
            $freeNum = round($freeNum/100,2);
            //账户余额
            $account = $shop['shop_account'];
            $account = $account*100 + ($v['money']*100+0);
            $account = round($account/100,2);

            Shop::where('id','=',$k)
                ->update(['shop_sales'=>$freeNum,'shop_account'=>$account]);
        }


        die;

        //用户已登录
        $filed = 'id,name,thumb,sp_price,prefix_title,sp_o_price,sp_market';
        $filtrationId = '';
        if( $this->uid != 999999){
            $user = User::get(['id'=>$this->uid]);
            if($user->is_vip == 2 ){
                $filed .= ',sp_vip_price';
            }
        }

        //初始化数据
        $channel = $banner = $brandList = $categoryList = $hotGoodsList = $recommendGoodsList = $articleList = $condition = $configList = [];


        //系统配置
        $config = Db::name('constant_value')->select()->toArray();
        foreach ($config as $k=>$v){
            if($v['key'] == 'commitment'){
                $commitment = json_decode($v['value'],true);
            }
            $configList[$v['key']] = array_merge(json_decode($v['value'],true),['name'=>$v['name']]);
        }


        //分类及其分类下的商品信息
        if( $configList['index_show_category']['status'] == 1 ){
            $channel = Category::filterCategory('id,icon,name,sort')->toArray();
            $channel = self::prefixDomainToArray('icon',$channel);
            foreach ( $channel as $key=>$item) {
                $categoryList[$key] = $item;
                $categoryList[$key]['goodsList'] = Goods::getProductsByCategoryID($item['id'],false,$filed,'','sort','asc',0,$configList['index_show_category']['number']);
                $categoryList[$key]['goodsList'] = $categoryList[$key]['goodsList']->toArray();

                //添加图片域名
                foreach (  $categoryList[$key]['goodsList'] as $k=> &$v){
                    $v['thumb'] = self::prefixDomain($v['thumb']);
                }
            }
        }

        //轮播图
        if($configList['index_show_banner']['status'] == 1 ){
            $banner = BannerItem::getBannerList(1,'id,name,description,link,image,actions,actions_id',$configList['index_show_banner']['number'])->toArray();
            //处理Url和图片地址
            $banner = self::prefixDomainToArray('image',$banner);
            $banner = self::prefixDomainToArray('link',$banner);
            foreach ($banner as &$v){
                $v['actions'] = Config::get('hrefAction')[$v['actions']];
            }
        }

        //文章列表
        if($configList['index_show_article']['status'] == 1 ) {
            $articleCateId = Article::gteCategoryList([
                'status' => 1
            ], 'id','sort desc',$configList['index_show_article']['number']);
            $articleList = Article::getTopArticle($articleCateId);
            $articleList = self::prefixDomainToArray('thumb', $articleList);
            //        //文章分类
//        $articleCate = ArticleCategory::getShowCategory(4);
//        $articleCategory = self::prefixDomainToArray('icon',$articleCate);
        }

        //获取热门商品
        if($configList['index_show_hot']['status'] == 1 ) {
            $hotGoodsList = Goods::hotGoods($filed,$configList['index_show_hot']['number'])->toArray();

            $hotGoodsList = self::prefixDomainToArray('thumb', $hotGoodsList);

            //过滤掉已近在首页显示的商品
            if ($hotGoodsList) {

//                foreach ($hotGoodsList as $k => $v) {
//                    $filtrationId .= $v['id'] . ',';
//                }
//
//                $filtrationId = trim($filtrationId, ',');
                $condition = [
                    'id' => [
                        '<>', $filtrationId
                    ]
                ];
            }
        }

        //获取推荐商品
        if($configList['index_show_recommend']['status'] == 1 ) {
            $recommendGoodsList = Goods::recommendGoods($filed, $condition,$configList['index_show_recommend']['number'])->toArray();
            $recommendGoodsList = self::prefixDomainToArray('thumb', $recommendGoodsList);
        }

        //获取所有的导航列表信息
        if($configList['index_show_nav']['status'] == 1 ) {
            $navList = Theme::getAllThemeList('id,name,alias,link,icon', $configList['index_show_nav']['number']);
            $navList = self::prefixDomainToArray('icon', $navList);
        }
        //获取所有的在线优惠券
        if($configList['index_show_coupon']['status'] == 1 ) {
            $couponList = Coupon::getCouponList($configList['index_show_coupon']['number']);
        }
        //团购活动
        if($configList['index_showc_ollective']['status'] == 1 ) {
            $collectiveList = GoodsCollective::getList(1, $configList['index_showc_ollective']['number'])['data'];
            $collectiveList = self::prefixDomainToArray('thumb', $collectiveList);
        }

        $picModel =  (new PicModel())->where([
            'id'=>1,
            's_id'=>1,
            'is_delete'=>0
        ])->field('data')->find()->toArray();
        $picModel = json_decode($picModel['data'],true);
        $picModelData['data']['pic_list'] = self::prefixDomainToArray('pic_url',$picModel['pic_list']);

        //店铺信息[旗舰店信息]
        $shopInfo = Shop::getShopInfoById(1,'shop_name,shop_status,shop_phone');

        //系统设置
        $site_config = Db::name('system')->where(['s_id'=>1])->find();

        $system = [
            'switch'=>$site_config['x_switch'],
            'inform'=>$site_config['x_inform'],
            'commitment'=>$configList['commitment'],
            'title' =>[
                'hot'=>[
                    'title'=>$configList['index_show_hot']['title']
                ],
                'new'=>[
                    'title'=>$configList['index_show_new']['title']
                ],
                'recommend'=>[
                    'title'=>$configList['index_show_recommend']['title']
                ],
                'article'=>[
                    'title'=>$configList['index_show_article']['title']
                ]
            ]
//            'inform'=>$site_config['x_inform'],
        ];

        $data = [
            'channel'       => $channel,
            'banner'        => $banner,
            'navList'       => $navList,
            'categoryList'  => $categoryList,
            'hotGoodsList'  => $hotGoodsList,
            'newGoodsList'  => $recommendGoodsList,
            'topicList'     => $articleList,
            'couponList'    => $couponList,
            'collectiveList'=> $collectiveList,
            'shopInfo'      => $shopInfo,
            'system'        => $system,
            'picModel'      => $picModelData
        ];

        $row = [
            'errno'     => 0,
            'errmsg'    => '',
            'data'  => $data,
        ];

        return $row;

    }
}