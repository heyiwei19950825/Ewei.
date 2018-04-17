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
use app\api\model\Shop;
use app\api\model\Theme;
use app\api\model\Article;
use app\api\model\Coupon;
use app\api\model\User;
use app\api\model\GoodsCollective;
use app\api\service\Token;
use app\api\model\ArticleCategory;
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
        //用户已登录
        $filed = 'id,name,thumb,sp_price,prefix_title,sp_o_price,sp_market';
        if( $this->uid != 999999){
            $user = User::get(['id'=>$this->uid]);
            if($user->is_vip == 2 ){
                $filed += 'sp_vip_price';
            }
        }

        //初始化数据
        $channel = $banner = $brandList = $categoryList = $hotGoodsList = $recommendGoodsList = $articleList = [];


        $channel = Category::filterCategory('id,icon,name,sort')->toArray();
        $channel = self::prefixDomainToArray('icon',$channel);
        //分类及其分类下的商品信息
        foreach ( $channel as $key=>$item) {
            $categoryList[$key] = $item;

            $categoryList[$key]['goodsList'] = Goods::getProductsByCategoryID($item['id'],false,$filed,'','sort','asc',1,1);

            $categoryList[$key]['goodsList'] = $categoryList[$key]['goodsList']->toArray();
            //添加图片域名
            foreach (  $categoryList[$key]['goodsList'] as $k=> &$v){
                $v['thumb'] = self::prefixDomain($v['thumb']);
            }
        }
        //轮播图
        $banner = BannerItem::getBannerList(1,'id,name,description,link,image,actions,actions_id',5)->toArray();
        //处理Url和图片地址
        $banner = self::prefixDomainToArray('image',$banner);
        $banner = self::prefixDomainToArray('link',$banner);
        foreach ($banner as &$v){
            $v['actions'] = Config::get('hrefAction')[$v['actions']];
        }

        //文章列表
        $articleList = Article::getTopArticle()->toArray();
        $articleList = self::prefixDomainToArray('thumb',$articleList);
        //文章分类
        $articleCate = ArticleCategory::getShowCategory(4);


        $articleCategory = self::prefixDomainToArray('icon',$articleCate);
        //获取热门商品
        $hotGoodsList = Goods::hotGoods($filed)->toArray();
        $hotGoodsList = self::prefixDomainToArray('thumb',$hotGoodsList);

        //获取推荐商品
        $recommendGoodsList = Goods::recommendGoods($filed)->toArray();
        $recommendGoodsList = self::prefixDomainToArray('thumb',$recommendGoodsList);

        //获取所有的导航列表信息
        $navList = Theme::getAllThemeList('id,name,alias,link,icon',8);
        $navList = self::prefixDomainToArray('icon',$navList);
        //获取所有的在线优惠券
        $couponList = Coupon::getCouponList();
        //团购活动
        $collectiveList = GoodsCollective::getList(1,5)['data'];

        $collectiveList = self::prefixDomainToArray('thumb',$collectiveList);

        //店铺信息[旗舰店信息]
        $shopInfo = Shop::getShopInfoById(1);

        //系统设置
        $site_config = Db::name('system')->where(['s_id'=>1])->find();

        $system = [
            'switch'=>$site_config['x_switch'],
            'inform'=>$site_config['x_inform'],
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
            'topicCategory' => $articleCategory
        ];

        $row = [
            'errno'     => 0,
            'errmsg'    => '',
            'data'  => $data,
        ];

        return $row;

    }
}