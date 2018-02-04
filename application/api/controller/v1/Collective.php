<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/2/1
 * Time: 2:19
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\GoodsCollective as GoodsCollectiveModel;
use app\api\model\UserAddress;
use app\api\model\Goods as GoodsModel;
use app\api\model\Region;
use app\api\model\Express;
use app\api\model\Order;
use app\api\model\Shop;
use app\api\model\User;
use app\api\service\Token;
use think\Request;

class Collective extends BaseController
{
    public $uid = '';

    public function _initialize()
    {
        parent::_initialize();
        $this->uid = Token::getCurrentUid();
    }

    /**
     * 获取所有在线的开团商品
     */
    public function getList(){
        $page = $this->request->param('page');
        $size = $this->request->param('size');
        $collectiveList = GoodsCollectiveModel::getList($page,$size);
        $collectiveList['data'] = self::prefixDomainToArray('thumb',$collectiveList['data']);

        //配置参数
        $data = [
            'count' => $collectiveList['total'],//总数
            'last_page' => $collectiveList['last_page'],//下一页页码
            'currentPage' => $collectiveList['current_page'],//当前页码
            'goodsList'=>$collectiveList['data'],//商品列表
            'pagesize'  => $size,//每页长度
            'totalPages' => 1, //总页数
            'data' => $collectiveList['data'],
        ];

        $row = [
            'errno' => 0,
            'errmsg' => '',
            'data' => $data
        ];

        return $row;
    }

    /**
     * 获取详细信息
     * @return array
     */
    public function getOne(){
        $id = $this->request->param('id');
        $collective = GoodsCollectiveModel::getOne($id);
        $collective['thumb'] = self::prefixDomain($collective['thumb']);
        //处理轮播图片信息
        preg_match_all ('/\"\/uploads(.*?)\"/', $collective['photo'], $m);
        foreach ( $m[1] as $k=>$v){
            $collective['gallery'][] = self::prefixDomain('/uploads'.$v);
        }
        $row = [
            'errno' => 0,
            'errmsg' => '',
            'data' => [
                'info' => $collective
                ]
        ];
        return $row;
    }

    /**
     * 团购
     * @return array
     */
    public function Cart(){
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];
        $goodsId = $this->request->param('goodsId',0);
        $num = $this->request->param('num',0);
        $addressId = $this->request->param('addressId',0);

        //收货地址
        $userAddressModel = new UserAddress();
        if( $addressId != 0 ){
          $addresssMap = ['id'=>$addressId,'user_id'=>$this->uid];
        }else{
          $addresssMap = ['is_default'=>1,'user_id'=>$this->uid];
        }
        $address = $userAddressModel->where($addresssMap)->find();

        if( empty($address) ){
            $address = 0;
        }

        if( !empty($address) ){
            $address['province_name'] = Region::getRegionName($address['province_id']);
            $address['city_name'] = Region::getRegionName($address['city_id']);
            $address['district_name'] = Region::getRegionName($address['district_id']);
            $address['full_region'] = $address['province_name'] . $address['city_name'] . $address['district_name'];
        }else{
            $address = ['id'=>0];
        }

        $field = '';
        $product = GoodsModel::getProductDetail($goodsId,$field);
        $product['thumb'] = self::prefixDomain($product['thumb']);
        $product['collective'] = GoodsCollectiveModel::getCollectiveByGid($product['id']);

        //判断是否是团购
        if($product['is_collective'] == 0 ){
            $row['errmsg'] = '非法请求';
            $row['errno']  = 10001;

            return  $row;
        }

        //运费
        $express = Express::getDetail($product['eid'],'cost,company_name,id');
        $goodsPrice = $product['collective']['goods_price'] * $num;
        //最终价格   商品价格 + 运费
        $actualPrice = $goodsPrice + ($express['cost']+0);

        $row['data'] = [
            'checkedAddress' => $address,//收货地址
            'goodsPrice' => $goodsPrice,//收货地址
            'freightPrice'   => $express['cost'],//运费
            'actualPrice'    => $actualPrice,//最后的价格
            'product'        => $product    //商品信息

        ];
        return $row;
    }
}