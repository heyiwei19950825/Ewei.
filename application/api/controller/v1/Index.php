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
use app\api\model\Theme;
use app\api\model\Article;
use app\api\model\Coupon;
use app\api\model\GoodsCollective;


class Index extends BaseController
{
    /**
     * 首页数据列表
     */
    public function index(){
        //初始化数据
        $channel = $banner = $brandList = $categoryList = $hotGoodsList = $recommendGoodsList = $articleList = [];

        $channel = Category::filterCategory('id,icon,name,sort')->toArray();
        $channel = self::prefixDomainToArray('icon',$channel);
        //分类及其分类下的商品信息
        foreach ( $channel as $key=>$item) {
            $categoryList[$key] = $item;

            $categoryList[$key]['goodsList'] = Goods::getProductsByCategoryID($item['id'],false,'id,name,thumb,sp_price,prefix_title','','sort','asc',1,7);

            $categoryList[$key]['goodsList'] = $categoryList[$key]['goodsList']->toArray();
            //添加图片域名
            foreach (  $categoryList[$key]['goodsList'] as $k=> &$v){
                $v['thumb'] = self::prefixDomain($v['thumb']);
            }
        }
        //轮播图
        $banner = BannerItem::getBannerList(1,'id,name,description,link,image',5)->toArray();

        //处理Url和图片地址
        $banner = self::prefixDomainToArray('image',$banner);
        $banner = self::prefixDomainToArray('link',$banner);

        //文章列表
        $articleList = Article::getTopArticle()->toArray();
        $articleList = self::prefixDomainToArray('thumb',$articleList);

        //获取热门商品
        $hotGoodsList = Goods::hotGoods()->toArray();
        $hotGoodsList = self::prefixDomainToArray('thumb',$hotGoodsList);

        //获取推荐商品
        $recommendGoodsList = Goods::recommendGoods();
        $recommendGoodsList = self::prefixDomainToArray('thumb',$recommendGoodsList);

        //获取所有的导航列表信息
        $navList = Theme::getAllThemeList('id,name,alias,link,icon',4);
        $navList = self::prefixDomainToArray('icon',$navList);
        //获取所有的在线优惠券
        $couponList = Coupon::getCouponList();
        //团购活动
        $collectiveList = GoodsCollective::getList(1,5)['data'];
        $collectiveList = self::prefixDomainToArray('thumb',$collectiveList);

        $data = [
            'channel'       => $channel,
            'banner'        => $banner,
            'navList'       => $navList,
            'categoryList'  => $categoryList,
            'hotGoodsList'  => $hotGoodsList,
            'newGoodsList'  => $recommendGoodsList,
            'topicList'     => $articleList,
            'couponList'    => $couponList,
            'collectiveList'   => $collectiveList
        ];
        $row = [
            'errno'     => 0,
            'errmsg'    => '',
            'data'  => $data,
        ];

        return $row;

    }
}