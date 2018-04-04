<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/3/22
 * Time: 1:49
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use app\common\model\Goods as GoodsModel;
use think\Db;

class Prize extends AdminBase
{
    private $goods = '';
    protected function _initialize()
    {

        parent::_initialize();
        $this->goods = new GoodsModel();
    }

    public function index(){
        $uid = $this->instance_id;
        if( $this->request->isPost()){

            $params = $this->request->param();
            if ($params['integral'] == ''){
                $this->error('请填写消耗积分数量');
            }
            $rule = '';

            $rule_odds = 0;
            foreach ($params['goods_id'] as $k=>$v ){
                if($v == '' && $params['rule_odds'][$k] == ''){
                    continue;
                }
                if($v != '' && $params['rule_odds'][$k] == ''){
                    $this->error('请填写完整规则');
                }
                $rule[$k] = [
                    'goods_id'=> $v,
                    'rule_odds'=> $params['rule_odds'][$k]
                ];
                $rule_odds +=  $params['rule_odds'][$k]+0;
            }

            if(count($rule) < 12 ){
                $this->error('请选填12个奖品信息');
            }

            if($rule_odds  !== 100 ){
                $this->error('中奖几率相加必须为100');
            }

            $rule = json_encode($rule);
            $check = Db::name('prize')->where([
                'uid'=>$uid
            ])->find();

            if( $check ){
                Db::name('prize')->where([
                    'uid'=>$uid
                ])->update([
                    'rule' => $rule,
                    'integral' => $params['integral']
                ]);
            }else{
                Db::name('prize')->insert([
                    'uid' => $uid,
                    'rule' => $rule,
                    'integral' => $params['integral']
                ]);
            }
            $this->success('操作成功');

        }else{

            $map = $rule = [];
            $integral = 0;
            $map['is_virtual'] = 1;
            $prize = Db::name('prize')->where(
                [
                    'uid'=>$uid
                ]
            )->find();
            if($prize){
                $rule = json_decode($prize['rule'],true);
                $integral = $prize['integral'];
                foreach ( $rule  as $k => &$v){
                    $map['id'] = $v['goods_id'];
                    $goodsInfo = $this->goods->getGoodsList($map,false,0,0,'id,name,content,thumb,sp_integral,need_rank')->toArray();
                    if( !empty($goodsInfo) ){
                        $v['goodsInfo'] = $goodsInfo[0];
                    }else{
                        $v['goodsInfo'] = [];
                    }
                }
            }

            
            return $this->fetch('',['rule'=>$rule,'integral'=>$integral]);
        }

    }

    /**
     * 中奖信息列表
     */
    public function winList(){
        //初始化数据
        $size = $this->request->param('size',20);
        $page = $this->request->param('page',1);
        $keyword =  $this->request->param('keyword');
        $map = [];

        if( !empty($keyword) ){
            $map['u.userName'] = ['like',"%{$keyword}%"];
        }

        $userWinList = Db::name('user_win')->alias('w')
            ->where($map)
            ->join('user u','u.id=w.uid','LEFT')
            ->join('goods g','g.id=w.gid','LEFT')
            ->order('w.add_time desc')
            ->field('w.id,g.name,g.thumb,u.username,u.portrait,u.from,w.code,w.add_time,w.exchange_time,w.note,w.status')
            ->paginate($size, false, ['page' => $page]);

//        dump($userWinList);die;
        return $this->fetch('win_list',['list'=>$userWinList]);
    }

    /**
     * 添加中奖备注信息
     */
    public function addNote(){
        if($this->request->isPost()){
            $params = $this->request->param();
            if( Db::name('user_win')->where(['id'=>$params['id']])->update(['note'=>$params['msg']])){
                $this->success('备注成功');
            }else{
                $this->error('网络异常');
            }
        }else{
            $this->error('网络异常');
        }
    }

    /**
     * 验证code是否正确
     */
    public function verifyCode(){
        if($this->request->isPost()){
            $params = $this->request->param();
            $win = Db::name('user_win')->where(['id'=>$params['id']])->field('code')->find();
            if( empty($win) ){
                $this->error('验证失败');
            }

            if($win['code'] === $params['code']){
                $row = Db::name('user_win')->where(['id'=>$params['id']])->update([
                    'status'=>1,
                    'exchange_time' => time()
                ]);
                if( $row ){
                    $this->success('验证成功');
                }else{
                    $this->error('请重新验证');
                }
            }else{
                $this->error('验证失败');
            }
        }else{
            $this->error('网络异常');
        }
    }
}