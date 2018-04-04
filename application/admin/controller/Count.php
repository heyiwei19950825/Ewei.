<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\OrderGoods;
use app\common\model\Goods;
use app\common\model\Order;
use app\common\model\Category;

use think\Config;
use think\Db;

/**
 * 统计
 * Class Index
 * @package app\admin\controller
 */
class Count extends AdminBase
{
    protected function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 统计近一个月的用户增长数
     * @return [type] [description]
     */
    public function userCount($type = 1){
        switch ($type) {
            case '1':
                $time = '1 MONTH';
                $where = '';
                break;
            case '2':
                $time = '3 MONTH';
                break;
            case '3':
                $time = '12 MONTH';
                break;
            default:
                 $time = '7 DAY';
                break;
        }

        $time = explode(' ',$time);
        $number = $time[0];
        $day    = $time[1];
        switch ($day) {
            case 'MONTH':
                $startTime = strtotime(date("Y-m-1",strtotime("-$number month")));
                $endTime  = strtotime(date("Y-m-31",time()));
                break;
            case 'DAY':
                $startTime = strtotime(date("Y-m-d",strtotime("-$number day")));
                $endTime  = strtotime(date("Y-m-d",time()));
                break;
            default:
                break;
        }


        $sql = "SELECT FROM_UNIXTIME(create_time,'%Y-%m-%d') as create_time, COUNT(id) as number FROM ewei_user WHERE create_time >= '{$startTime}' AND create_time <= '{$endTime}' GROUP BY FROM_UNIXTIME(create_time,'%Y-%m-%d') ORDER BY create_time";
        $userRow = Db::name('user')->query($sql);

        //查询当月用户数据统计
        // $userRow  = Db::name('user')->where($map)->field('create_time')->select();
        if( empty( $userRow )){
            return json(['data'=>[],'code'=>1,'message'=>'操作完成']);
        }
        $y = date('Y',time());
        $m = date('m',time());
//        dump($userRow);die;
        $userRows = [];
//        for($i=1;$i<=31;$i++){
//            $userRows[] = [$y.'-'.$m.'-'.$i,0];
            $userRows[] = ['2018-03-2',0];
            foreach ($userRow as $key => $value) {
//                if(strtotime($y.'-'.$m.'-'.$i) == strtotime($value['create_time']) ){
                    $userRows[] = [$value['create_time'],$value['number']];
//                }
            }
//        }

        return json(['data'=>$userRows,'code'=>1,'message'=>'操作完成']);
    }

    /**
     * 首页顶部数据统计
     *
     * @return [type] [description]
     */
    public function dataCount(){
        //今日订单金额统计
        $data['todayAmount'] =  Order::accountCount();
        //商品统计[审核通过商品]
        $data['goodsCount']  =  Goods::getCount();
        //订单数量统计[有效订单]
        $data['orderCount']  =  Order::getCount();
        //订单数量统计[完成交易]
        $data['orderCompleteCount']  =  Order::getCount(2);
        //订单数量统计[本月销售量]
        $data['orderGoodsCount']  =  Order::getGoodsCount(1,'num');

        
        return json(['data'=>$data,'code'=>1,'message'=>'操作完成']);
    }

    /**
     * 订单数据统计
     */
    public function orderCount(){
        $datas = [];
        $data = Order::getOrderCount();
        $config = Config::get('order.status');
        if( empty($data) ){
            return json(['data'=>[],'code'=>1,'message'=>'操作完成']);
        }
        foreach ($data as $v){
            $datas[] = [$config[$v['order_status']],$v['number']];
        }
        return json(['data'=>$datas,'code'=>1,'message'=>'操作完成']);
    }

    public function categoryCountGoodsNumber(){
        $datas = [];
        $orderGoodsModel = new OrderGoods();
        $data = $orderGoodsModel::countGoodsNumberByCId();

        if( empty($data) ){
            return json(['data'=>[],'code'=>1,'message'=>'操作完成']);
        }
        $cateModel = new Category();
        foreach ($data as $v) {
            $name = $cateModel->getNameById($v['cid']);
            $datas[] = ['value'=>$v['number'],'name'=>$name];
        }


        return json(['data'=>$datas,'code'=>1,'message'=>'操作完成']);

    }

}

