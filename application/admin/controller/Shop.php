<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\Shop as ShopModel;
use app\common\model\ShopGroup as ShopGroupModel;
use app\common\model\AdminUser as AdminUserModel;
use app\common\model\AuthGroupAccess as AuthGroupAccessModel;


use think\Session;
use think\Config;


use think\Db;

/**
 * 店铺管理
 * Class SlideCategory
 * @package app\admin\controller
 */
class Shop extends AdminBase
{
    protected $shop_model;
    protected $shop_group_model;
    protected $admin_user_model;
    protected $auth_group_access_model;



    protected function _initialize()
    {
        parent::_initialize();
        $this->shop_model              = new ShopModel();
        $this->shop_group_model        = new ShopGroupModel();
        $this->admin_user_model        = new AdminUserModel();
        $this->auth_group_access_model = new AuthGroupAccessModel();

    }

    public function index( $page = 1,$keyword =''){
        $list = [];
        $map = [];
        $field = 'id,shop_name,uid,shop_recommend,shop_sort,shop_platform_commission_rate,shop_type,shop_state,shop_logo';

        if (!empty($keyword)) {
            $map['shop_name'] = ['like', "%{$keyword}%"];
        }

        $list  = $this->shop_model->field($field)->where($map)->order(['shop_sort' => 'DESC'])->paginate(15, false, ['page' => $page]);

    return $this->fetch('index',['list'=>$list,'keyword'=>$keyword]);
    }

    /**
    *   添加商家
    **/
    public function add(){
        if( $this->request->isPost()){
            $data = $this->request->param();
            $userData = array(
                'username' => $data['username'],
                'password' => md5($data['password'] . Config::get('salt')),
                'status'   => 1
            );

            //检测用户是否存在
            if( $this->admin_user_model->where(['username'=>$data['username']])->find()){
                $this->error('用户名已存在');
            }

            //创建平台用户
            if( $this->admin_user_model->allowField(true)->save($userData) ){
                //添加商家权限
                $auth_group_access['uid']      = $this->admin_user_model->id;
                $auth_group_access['group_id'] = 4;
                $this->auth_group_access_model->save($auth_group_access);
                
                //验证并创建商家
                $validate_result = $this->validate($data, 'Shop');
                if( $validate_result !== true ){
                    $this->error($validate_result);
                }else{
                    $shopData = array(
                        'shop_name'     => $data['shop_name'],
                        'shop_logo'     => $data['shop_logo'],
                        'shop_group_id' => $data['shop_group_id'],
                        'shop_state'    => $data['shop_state']
                    );
                    if ($this->shop_model->save($shopData)) {
                        $this->success('保存成功');
                    } else {
                        $this->error('保存失败');
                    }
                }
            }
        }else{
            //店铺分类组
            $shop_group_list = $this->shop_group_model->allowField(true)->field('id,group_name')->select();
            return $this->fetch('add',['shop_group_list'=>$shop_group_list]);
        }
    }

    /**
     * 删除商家
     * @param int   $id
     * @param array $ids
     */
    public function delete($id = 0, $ids = [])
    {
        $id = $ids ? $ids : $id;
        if ($id) {
            if ($this->shop_model->destroy($id)) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        } else {
            $this->error('请选择需要删除的文章');
        }
    }

    /**
    * 编辑商家
    * @param $id
    * @return mixed
    */
    public function edit( $id = 0 )
    {
        if( $this->request->isPost()){
            if ($this->request->isPost()) {
                $data            = $this->request->param();
                $validate_result = $this->validate($data, 'Shop');

                if ($validate_result !== true) {
                    $this->error($validate_result);
                } else {
                    if ($this->shop_model->allowField(true)->save($data, $data['id']) !== false) {
                        $this->success('更新成功');
                    } else {
                        $this->error('更新失败');
                    }
                }
            }

        }else{
            $info = $this->shop_model->find($id);
            //店铺分类组
            $shop_group_list = $this->shop_group_model->field('id,group_name')->select();
            return $this->fetch('edit', ['info' => $info,'shop_group_list'=>$shop_group_list]);
        }
      
    }


    /**
     * 店铺状态切换
     * @param array  $ids
     * @param string $type 操作类型
     */
    public function toggle($ids = [], $type = '')
    {
        $data   = [];
        $status = $type == 'audit' ? 1 : 0;
        if (!empty($ids)) {
            foreach ($ids as $value) {
                $data[] = ['id' => $value, 'shop_state' => $status];
            }
            if ($this->shop_model->saveAll($data)) {
                $this->success('操作成功');
            } else {
                $this->error('操作失败');
            }
        } else {
            $this->error('请选择需要操作的店铺');
        }
    }
}