<?php
namespace app\admin\controller;

use app\common\model\AdminUser as AdminUserModel;
use app\common\model\AuthGroup as AuthGroupModel;
use app\common\model\AuthGroupAccess as AuthGroupAccessModel;
use app\common\controller\AdminBase;
use app\common\model\Shop;
use think\Config;
use think\Db;


/**
 * 管理员管理
 * Class AdminUser
 * @package app\admin\controller
 */
class AdminUser extends AdminBase
{
    protected $admin_user_model;
    protected $auth_group_model;
    protected $auth_group_access_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->admin_user_model        = new AdminUserModel();
        $this->auth_group_model        = new AuthGroupModel();
        $this->auth_group_access_model = new AuthGroupAccessModel();
    }

    /**
     * 管理员管理
     * @return mixed
     */
    public function index()
    {
        $admin_user_list = $this->admin_user_model->alias('u')
            ->join('auth_group_access a','a.uid = u.id','LEFT')
            ->join('auth_group g','g.id = a.group_id','LEFT')
            ->field('u.*,g.title')
            ->select();

        return $this->fetch('index', ['admin_user_list' => $admin_user_list]);
    }

    /**
     * 添加管理员
     * @return mixed
     */
    public function add()
    {
        $auth_group_list = $this->auth_group_model->select();
        $shop_category = Db::name('shop_group')->order('group_sort')->select();
        $admin_list = $this->admin_user_model->pageQuery(0,0,['p_id'=>0]);

        return $this->fetch('add', ['auth_group_list' => $auth_group_list,'shop_category'=>$shop_category,'admin_list'=>$admin_list['data']]);
    }

    /**
     * 保存管理员
     * @param $group_id
     */
    public function save($group_id)
    {
        if ($this->request->isPost()) {
            $data                   = $this->request->param();
            $validate_result = $this->validate($data, 'AdminUser');


            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                $data['password'] = md5($data['password'] . Config::get('salt'));
                $data['create_time'] = time();
                if ( $this->admin_user_model->allowField(true)->save($data) ) {
                    $auth_group_access['uid']      = $this->admin_user_model->id;
                    $auth_group_access['group_id'] = $group_id;
                    $this->auth_group_access_model->pageSave($auth_group_access);

                    //判断是否创建商铺
                    if($data['in_shop'] == 1 ){//创建店铺
                        (new Shop())->pageSave([
                            'id'            => $auth_group_access['uid'],
                            'shop_name'     => $data['shop_name'],
                            'shop_category' => $data['shop_category'],
                            'shop_status'   => 0,
                        ]);
                    }


                    $this->success('保存成功');
                } else {
                    $this->error('保存失败');
                }
            }
        }
    }

    /**
     * 编辑管理员
     * @param $id
     * @return mixed
     */
    public function edit($id)
    {
        $admin_user             = $this->admin_user_model->getInfo(['id'=>$id]);
        $auth_group_list        = $this->auth_group_model->select();
        $auth_group_access      = $this->auth_group_access_model->getInfo(['uid'=>$id]);

        $admin_user['group_id'] = $auth_group_access['group_id'];

        return $this->fetch('edit', ['admin_user' => $admin_user, 'auth_group_list' => $auth_group_list]);
    }

    /**
     * 更新管理员
     * @param $id
     * @param $group_id
     */
    public function update($id, $group_id)
    {
        if ($this->request->isPost()) {
            $data                          = $this->request->param();
            $auth_group_access['uid']      = $id;
            $auth_group_access['group_id'] = $group_id;
            $validate_result               = $this->validate($data, 'AdminUser');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if (!empty($data['password']) && !empty($data['confirm_password'])) {
                    $data['password'] = md5($data['password'] . Config::get('salt'));
                }else{
                    unset($data['password']);
                }

                unset($data['confirm_password']);
                unset($data['group_id']);
                unset($data['id']);
                $this->admin_user_model->pageSave($data,['id'=>$id]);
                if($this->auth_group_access_model->getInfo(['uid'=>$id])){
                    $this->auth_group_access_model->pageSave($auth_group_access,['uid'=>$id]);
                }else{
                    $this->auth_group_access_model->pageSave($auth_group_access);
                }
                $this->success('更新成功');
            }
        }
    }

    /**
     * 删除管理员
     * @param $id
     */
    public function delete($id)
    {
        if ($id == 1) {
            $this->error('默认管理员不可删除');
        }
        if ($this->admin_user_model->pageDel(['id'=>$id])) {
            $this->auth_group_access_model->pageDel(['uid'=>$id]);
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}