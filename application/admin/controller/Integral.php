<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Db;

/**
 * 积分规则
 * Class SlideCategory
 * @package app\admin\controller
 */
class Integral extends AdminBase
{
    protected function _initialize()
    {
        parent::_initialize();

    }

    /**
     * 积分规则
     * @return mixed
     */
    public function rule()
    {
        $rule_list = Db::name('user_rank')->select();

        return $this->fetch('rule', ['rule_list' => $rule_list]);
    }

    /**
     * 添加积分
     * @return mixed
     */
    public function rule_add()
    {
        return $this->fetch();
    }

    /**
     * 保存规则
     */
    public function rule_save()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            if(!isset($data['rank_id'])){
                if(Db::name('user_rank')->insert($data)){
                    $this->success('保存成功');
                }else{
                    $this->error('保存失败');
                }

            }
            if (Db::name('user_rank')->where(['rank_id'=>$data['rank_id']])->update($data)) {
                $this->success('保存成功');
            } else {
                $this->error('保存失败');
            }
        }
    }

    /**
     * 积分规则
     * @return mixed
     */
    public function rule_edit($id)
    {
        $rank = Db::name('user_rank')->find($id);
        return $this->fetch('rule_edit', ['rank' => $rank]);
    }


    /**
     * 积分规则
     * @return mixed
     */
    public function rule_delete($id)
    {
         if (Db::name('user_rank')->delete($id) !== false) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }

    /**
     * 用户积分日志[未完成]
     * @return mixed
     */
    public function user_integral_log($id)
    {

        $log = Db::name('user_integral_log')->where(['u_id'=>$id])->select();

        return $this->fetch('/user/user_integral_log', ['log' => $log]);
        
    }
}