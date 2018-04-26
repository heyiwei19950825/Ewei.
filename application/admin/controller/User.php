<?php
namespace app\admin\controller;

use app\common\model\User as UserModel;
use app\common\controller\AdminBase;
use think\Config;
use think\Db;

/**
 * 用户管理
 * Class AdminUser
 * @package app\admin\controller
 */
class User extends AdminBase
{
    protected $user_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->user_model = new UserModel();
    }

    /**
     * 用户管理
     * @param string $keyword
     * @param int    $page
     * @return mixed
     */
    public function index($keyword = '', $page = 1)
    {
        $map = [];
        if ($keyword) {
            $map['nickname|mobile|email'] = ['like', "%{$keyword}%"];
        }
        //查询积分规则获取用户等级注释
        $rankList = Db::name('user_rank')->select()->toArray();
        if( empty($rankList) ){
            $user_list = $this->user_model->where($map)->order('id DESC')->limit(($page-1)*15,15)->select();
            foreach ($user_list as &$v){
                $v['rank_name'] = '普通用户';
            }
            $render = $this->user_model->where($map)->order('id DESC')->paginate(15, false, ['page' => $page]);
        }else{
            $user_list = $this->user_model->where($map)->order('id DESC')->select()->toArray();
            foreach ( $user_list as $k => $v){
                $user_list[$k]['from'] = config('order.from')[$v['from']];
                foreach ($rankList as $rk=>$rv){
                    if( $rv['rank_id'] ==$v['rank_id'] ){
                        $user_list[$k]['rank_name'] = $rv['rank_name'];
                    }
                }
               if( !isset($user_list[$k]['rank_name'])){
                   $user_list[$k]['rank_name']  = '普通会员';
               }
            }
            $render = $this->user_model->alias('u')->field('u.*,k.rank_name')->join('user_rank k','u.rank_id = k.rank_id')->where($map)->order('u.id DESC')->paginate(15, false, ['page' => $page]);
        }

        return $this->fetch('index', ['user_list' => $user_list,'render'=>$render, 'keyword' => $keyword]);
    }

    /**
     * 添加用户
     * @return mixed
     */
    public function add()
    {
        $rank = Db::name('user_rank')->select();
        return $this->fetch('',['rank'=>$rank]);
    }

    /**
     * 保存用户
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->post();
            $data['uni_id']  = uniqid();
            $validate_result = $this->validate($data, 'User');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                $data['password'] = md5($data['password'] . Config::get('salt'));
                if ($this->user_model->allowField(true)->save($data)) {
                    $this->success('保存成功');
                } else {
                    $this->error('保存失败');
                }
            }
        }
    }

    /**
     * 编辑用户
     * @param $id
     * @return mixed
     */
    public function edit($id)
    {
        $user = $this->user_model->find($id);
        $rank = Db::name('user_rank')->select();
        return $this->fetch('edit', ['user' => $user,'rank'=>$rank]);
    }

    /**
     * 更新用户
     * @param $id
     */
    public function update($id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->post();
//            $validate_result = $this->validate($data, 'User');
//
//            if ($validate_result !== true) {
//                $this->error($validate_result);
//            } else {
//                $user           = $this->user_model->where(['id'=>$id])->update($data);
//                $user->id       = $id;
//                $user->nickname = $data['nickname'];
//                $user->mobile   = $data['mobile'];
//                $user->email    = $data['email'];
//                $user->status   = $data['status'];
//                $user->experience = $data['experience'];
//                $user->rank_id = $data['rank_id'];
//                $user->sex = $data['sex'];
//                $user->id_card = $data['id_card'];
//                $user->username = $data['username'];
//                $user->is_vip = $data['is_vip'];
//                if (!empty($data['password']) && !empty($data['confirm_password'])) {
//                    $user->password = md5($data['password'] . Config::get('salt'));
//                }
                if ($this->user_model->where(['id'=>$id])->update($data) !== false) {
                    $this->success('更新成功');
                } else {
                    $this->error('更新失败');
                }
//            }
        }
    }

    /**
     * 删除用户
     * @param $id
     */
    public function delete($id)
    {
        if ($this->user_model->destroy($id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }

    /**
     * Vip用户申请列表
     */
    public function vipList( $keyword = '', $page = 1 ){
        $map = [];
        $map['is_vip'] = ['in','1,2,3'];
        if ($keyword) {
            $map['nickname|mobile|email'] = ['like', "%{$keyword}%"];
        }
        //查询积分规则获取用户等级注释
        $rankList = Db::name('user_rank')->select()->toArray();
        if( empty($rankList) ){
            $user_list = $this->user_model->where($map)->order('is_vip ASC')->select();
            foreach ($user_list as &$v){
                $v['rank_name'] = '普通用户';
            }
            $render = $this->user_model->where($map)->order('id DESC')->paginate(15, false, ['page' => $page]);
        }else{
            $user_list = $this->user_model->alias('u')->field('u.*,k.rank_name')->join('user_rank k','u.rank_id = k.rank_id')->where($map)->order('u.id DESC')->select();
            $render = $this->user_model->alias('u')->field('u.*,k.rank_name')->join('user_rank k','u.rank_id = k.rank_id')->where($map)->order('u.id DESC')->paginate(15, false, ['page' => $page]);
        }

        foreach ( $user_list as $item) {
            switch ($item['is_vip']){
                case 1:
                    $item['is_vip'] = '申请VIP';
                    break;
                case 2:
                    $item['is_vip'] = '审核通过';
                    break;
                case 3:
                    $item['is_vip'] = '拒绝申请';
                    break;
            }
        }

        // $user_list = $this->user_model->where($map)->order('id DESC')->paginate(15, false, ['page' => $page]);
        return $this->fetch('user_vip_list', ['user_list' => $user_list,'render'=>$render, 'keyword' => $keyword,'controller'=>'apply']);
    }

    /**
     * 用户VIP操作
     */
    public function optionVipUser(){
        $param = $this->request->param();
        if( $param['id'] == '' || empty($param['id']) ){
            $this->error('参数错误');
        }
        $row = UserModel::update(['is_vip'=>$param['is_vip'],'vip_refuse_note'=>$param['note']],['id'=>$param['id']]);

        if( $row ){
            $this->success('审批成功');
        }else{
            $this->error('网络异常');
        }
    }

    /**
     * 用户申请Vip
     */
    public function applyVip( $id ){
        if( $id == '' || empty($id) ){
           $this->error('参数错误');
        }
        $row = $this->user_model->where(['id'=>$id])->update(['is_vip'=>1]);
        if( $row ){
            $this->success('审批成功');
        }else{
            $this->error('网络异常');
        }
    }
}