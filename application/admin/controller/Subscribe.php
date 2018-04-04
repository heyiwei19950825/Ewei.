<?php
/**
 * 预约模块
 * User: heyiw
 * Date: 2018/3/15
 * Time: 11:45
 */

namespace app\admin\controller;

use app\common\model\InternetOrder;
use app\common\model\InternetOrderMachine;
use app\common\server\InternetServer;
use app\common\lib\Helper;
use app\common\controller\AdminBase;
use app\common\model\Api;
use think\Db;
use think\Request;

class Subscribe extends AdminBase
{
    private $api = '';
    public function _initialize(){
        parent::_initialize();
        $this->api = (new Api())->where(['key'=>'INTERNETBAR'])->find();
    }

    /**=================================================================================
     * 网吧订座管理模块
    ====================================================================================*/

    public function internet(){
        $row = Db::name('statistics')->where(['uid'=>1])->find();
        return $this->fetch('',['statistics'=>$row]);
    }
    /**
     * 网吧机器数量检测 并记录将数据记录到数据库中
     */
    public function internetNumberCheck(){
        if($this->request->isPost()){
            $computer = [];
            $apiUrl = $this->api['api'];
            $uid = $this->instance_id;
            $data = json_decode( Helper::curl_get($apiUrl),true);
//            if( !empty($data) ){
//                $computer = InternetServer::apiDataDispose($data);
//            }
//            $request = $this->request->only('number');
//            $number = (int)$request['number'];
            $count = 0;

            if(empty($data) ){
                $this->error('未检测机器');
            }
//            for($i=1;$i<=$number;$i++){
//                $data[] = [
//                    'number' => $i
//                ];
//            }
            //循环添加网吧机器
            foreach ($data['offline'] as $key=>$item) {
                $number = explode('.',$item)[3];
                $computer[] = [
                    'number' => $number,
                    'ip'     => $item,
                    'line'   => 'offline',
                    'uid'    => $uid
                ];
                $count++;
            }
            //循环添加网吧机器
            foreach ($data['online'] as $key=>$item) {
                $number = explode('.',$item)[3];
                $computer[] = [
                    'number' => $number,
                    'ip'     => $item,
                    'line'   => 'online',
                    'uid'    => $uid
                ];
                $count++;
            }

            //清空原有数据
            Db::name('internet_machine')->query('TRUNCATE ewei_internet_machine');
            $row = Db::name('internet_machine')->insertAll($computer);


            //检查是否已经创建信息
            if( Db::name('internet_bar_setting')->where(['uid'=>$uid])->find() != null ){//修改
                Db::name('internet_bar_setting')->where(['uid'=>$uid])->update(['machine_number'=> $count]);
            }else{//创建
                Db::name('internet_bar_setting')->insert([
                    'uid'=>$uid,
                    'machine_number'=> $count,
                ]);
            }

            if( !empty($computer) ){
                $row = [
                    'count' => $count,
                ];
                $this->result($row,1,'生成成功','json');
            }else{
                $this->error('接口宕机请联系开发~！');
            }

        }
    }

    public function setting(){

        $info = Db::name('internet_bar_setting')->where([
            'uid'=>$this->instance_id
        ])->find();

        if( $info == '' ){
            $info = [
                'machine_number' => '',
                'time_rule' => [],
                'rule' => [],
                'reserve_number' => 0,
            ];
            $rule = [];
            $time = [];
        }else{
            //时间规则
            $time = json_decode($info['time_rule']);
            //计费规则
            $rule = Db::name('internet_machine_rule')->where([
                'uid'=>$this->instance_id
            ])->select()->toArray();
            $reserve_number = $info['reserve_number'];
        }

        return $this->fetch('',['info'=>$info,'rule_list'=>$rule,'time_rule'=>$time,'reserve_number'=>$reserve_number,'controller'=>'internet']);
    }

    /**
     * 添加机器
     */
    public function internetMachineAdd(){
        if( $this->request->isPost()){
            $request = $this->request->only('number');
            $number = (int)$request['number'];
            if($number == 0 ){
                $this->error('请填写机器数量');
            }
            $data = [];
            //循环添加网吧机器
            for($i=1;$i<=$number;$i++){
                $data[] = [
                    'number' => $i
                ];
            }
            //清空原有数据
            Db::name('internet_machine')->query('TRUNCATE ewei_internet_machine');
            $row = Db::name('internet_machine')->insertAll($data);
            $uid = $this->instance_id;

            //检查是否已经创建信息
            if( Db::name('internet_bar_setting')->where(['uid'=>$uid])->find() != null ){//修改
                Db::name('internet_bar_setting')->where(['uid'=>$uid])->update(['machine_number'=> $number]);
            }else{//创建
                Db::name('internet_bar_setting')->insert([
                    'uid'=>$uid,
                    'machine_number'=> $number,
                ]);
            }
            if( $row  ){
                $this->success('生成成功');
            }
        }else{
            $this->error('错误请求');
        }
    }

    /**
     * 绑定数据监测并返回数据
     */
    public function relevanceCheck(){
        if($this->request->isPost()){
            $params = $this->request->param();
            if( $params['ruleId'] == 0 ){//创建规则
                Db::name('internet_machine_rule')->insert([
                    'name'=>$params['ruleName'],
                    'color'=>$params['ruleColor'],
                    'price'=>$params['rulePrice'],
                    'uid'=>$this->instance_id,
                ]);

                $ruleId = Db::name('internet_machine_rule')->getLastInsID();
            }else{//修改规则
                Db::name('internet_machine_rule')->where(['id'=>$params['ruleId']])->update([
                    'name'=>$params['ruleName'],
                    'color'=>$params['ruleColor'],
                    'price'=>$params['rulePrice'],
                    'uid'=>$this->instance_id,
                ]);

                $ruleId = $params['ruleId'];
            }
            $row = InternetServer::getMachineList();
            if( $row == []){
                $this->error('请先生成机器');
            }
            $data = [
                'data'=>[
                    'list'=>$row,
                    'ruleId'=>$ruleId
                ],
                'code'=> 1,
                'msg' => '查询成功'
            ];
            return json( $data );
        }else{
            $this->error('错误请求');
        }
    }

    /**
     * 保存机器配置
     */
    public function relevanceSave(){
        if($this->request->isPost()){
            $param = $this->request->param();

            if( $param['ruleId'] == '' ){
                $this->error('请先选择需要配置的机器');
            }
            $param['relevance'] = explode(',',rtrim($param['relevance'],','));
            $param['delData'] = rtrim($param['delData'],',');
            $row = InternetServer::relevanceSave( $param );
            if($row == false){
                $this->error('错误请求');
            }
            $this->result($row,1,'保存成功','json');
        }else{
            $this->error('错误请求');
        }
    }

    /**
     * 删除计费规则
     * @param $id
     */
    public function delRule( $id )
    {
        if ($this->request->isPost()) {
            if(empty($id) ) $this->error('错误请求');
            if(Db::name('internet_machine_rule')->where([
                'id' => $id
            ])->delete()){
                Db::name('internet_machine')->where([
                    'rule_id' => $id
                ])->update(['rule_id'=>0]);
                $this->success('删除成功');
            }else{
                $this->error('删除失败');
            }
        }else{
            $this->error('错误请求');
        }
    }

    /**
     * 网吧配置
     */
    public function internetBarSting(){
        if( $this->request->isPost()){
            $params = $this->request->param();
            $uid = $this->instance_id;
            $time_rule = $params['time_rule'];
            $reserve_number = $params['reserve_number'];
            $integral = $params['integral'];

            foreach ($time_rule as $k=>&$v){
                if($v==''){
                    unset($time_rule[$k]);
                }
            }
            $time_rule = json_encode($time_rule);
            if( $time_rule != '' ){
                if(Db::name('internet_bar_setting')->where(['uid'=>$uid])->update(['time_rule'=> $time_rule,'reserve_number'=>$reserve_number,'integral'=>$integral])){
                    $this->success('保存成功');
                }else{//没有修改时也返回修改成功
                    $this->success('保存成功');
                }
            }else{
                $this->error('网络异常');
            }
        }else{
            $this->error('错误请求');
        }
    }

    /**
     * 获取订单列表
     */
    public function getOrderList(){
            if( $this->request->isPost()) {
                $InternetOrderModel = new InternetOrder();
                $InternetOrderMachineModel = new InternetOrderMachine();
                $params = $this->request->param();
                $condition = [];
                $condition['status'] = ['<>', 0];
                $field = 'order_no,name,order_money,status,check_status,add_time';
                $row = $InternetOrderModel->getOrderList($params['page'], $params['size'], $condition, 'add_time desc', $field);
                if ($row['total_count'] != 0) {
                    $data = $row['data']->toArray();
                    foreach ($data as $k => $v) {
                        $data[$k]['time'] = Helper::time_tran($v['add_time']);
                        $data[$k]['add_time'] = date('Y-m-d H:i:s', $v['add_time']);
                        $MachineList = $InternetOrderMachineModel->getList(1, 10, ['order_no' => $v['order_no']], '', '');
                        $data[$k]['machineList'] = $MachineList['data']->toArray();
                    }
                    $row['data'] = $data;

                    $this->success('查询成功', '', $row);
                } else {
                    $this->error('没有更多数据');
                }
            }else{
                return $this->fetch('/subscribe/order');
            }
    }

    /**
     * 确认订单检测状态
     */
    public function affirmOrderCheckStatus(){
        if( $this->request->isPost()){
            $orderNo = $this->request->param('order_no');
            $row = Db::name('internet_order')->where([
                'order_no' => $orderNo
            ])->update(['check_status'=> 1]);
            if( $row ){
                $this->success('已处理');
            }else{
                $this->error('网络异常');
            }
        }else{
            $this->error('网络异常');
        }
    }

    /**
     * 验证上机码
     */
    public function verifyCode(){
        if($this->request->isPost()){
            $params = $this->request->param();
            $map = [
                'code'=>$params['code'],
                'order_no'=>$params['order_no'],
                'status' => 1
            ];
            $order = Db::name('internet_order')->where($map)
             ->find();

            if( empty($order) ){
                $this->error('验证错误');
            }else{
                //添加屏蔽时间 预留机器时间
                Db::name('internet_machine')->where([
                    'order_no' => $params['order_no'],
                ])->update([
                    'lock_time' => time()+300
                ]);

                $this->success('验证成功，确认来店');
            }
        }else{
            $this->error('网络异常');
        }
    }

}