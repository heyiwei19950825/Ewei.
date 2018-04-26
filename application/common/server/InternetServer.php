<?php
/**
 * 网吧数据处理类
 * User: heyiw
 * Date: 2018/3/16
 * Time: 11:36
 */
namespace app\common\server;
use app\common\model\InternetMachineRule;
use app\common\model\InternetMachine;
use think\Db;

class InternetServer extends BaseServer
{


    public static function apiDataDispose( $data = [],$uid=0){
        $offline =  $online = '';
        $computer = [];

        if($uid == 0){
            return [];
        }
        //删除未支付的订单
        Db::name('internet_order')->where(['status'=>0,'add_time'=>['<',time()-300]])->delete();
        Db::name('internet_order_machine')->where(['status'=>0,'add_time'=>['<',time()-300]])->delete();

        foreach ($data['offline'] as $item){
            if( !empty($item) ){
                $key = explode('.',$item)[3];
                $computer[$key] = [
                    'ip' => $item,
                    'line'=> 'offline'
                ];
                $row = Db::name('internet_machine')->where(['number'=>$key,'status'=>2])->find();
                //检测预约已经过期的
                $orderMachineRow = Db::name('internet_order_machine')->where(['machine_number'=>$key,'order_no'=>$row['order_no']])->find();

                //已确认的并且到达解锁时间
                if( ($row['lock_time'] != '' && $row['lock_time'] < time()) || ($orderMachineRow['add_time'] + $orderMachineRow['duration'] * 3600) < time()){
                    $map = ['order_no'=>$row['order_no']];
                    //订单完成
                    Db::name('internet_order')->where($map)->update([
                        'status' => 2,
                        'check_status' => 1
                    ]);
                    //订单机器
                    Db::name('internet_order_machine')->where($map)->update([
                        'status' => 2
                    ]);
                    //修改当前机器状态
                    Db::name('internet_machine')->where($map)->update([
                        'order_no' => '',
                        'status' => 0,
                        'lock_time'=>0
                    ]);
                }
                //修改机器状态
                Db::name('internet_machine')->where(['number'=>$key,'ip'=>$item,'status'=>['<>',2]])->update(['line'=>'offline','status'=>0]);

                $offline++;
            }
        }
        foreach ($data['online'] as $item){
            if( !empty($item) ){
                $key = explode('.',$item)[3];
                $computer[$key] = [
                    'ip' => $item,
                    'line'=> 'online'
                ];

                $row = Db::name('internet_machine')->where(['number'=>$key,'status'=>2])->find();
                //检测预约已经过期的
                $orderMachineRow = Db::name('internet_order_machine')->where(['machine_number'=>$key,'order_no'=>$row['order_no']])->find();
                //已确认的并且到达解锁时间
                if( ($row['lock_time'] != '' && $row['lock_time'] < time()) || ($orderMachineRow['add_time'] + $orderMachineRow['duration'] * 3600) < time()){

                    $map = ['order_no'=>$row['order_no']];
                    //订单完成
                    Db::name('internet_order')->where($map)->update([
                        'status' => 2,
                        'check_status' => 1
                    ]);
                    //订单机器
                    Db::name('internet_order_machine')->where($map)->update([
                        'status' => 2
                    ]);
                    //修改当前机器状态
                    Db::name('internet_machine')->where($map)->update([
                        'order_no' => '',
                        'status' => 0,
                        'lock_time'=>0
                    ]);
                }


                //修改机器状态
                Db::name('internet_machine')->where(['number'=>$key,'ip'=>$item,'status'=>['<>',2]])->update(['line'=>'online','status'=>1]);
                Db::name('internet_machine')->getLastSql();
                $online++;
            }
        }

        //查询机器状态
        $map = [
            'm.uid'=>$uid
        ];

        $mData = Db::name('internet_machine')->alias('m')
            ->join('internet_machine_rule r','m.rule_id = r.id','LEFT')
            ->join('internet_order_machine o','m.order_no = o.order_no','LEFT')
            ->join('user u','o.uid = u.id','LEFT')
            ->where($map)
            ->field('m.number,m.rule_id,m.ip,m.line,r.name,r.price,u.nickname,u.portrait,u.username,u.sex,u.id_card,o.order_no')
            ->group('m.number')
            ->select()->toArray();


        return [
            'computer'=> $mData,
        ];
    }

    /**
     * 获取机器详情列表
     */
    public static function getMachineList( ){
        $row = Db::name('internet_machine')->alias('m')
            ->join('internet_machine_rule r','r.id=m.rule_id','LEFT')
            ->field('m.number,r.name,r.price,color')
            ->group('m.number')
            ->select()->toArray();
        return $row;

    }

    /**
     * 计费规则保存
     * @param $par
     * @return mixed
     */
    public static function relevanceSave( $param ){
        $relevance = $param['relevance'];
        $delData = $param['delData'];
        unset($param['relevance']);
        unset($param['delData']);

        $data = [
            'rule_id' => $param['ruleId'],
        ];

        if( $delData !=''){
            Db::name('internet_machine')->where([
                'number'=>[
                    'IN',$delData
                ]
            ])->update(['rule_id' => 0]);
        }

        //启动事务
        Db::startTrans();
        try{
            foreach ($relevance as $item) {
                Db::name('internet_machine')->where(['number'=>$item])->update($data);
            }
            // 提交事务
            Db::commit();
            return true;
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            return false;
        }

    }


    /**
     * 查询机器计费规则
     * @param $number
     * @return array|false|\PDOStatement|string|\think\Model
     */
    public static function selectMachineRelevance( $number ){
        $InternetMachineRule = new InternetMachine();
        $row = $InternetMachineRule->alias('m')
            ->join('internet_machine_rule r','m.rule_id = r.id','LEFT')
            ->field('m.number,r.name,r.price')
            ->where([
                'm.number'=>$number,
                'm.rule_id'=>[
                    '<>',0
                ]
            ])->find();
         return $row;
    }
}