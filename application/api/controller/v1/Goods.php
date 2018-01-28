<?php

namespace app\api\controller\v1;

use app\api\model\Category;
use app\api\model\Goods as GoodsModel;
use app\api\validate\Count;
use app\api\validate\IDMustBePositiveInt;
use app\api\validate\PagingParameter;
use app\lib\exception\ParameterException;
use app\lib\exception\ProductException;
use app\lib\exception\ThemeException;
use app\lib\exception\CategoryException;
use app\api\controller\BaseController;
use app\api\model\Category as CategoryModel;
use app\api\model\GoodsSku;
use app\api\model\Footprint;
use app\api\model\Collect;
use think\Exception;
use think\Config;

class Goods extends BaseController
{
    protected $beforeActionList = [
        'checkSuperScope' => ['only' => 'createOne,deleteOne']
    ];

    /**
     * 根据类目ID获取该类目下所有商品(分页）
     * @url /product?id=:category_id&page=:page&size=:page_size
     * @param int $id 商品id
     * @param int $page 分页页数（可选)
     * @param int $size 每页数目(可选)
     * @return array of Product
     * @throws ParameterException
     */
    public function getByCategory($id = -1,$keyword='', $sort='id', $order='asc',$page=1,$size=30)
    {
        if( $id != 0 ){
            (new IDMustBePositiveInt())->goCheck();
        }
        (new PagingParameter())->goCheck();

        $field = 'name,thumb,sp_price,id';
        $pagingProducts = GoodsModel::getProductsByCategoryID(
            $id, true,$field,$keyword,$sort,$order,$page,$size);

        //顶级分类列表
        $filterCategory = CategoryModel::filterCategory( 'id,name' )->toArray();

        if ($pagingProducts->isEmpty())
        {
            // 对于分页最好不要抛出MissException，客户端并不好处理
            $data = ['count' => 0,//总数
                'last_page' => 1,//下一页页码
                'currentPage' => 1,//当前页码
                'goodsList'=>[],//商品列表
                'pagesize'  => $size,//每页长度
                'totalPages' => 1, //总页数
                'filterCategory' => $filterCategory,
            ];
            $row = [
                'errno' => 0,
                'errmsg' => '',
                'data' => $data
            ];
            return  $row;
        }

        $data = $pagingProducts
//            ->hidden(['summary'])
            ->toArray();

        //图片设置域名
        $data['data'] = self::prefixDomainToArray('thumb',$data['data']);

        //配置参数
        $data = [
            'count' => $data['total'],//总数
            'last_page' => $data['last_page'],//下一页页码
            'currentPage' => $data['current_page'],//当前页码
            'goodsList'=>$data['data'],//商品列表
            'pagesize'  => $size,//每页长度
            'totalPages' => 1, //总页数
            'filterCategory' => $filterCategory,
        ];

        $row = [
            'errno' => 0,
            'errmsg' => '',
            'data' => $data
        ];

        return $row;
    }

    /**
     * 获取某分类下全部商品(不分页）
     * @url /product/all?id=:category_id
     * @param int $id 分类id号
     * @return \think\Paginator
     * @throws ThemeException
     */
    public function getAllInCategory($id = -1,$keyword='', $sort='id', $order='asc',$page=1,$size=30)
    {
        (new IDMustBePositiveInt())->goCheck();
        $field = 'name,thumb,sp_price';
        $products = GoodsModel::getProductsByCategoryID(
            $id, false,$field,$keyword,$sort,$order,$page,$size);
        if ($products->isEmpty())
        {
            throw new ThemeException();
        }
        //商品列表
        $data = $products
            ->hidden(['summary'])
            ->toArray();

        return $data;
    }

    /**
     * 通过商品ID获取当前分类
     * @url /category/:id
     * @param int $id 商品ID
     * @return Row
     * @throws CategoryException
     */
    public function getCategoryByGoodsId( $id = -1 ){
        (new IDMustBePositiveInt())->goCheck();
        $field = 'c.name,c.alias,c.pid';
        //查询当前商品分类
        $categoryInfo = GoodsModel::getCategoryByGoodsId( $id, $field );

        if( !$categoryInfo ){
            throw new CategoryException();
        }
        $categoryInfo = $categoryInfo->toArray();

        //查询当前分类下的所有子分类
        $categoryModel = new Category();
        $brotherCategory = $categoryModel->where(['pid'=>$categoryInfo['pid']])
                        ->field('id,name')
                        ->order('sort asc')
                        ->select();

        $data = [
            'brotherCategory' => $brotherCategory,
            'currentCategory' => $categoryInfo, //当前分类信息
        ];
        $row = [
            'errno' => 0,
            'errmsg' => '',
            'data' => $data
        ];

        return $row;
    }
        /**
     * 获取商品详情
     * 如果商品详情信息很多，需要考虑分多个接口分布加载
     * @url /product/:id
     * @param int $id 商品id号
     * @return Product
     * @throws ProductException
     */
    public function getOne($id)
    {
        (new IDMustBePositiveInt())->goCheck();
        $field = '';
        $product = GoodsModel::getProductDetail($id,$field);

        if (!$product )
        {
            throw new ProductException();
        }
        //添加浏览记录
        Footprint::addFootprint($product);

        $product['thumb'] = self::prefixDomain($product['thumb']);
        //处理轮播图片信息
        preg_match_all ('/\"\/uploads(.*?)\"/', $product['photo'], $m);
        foreach ( $m[1] as $k=>$v){
            $product['gallery'][] = self::prefixDomain('/uploads'.$v);
        }
        //商品规格
        $property = GoodsSku::getSkuByGId($id);
        $sku = [];
        $i = 0;
        if( !empty($property) ) {
            $property = $property->toArray();
            foreach ($property as $item) {
                $item['id'] = $item['sku_id'];
                $item['specification_id'] = $item['group_id'];
                foreach ($sku as $k => $v) {
                    if ($item['group_id'] == $k) {
                        $sku[$item['group_id']]['name']  = $item['sku_name'];
                        $sku[$item['group_id']]['specification_id']  = $item['specification_id'];
                        $sku[$item['group_id']]['valueList'][] = $item;
                        $i = 1;
                    }
                }
                if ($i != 1) {
                    $sku[$item['group_id']]['name']  = $item['sku_name'];
                    $sku[$item['group_id']]['specification_id']  = $item['specification_id'];
                    $sku[$item['group_id']]['valueList'][] = $item;
                }
                $i = 0;
            }

            $ii = 0;
            foreach ($sku as $k=>$v){
                unset($sku[$k]);
                $sku[$ii] = $v;
                $ii++;
            }


        }


        $product = [
            'info' => $product,
            'specificationList' => $sku,
            'userHasCollect' =>Collect::checkCollectUse( $product['id']) //是否收藏
        ];

        $data = [
            'errno'=>0,
            'errmsg'=>'',
            'data' => $product
        ];
        return $data;
    }

    public function createOne()
    {
        $product = new GoodsModel();
        $product->save(
            [
                'id' => 1
            ]);
    }


    /**
    //     * 获取指定数量的最近商品
    //     * @url /product/recent?count=:count
    //     * @param int $count
    //     * @return mixed
    //     * @throws ParameterException
    //     */
//    public function getRecent($count = 15)
//    {
//        (new Count())->goCheck();
//        $products = GoodsModel::getMostRecent($count);
//        if ($products->isEmpty())
//        {
//
//        }
//        $products = $products->hidden(
//            [
//                'summary'
//            ])
//            ->toArray();
//        return $products;
//    }
//

//
//    public function deleteOne($id)
//    {
//        GoodsModel::destroy($id);
//        //        GoodsModel::destroy(1,true);
//    }



}