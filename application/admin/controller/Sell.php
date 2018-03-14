<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/3/14
 * Time: 1:05
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use think\Db;

class Sell extends AdminBase
{
        public function index(){
            //查询订单总收入
            $totalMoneySql = "SELECT SUM(order_money) AS total FROM ewei_order WHERE order_status IN(1,2,3,7)";
            $totalMoneyData = Db::query($totalMoneySql);

            //订单总数[查询所有的订单]
            $totalOrderNumberSql = "SELECT COUNT(id) AS total FROM ewei_order";
            $totalOrderNumberData = Db::query($totalOrderNumberSql);

            //待发货订单
            $totalDeliverSql = "SELECT COUNT(id) AS total FROM ewei_order WHERE order_status IN(1)";
            $totalDeliverData = Db::query($totalDeliverSql);

            //待签收订单
            $totalNoSignSql = "SELECT COUNT(id) AS total FROM ewei_order WHERE order_status IN(2)";
            $totalNoSignData = Db::query($totalNoSignSql);

            //退款金额
            $totalRetreatSql = "SELECT SUM(refund_money) AS total ,COUNT(id) AS num FROM ewei_order WHERE order_status IN(6)";
            $totalRetreatData = Db::query($totalRetreatSql);

            //销售商品总数量
            $totalSellGoodsSql = "SELECT count(p.num) AS num ,SUM(price*num) AS totalMoney,SUM(cost_price * num) AS totalCost FROM ewei_order AS o LEFT JOIN ewei_order_product AS p ON o.id = p.order_goods_id WHERE o.order_status IN (3)";
            $totalSellGoodsData = Db::query($totalSellGoodsSql);
            return $this->fetch('',[
                'totalMoney' => $totalMoneyData[0]['total']== NULL?0:$totalMoneyData[0]['total'],
                'totalOrderNumber' => $totalOrderNumberData[0]['total']== NULL?0:$totalOrderNumberData[0]['total'],
                'totalDeliver' => $totalDeliverData[0]['total']== NULL?0:$totalDeliverData[0]['total'],
                'totalNoSign' => $totalNoSignData[0]['total']== NULL?0:$totalNoSignData[0]['total'],
                'totalRetreat' => $totalRetreatData[0]['total'] == NULL?0:$totalRetreatData[0]['total'],
                'totalRetreatNum' => $totalRetreatData[0]['num'] == NULL?0:$totalRetreatData[0]['num'],
                'totalSellGoodsNum' => $totalSellGoodsData[0]['num'] == NULL?0:$totalSellGoodsData[0]['num'],
                'totalSellGoodsTotal' => $totalSellGoodsData[0]['totalMoney'] == NULL?0:$totalSellGoodsData[0]['totalMoney'],
                'totalSellGoodsCost' => $totalSellGoodsData[0]['totalCost'] == NULL?0:$totalSellGoodsData[0]['totalCost'],
            ]);
        }

        public function getCount(){
            //订单总数[查询所有的订单]
            $sql = "SELECT FROM_UNIXTIME(create_time,'%Y-%m-%d') as create_time, COUNT(id) as number FROM ewei_order GROUP BY FROM_UNIXTIME(create_time,'%Y-%m-%d') ORDER BY create_time";
            $data = Db::query($sql);


            $total = [];
            $total[] = ['2018-03-12',0];

            foreach ($data as $key => $value) {
                $total[] = [$value['create_time'],$value['number']];
            }
            //签收
            $sign = [];
            $sign[] = ['2018-03-12',0];
            $sql2 = "SELECT FROM_UNIXTIME(create_time,'%Y-%m-%d') as create_time, COUNT(id) as number FROM ewei_order WHERE order_status = 3 GROUP BY FROM_UNIXTIME(create_time,'%Y-%m-%d') ORDER BY create_time";
            //全部
            $data2 = Db::query($sql2);
            foreach ($data2 as $key => $value) {
                $sign[] = [$value['create_time'],$value['number']];
            }

            //退换货
            $sql3 = "SELECT FROM_UNIXTIME(create_time,'%Y-%m-%d') as create_time, COUNT(id) as number FROM ewei_order WHERE order_status IN (4,5) GROUP BY FROM_UNIXTIME(create_time,'%Y-%m-%d') ORDER BY create_time";
            $data3 = Db::query($sql3);
            $retreat = [];
            $retreat[] = ['2018-03-12',0];

            foreach ($data3 as $key => $value) {
                $retreat[] = [$value['create_time'],$value['number']];
            }
            //已退款的
            $sql4 = "SELECT FROM_UNIXTIME(create_time,'%Y-%m-%d') as create_time, COUNT(id) as number FROM ewei_order WHERE order_status IN (6) GROUP BY FROM_UNIXTIME(create_time,'%Y-%m-%d') ORDER BY create_time";
            $data4 = Db::query($sql4);
            $refund = [];
            $refund[] = ['2018-03-12',0];

            foreach ($data4 as $key => $value) {
                $refund[] = [$value['create_time'],$value['number']];
            }

            //已取消的
            $sql5 = "SELECT FROM_UNIXTIME(create_time,'%Y-%m-%d') as create_time, COUNT(id) as number FROM ewei_order WHERE order_status IN (8) GROUP BY FROM_UNIXTIME(create_time,'%Y-%m-%d') ORDER BY create_time";
            $data5 = Db::query($sql5);
            $cancel = [];
            $cancel[] = ['2018-03-12',0];

            foreach ($data5 as $key => $value) {
                $cancel[] = [$value['create_time'],$value['number']];
            }

            $datas = [
                'total' => $total,
                'sign'  => $sign,
                'retreat'  => $retreat,
                'refund'  => $refund,
                'cancel'  => $cancel,
            ];
            return json(['data'=>$datas,'code'=>1,'message'=>'操作完成']);

        }
}