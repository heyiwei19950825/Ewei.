<?php
namespace app\admin\controller;

use app\common\model\AdminUser;
use app\common\model\AuthGroupAccess;
use think\Config;
use think\Controller;
use think\Db;
use think\Session;

/**
 * 后台登录
 * Class Login
 * @package app\admin\controller
 */
class Login extends Controller
{
    /**
     * 后台登录
     * @return mixed
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 登录验证
     * @return string
     */
    public function login()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->only(['username', 'password', 'verify']);
//            $validate_result = $this->validate($data, 'Login');
//            if ($validate_result !== true) {
//                $this->error($validate_result);
//            } else {
                $where['username'] = $data['username'];
                $where['password'] = md5($data['password'] . Config::get('salt'));
                $admin_user = (new AdminUser())->getInfo($where,'id,username,name,status,p_id');
                if (!empty($admin_user)) {
                    if ($admin_user['status'] != 1) {
                        $this->error('当前用户已禁用');
                    } else {
                        $admin_auth = (new AuthGroupAccess())->getInfo(['uid'=>$admin_user['id']]);
                        Session::set('admin_id', $admin_user['id']);//当前用户ID
                        Session::set('admin_p_id', $admin_user['p_id']);//当前用户的父级ID
                        Session::set('admin_name', $admin_user['name']);//当前用户名称
                        Session::set('admin_group', $admin_auth['group_id']);//权限

                        Db::name('admin_user')->where(['id'=>$admin_user['id']])->update(
                            [
                                'last_login_time' => date('Y-m-d H:i:s', time()),
//                                'last_login_ip'   => $this->request->ip()
                            ]
                        );
                        $this->success('登录成功', 'admin/Index/index','',1);
                    }
                } else {
                    $this->error('用户名或密码错误');
                }
//            }
        }
    }

    /**
     * 退出登录
     */
    public function logout()
    {
        Session::delete('admin_id');
        Session::delete('admin_name');
        Session::delete('admin_group');
        $this->success('退出成功', 'admin/login/index','',1);
    }
}
