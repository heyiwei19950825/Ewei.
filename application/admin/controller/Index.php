<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\Shop as ShopModel;
use app\common\model\ShopGroup as ShopGroupModel;
use app\common\model\City as CityModel;//城市
use app\common\model\District as DistrictModel;//区
use app\common\model\Province as ProvinceModel;//省份
use app\common\model\Order;
use app\common\lib\Helper as HelperClass;
use app\common\model\FeedBack ;
use think\Session;
use think\Db;

/**
 * 后台首页
 * Class Index
 * @package app\admin\controller
 */
class Index extends AdminBase
{
    protected $shop_model;
    protected $shop_group_model;
    protected $city_model;
    protected $district_model;
    protected $province_model;
    protected function _initialize()
    {
        parent::_initialize();
        $this->shop_model               = new ShopModel();
        $this->shop_group_model         = new ShopGroupModel();
        $this->city_model               = new CityModel();
        $this->district_model           = new DistrictModel();
        $this->province_model           = new ProvinceModel();
    }

    /**
     * 首页
     * @return mixed
     */
    public function index()
    {
        $version = Db::query('SELECT VERSION() AS ver');
        $config  = [
            'url'             => $_SERVER['HTTP_HOST'],
            'document_root'   => $_SERVER['DOCUMENT_ROOT'],
            'server_os'       => PHP_OS,
            'server_port'     => $_SERVER['SERVER_PORT'],
            'server_soft'     => $_SERVER['SERVER_SOFTWARE'],
            'php_version'     => PHP_VERSION,
            'mysql_version'   => $version[0]['ver'],
            'max_upload_size' => ini_get('upload_max_filesize')
        ];

        //shop Info
        $id = Session::get('admin_id');
        $cityList = $this->city_model->select();
        $districtList = $this->district_model->select();
        $provinceList = $this->province_model->select();
        $shopInfo = $this->shop_model->where(['uid'=>$id])->find()->toArray();
        //地址
        $shopInfo['address'] = $provinceList[$shopInfo['province_id']]['province_name'].' '.$cityList[$shopInfo['city_id']]['city_name'].' '.$districtList[$shopInfo['district_id']]['district_name'].' '.$shopInfo['shop_address'];

        //消息
        $feedBackModel = new FeedBack();
        $feedBack = $feedBackModel->order('msg_time desc')->select()->toArray();
        $note = array('','商品相关', '物流状况', '客户服务', '优惠活动', '功能异常', '产品建议', '其他');
        foreach ( $feedBack as &$v ){
            $v['msg_type'] = $note[$v['msg_type']];
            $v['msg_time'] =  HelperClass::time_tran($v['msg_time']);
        }

        //刚建订单
        $orderModel = new  Order();
        $orderList = $orderModel->getOrderList(1,10,['o.order_status'=>1],'id desc',false)->toArray();
        foreach ( $orderList as &$v){
            $v['create_time'] = HelperClass::time_tran($v['create_time']);
        }

        //退款订单
        $retreatList = $orderModel->getOrderList(1,10,['o.order_status'=>['in','4,5,6']],'id desc',false)->toArray();
        foreach ( $retreatList as &$v){
            $v['create_time'] = HelperClass::time_tran($v['create_time']);
        }

        return $this->fetch('index', ['config' => $config,'shop'=>$shopInfo,'order'=>$orderList,'retreat'=>$retreatList,'feedBack'=>$feedBack]);
    }

}