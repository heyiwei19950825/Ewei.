<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\FeedBackCategory;
use app\common\model\Shop as ShopModel;
use app\common\model\ShopGroup as ShopGroupModel;
use app\common\model\Order;
use app\common\lib\Helper as HelperClass;
use app\common\model\FeedBack ;

/**
 * 后台首页
 * Class Index
 * @package app\admin\controller
 */
class Index extends AdminBase
{
    protected $shop_model;
    protected $shop_group_model;
    protected function _initialize()
    {
        parent::_initialize();
        $this->shop_model               = new ShopModel();
        $this->shop_group_model         = new ShopGroupModel();
    }

    /**
     * 首页
     * @return mixed
     */
    public function index()
    {
        $cateNote = [];
        //shop Info
        $shopInfo = $this->shop_model->getInfo(['id'=>$this->instance_id]);

        //消息
        $feedBack   =  ( new FeedBack() )->select()->toArray();
        $note       =  (new FeedBackCategory())->select()->toArray();

        if( $note ){
            foreach ($note as $k=>$v){
                $cateNote[$v['id']] = $v['name'];
            }
        }
        if( $feedBack ){
            foreach ( $feedBack as &$v ){
                $v['msg_type'] = empty($note)?'':$cateNote[$v['msg_type']];
                $v['msg_time'] =  HelperClass::time_tran($v['msg_time']);
            }
        }

        //刚建订单
        $orderModel = new  Order();
        $orderList = $orderModel->getOrderList(1,10,[
            'o.order_status'=>1,
        ],'id desc',false);
        foreach ( $orderList as &$v){
            $v['create_time'] = HelperClass::time_tran($v['create_time']);
        }

        //退款订单
        $retreatList = $orderModel->getOrderList(1,20,[
            'o.order_status'=>['in','4,5,6']
        ],'id desc',false);

        foreach ( $retreatList as &$v){
            $v['create_time'] = HelperClass::time_tran($v['create_time']);
        }

        return $this->fetch('index', ['shop'=>$shopInfo,'order'=>$orderList,'retreat'=>$retreatList,'feedBack'=>$feedBack]);
    }

}