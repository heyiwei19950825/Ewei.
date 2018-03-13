<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\Order as OrderModel;
use app\common\model\UserCollective;
use app\common\model\OrderGoods as OrderGoodsModel;
use app\common\model\User as UserModel;
use app\common\model\OrderGoodsExpress;
use app\common\model\ExpressCompany;
use app\common\model\Region;
use app\common\model\Category;
use think\Config;
use app\common\lib\Helper;

use think\Db;

/**
 * 订单管理
 * Class SlideCategory
 * @package app\admin\controller
 */
class Order extends AdminBase
{
    protected $orderModel = null;
    protected $userModel = null;
    protected $page_size = 20;
    protected $sid = 0;
    protected $order_goods_model;
    protected $order_goods_express;
    protected $category_model;
    protected $express_model;
    protected $user_collective;

    protected function _initialize()
    {
        parent::_initialize();
        $this->orderModel = new OrderModel();
        $this->userModel  = new UserModel();
        $this->order_goods_model  = new OrderGoodsModel();
        $this->order_goods_express  = new OrderGoodsExpress();
        $this->category_model  = new Category();
        $this->express_model  = new ExpressCompany();
        $this->user_collective  = new UserCollective();

        //获取商家信息
        $sid = $this->shop['id'];
    }

    /**
     * 订单列表
     */
    public function index()
    {
            //初始化数据
            $condition = [];
            $page = 1;
            $order_no = $user_name = $start_time = $end_time = $order_from = $order_type = $order_status = $shop_id = $type = '';
            $params = $this->request->param();

            extract($params);
            if($start_time!=''){
                $start_time = strtotime($start_time);
            }

            if($end_time != ''){
                $end_time = strtotime($end_time);
            }
            //商家ID
            if($shop_id !=''){
                $shop_id = $shop_id+0;
                $condition['shop_id'] = $this->shop_id;
            }

            //时间查询
            if ($start_time != 0 && $end_time != 0) {
                $condition["create_time"] = [
                    [
                        ">",
                        $start_time
                    ],
                    [
                        "<",
                        $end_time
                    ]
                ];
            } elseif ($start_time != 0 && $end_time == 0) {
                $condition["create_time"] = [
                    [
                        ">",
                        $start_time
                    ]
                ];
            } elseif ($start_time == 0 && $end_time != 0) {
                $condition["create_time"] = [
                    [
                        "<",
                        $end_time
                    ]
                ];
            }
            //订单号条件
            if( !empty($order_no) ){
                $condition['order_no'] = $order_no;
            }
            //用户昵称
            if( !empty($user_name) ){
                $condition['user_name'] = ['like','%'.$user_name.'%'];
            }

            //订单来源
            if( $order_from != '' ){
                $order_from = $order_from +0;
                $condition['order_from'] = $order_from;
            }

            //订单状态
            if( $order_status != ''){
                $order_status = $order_status +0;

                $condition['o.order_status'] = $order_status;
            }
            //订单类型
            if( $order_type != '' ){
                $order_type = $order_type +0;
                $condition['o.order_type'] = $order_type;
            }

            //根据条件获取订单数据
            $list = $this->orderModel->getOrderList($page, $this->page_size, $condition, 'create_time desc');
            $order_list = $list->toArray();
            if($type == 'export'){
                $xlsName = "订单数据列表";
                $xlsCell = array(
                    array(
                        'order_no',
                        '订单编号'
                    ),
                    array(
                        'user_name',
                        '用户名称'
                    ),
                    array(
                        'receiver_name',
                        '收货人信息'
                    ),
                    array(
                        'receiver_mobile',
                        '收货人手机号'
                    ),
                    array(
                        'order_money',
                        '订单金额'
                    ),
                    array(
                        'create_time',
                        '创建时间'
                    ),
//                    array(
//                        'shipping_type_name',
//                        '配送方式'
//                    ),
                    array(
                        'order_status',
                        '支付状态'
                    ),
//                    array(
//                        'status_name',
//                        '发货状态'
//                    ),
//                    array(
//                        'goods_info',
//                        '商品信息'
//                    ),
//                    array(
//                        'buyer_message',
//                        '买家留言'
//                    ),
//                    array(
//                        'seller_memo',
//                        '卖家备注'
//                    )
                );
                Helper::exportExport($xlsName,$xlsCell,$order_list['data']);die;
            }
            foreach ( $order_list['data'] as &$v ){
                $orderConfig = Config::get('order');
                $v['status'] = $v['order_status'];//订单状态
                $v['type'] = $v['order_type'];//订单类型
                //判断是积分
                if( $v['order_type'] == 2 ){
                    $v['order_money'] = $v['point'];
                }

                $v['order_status'] = $orderConfig['status'][$v['order_status']];

                $v['create_time'] = date('Y-m-d H:i:s',$v['create_time']);
                $v['order_type'] = $orderConfig['type'][$v['order_type']];//订单类型
                $v['order_type'] = $v['is_vip'] ==1 ?'VIP订单':$v['order_type'];
                $v['order_from'] = $orderConfig['from'][$v['order_from']];//订单来源
            }

            if($start_time != ''){
                $start_time = date('Y-m-d H:i:s',$start_time);
            }
            if( $end_time != ''){
                $end_time   = date('Y-m-d H:i:s',$end_time);
            }
            return $this->fetch('index', [
                'list' => $list,
                'order_list'=>$order_list['data'],
                'order_no'=>$order_no,
                'start_time'=>$start_time,
                'end_time'=>$end_time,
                'user_name'=>$user_name,
                'order_from'=>$order_from,
                'order_type'=>$order_type,
                'order_status'=>$order_status,
                'sid'=>$this->sid,
                'shop_id'=>$shop_id
            ]);
    }

    /**
     * 添加备注
     */
    public function addMsg( $id ){
        $msg = $this->request->post('msg');
        $row = Db::name('order')->where(['id'=>$id])->update(['seller_memo'=>$msg]);
        if( $row ){
            $this->success('备注成功');
        }else{
            $this->error('操作失败');
        }
    }

    /**
     * 获取订单详情
     * @return array
     */
    public function detail( $id = -1 ){
        if( empty($id)|| $id == 0 ){
            $this->error('错误的订单~');
        }
        $orderConfig = Config::get('order');
        //订单详情
        $orderRow = $this->orderModel->getOrderDetail( $id);

        $orderInfo = [
            'order_no'     => $orderRow['order_no'],
            'order_from'   => $orderRow['order_from'],
            'order_status' => $orderRow['order_status'],
            'order_type'   => $orderRow['order_type'],
            'create_time'  => date('Y-m-d H:i:s',$orderRow['create_time']),
            'sign_time'    => $orderRow['sign_time']!=0?date('Y-m-d H:i:s',$orderRow['sign_time']):0,//签收时间
            'consign_time' => $orderRow['consign_time']!=0?date('Y-m-d H:i:s',$orderRow['consign_time']):0,//买家发货时间
            'finish_time'  => $orderRow['finish_time']!=0?date('Y-m-d H:i:s',$orderRow['finish_time']):0,//订单完成时间
            'type' => $orderRow['type'],//类型
            'shop_name' => $orderRow['shop_name'],//商品名称
            'status' => $orderRow['status'],//状态
            'coupon_status' => $orderRow['coupon_id']!=0?true:false,//优惠券使用状态
            'coupon_money' => $orderRow['coupon_money'],//优惠券金额
            'from' => $orderRow['from'],//来源
            'goods_money' => $orderRow['type'] == 2 ?$orderRow['goods_money']:round($orderRow['goods_money'],2),//订单商品价格
            'order_money' => $orderRow['type'] == 2 ?$orderRow['point']:round($orderRow['order_money'],2),//订单价格
            'is_vip' => $orderRow['is_vip']
        ];

        //团购信息
        $collective = '';
        if($orderRow['order_type'] == '团购订单' ){
            $collectiveNote = ['开团中','开团成功','开团失败','未支付','开团失败并已退款'];
            $collective = $this->user_collective->where(['order_id'=>$id])->find();
            $collective = $this->user_collective->where(['collective_no'=>$collective['collective_no']])->select()->toArray();
            foreach ( $collective as &$item) {
                $item['status'] = $collectiveNote[$item['status']];
            }
        }

        //用户信息
        $userRow = $this->userModel->getInfo($orderRow['buyer_id'],'id,nickname,portrait,rank_id,is_vip,mobile')->toArray();
        $userInfo = [
            'id' => $userRow['id'],
            'name' => $userRow['nickname'],
            'portrait' => $userRow['portrait'],
            'is_vip' => $userRow['is_vip'],
            'rank_id' => $userRow['rank_id'],
            'mobile' => $userRow['mobile'],
        ];

        //收货地址
        $addressRow['province'] = Region::getRegionName($orderRow['receiver_province']);//省
        $addressRow['city'] = Region::getRegionName($orderRow['receiver_province']);//市
        $addressRow['district'] = Region::getRegionName($orderRow['receiver_province']);//区
        $receiver = [
            'name'=>$orderRow['receiver_name'],
            'mobile'=>$orderRow['receiver_mobile'],
            'address'=>$addressRow['province'].' '.$addressRow['city'].' '.$addressRow['district'].$orderRow['receiver_address'],
        ];
        //订单商品详情
        $goodsField = 'o.goods_name,o.goods_id,o.goods_picture,o.goods_money,o.num,o.price,g.cid,g.id,o.goods_id,o.vip_price';
        $goodsList = $this->order_goods_model->alias('o')->join('goods g','g.id=o.goods_id','LEFT')->field($goodsField)->where(['order_id'=>$orderRow['id']])->select()->toArray();
        //查询商品对应分类
        foreach ($goodsList as &$v){
            $category= $this->category_model->where(['id'=>$v['cid']])->find();
            $v['category']  = $category['name'];
            $v['goods_money']  = $v['vip_price']!=0?$v['vip_price']*$v['num']:$v['goods_money'];
        }
        //备注
        $note = [
            'buy'=>$orderRow['buyer_message'],//买家留言
            'sell'=>$orderRow['seller_memo'],//买家备注
            'cancel'=>$orderRow['cancel_note'],//买家备注
        ];

        //快递信息
        $expressRow = $this->order_goods_express->where(['order_no'=>$orderRow['order_no']])->select()->toArray();
        $express = [];
        if( !empty($expressRow) ){
            foreach ( $expressRow as $k=>$vs){
                $express[$k] = [
                    'express_name' => $vs['express_name'],
                    'express_company' => $vs['express_company'],
                    'express_no' => $vs['express_no'],
                    'goods_list' => $this->order_goods_model->field('goods_name,goods_picture')->where(['goods_id'=>['in',$vs['order_goods_id_array']],'order_id'=>$orderRow['id']])->select()->toArray()
                ];
            }
        }

        //订单信息
        $order = [
            'order_info' => $orderInfo,
            'user_info'  => $userInfo,
            'receiver'   => $receiver,
            'goods_list' => $goodsList,
            'note'       =>  $note,
            'express'   =>  $express,
            'collective'   =>  $collective,
        ];

        return $this->fetch('detail',['order'=>$order]);
    }

    /**
     * 发货页面
     * @param $id
     * @return mixed
     */
    public function deliver( $id ){
        if( empty($id) ){
            $this->error('参数错误');
        }

        $field = 'order_no,receiver_mobile,cancel_note,receiver_name,receiver_province,receiver_district,receiver_city,receiver_address';
        $row = $this->orderModel->field($field)->where(['id'=>$id])->find()->toArray();
        //收货地址
        $addressRow['province'] = Region::getRegionName($row['receiver_province']);//省
        $addressRow['city'] = Region::getRegionName($row['receiver_city']);//市
        $addressRow['district'] = Region::getRegionName($row['receiver_district']);//区
        $row['express'] = $this->express_model->field('id,company_name,image,express_logo,is_default')->where(['is_enabled'=>1])->select()->toArray();
        $row['address'] = $addressRow['province'].' '.$addressRow['city'].' '.$addressRow['district'].$row['receiver_address'];
        $row['goods_list'] = $this->order_goods_model->field('goods_id,goods_name,goods_picture')->where(['order_id'=>$id])->select()->toArray();

        return $this->fetch('deliver',['order'=>$row,'id'=>$id]);
    }

    /**
     *
     */
    public function deliverOption(){
        if( $this->request->isPost()){
            $params = $this->request->param();
            $validate_result = $this->validate($params, 'Deliver');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                $params['order_goods_id_array'] = trim($params['goods_list'], ',');
                $params['shipping_time'] = strtotime($params['shipping_time']);

                //添加发货信息
                $row = $this->order_goods_express->allowField(true)->save($params);
                //修改订单状态
                $orderUpdateRow = $this->orderModel->where(['order_no'=>$params['order_no']])->update([
                    'order_status'=>2,//订单状态
                    'consign_time'=>$params['shipping_time'],//发货时间
                    'shipping_company_name' => $params['express_company']
                ]);
                if( $row ){
                    $this->success('发货成功');
                }else{
                    $this->success('网络异常');
                }
            }
        }
    }

    /**
     * 取消订单页面
     * @param int $id
     * @return mixed
     */
    public function cancel( $id = -1 ){
        if( $id == -1 || empty( $id )){
            $this->error('参数错误');
        }
        return $this->fetch('cancel',['id'=>$id]);
    }

    /**
     * 取消订单并备注信息
     * @param int $id
     */
    public function cancelOption( $id = -1 ){
        $note = $this->request->post('note');

        if( $id == -1 || empty($id )){
            $this->error('错误参数');
        }

        if( empty($note) ){
            $this->error('取消备注必须填写~');
        }

        $row = $this->orderModel->cancel( $id,$note );
        if( empty($row) ) {
            $this->error('网络异常');

        }else{
            $this->success('订单取消成功');
        }
    }

    /**
     * 退款
     * @param $id
     */
    public function refund( $id ){
        if( empty($row) ) {
            $this->error('网络异常');

        }else{
            $this->success('订单取消成功');
        }
    }


    public function refundList( ){
        //初始化数据
        $condition = [];
        $page = 1;
        $order_no = $user_name = $start_time = $end_time = $order_from = $order_type = $order_status = $shop_id ='';
        $params = $this->request->param();

        extract($params);
        if($start_time!=''){
            $start_time = strtotime($start_time);
        }

        if($end_time != ''){
            $end_time = strtotime($end_time);
        }
        //商家ID
        if($shop_id !=''){
            $shop_id = $shop_id+0;
            $condition['shop_id'] = $this->shop_id;
        }

        //时间查询
        if ($start_time != 0 && $end_time != 0) {
            $condition["create_time"] = [
                [
                    ">",
                    $start_time
                ],
                [
                    "<",
                    $end_time
                ]
            ];
        } elseif ($start_time != 0 && $end_time == 0) {
            $condition["create_time"] = [
                [
                    ">",
                    $start_time
                ]
            ];
        } elseif ($start_time == 0 && $end_time != 0) {
            $condition["create_time"] = [
                [
                    "<",
                    $end_time
                ]
            ];
        }
        //订单号条件
        if( !empty($order_no) ){
            $condition['order_no'] = $order_no;
        }
        //用户昵称
        if( !empty($user_name) ){
            $condition['user_name'] = ['like','%'.$user_name.'%'];
        }

        //订单来源
        if( $order_from != '' ){
            $order_from = $order_from +0;
            $condition['order_from'] = $order_from;
        }

        //订单状态
        if( $order_status != ''){
            $order_status = $order_status +0;
            $condition['o.order_status'] = $order_status;
        }
        //订单类型
        if( $order_type != '' ){
            $order_type = $order_type +0;
            $condition['o.order_type'] = $order_type;
        }
        $condition["o.order_status"] = [
                "in",
                '4,5,6'
        ];
        //根据条件获取订单数据
        $list = $this->orderModel->getOrderList($page, $this->page_size, $condition, 'create_time desc');
        $order_list = $list->toArray();

        foreach ( $order_list['data'] as &$v ){
            $orderConfig = Config::get('order');
            $v['status'] = $v['order_status'];//订单状态
            $v['type'] = $v['order_type'];//订单类型
            //判断是积分
            if( $v['order_type'] == 2 ){
                $v['order_money'] = floor($v['order_money']);
            }

            $v['order_status'] = $orderConfig['status'][$v['order_status']];

            $v['create_time'] = date('Y-m-d H:i:s',$v['create_time']);
            $v['order_type'] = $orderConfig['type'][$v['order_type']];//订单类型
            $v['order_from'] = $orderConfig['from'][$v['order_from']];//订单来源
        }

        if($start_time != ''){
            $start_time = date('Y-m-d H:i:s',$start_time);
        }
        if( $end_time != ''){
            $end_time   = date('Y-m-d H:i:s',$end_time);
        }

        return $this->fetch('refund_list', [
            'list' => $list,
            'order_list'=>$order_list['data'],
            'order_no'=>$order_no,
            'start_time'=>$start_time,
            'end_time'=>$end_time,
            'user_name'=>$user_name,
            'order_from'=>$order_from,
            'order_type'=>$order_type,
            'order_status'=>$order_status,
            'sid'=>$this->sid,
            'shop_id'=>$shop_id,
            'controller'=>'refund'
        ]);
    }

    /**
     * 退款详情
     */
    public function refundDetail(){
        $temp = 'refund_detail1';
        return $this->fetch($temp);
    }
}