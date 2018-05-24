<?php
namespace app\admin\controller;

use app\common\model\Nav as NavModel;
use app\common\controller\AdminBase;
use think\Db;


/**
 * 导航管理
 * Class Nav
 * @package app\admin\controller
 */
class Nav extends AdminBase
{

    protected $nav_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->nav_model = new NavModel();
        $nav_list        = $this->nav_model->pageQuery(0,0,[],[ 's_id' => 'ASC','sort' => 'DESC']);

        $nav_level_list  = array2level($nav_list['data']);
        $this->assign('nav_level_list', $nav_level_list);

        //页面菜单
        $page_list       =  Db::name('pages')->select();
        $this->assign('page_list', $page_list);

    }

    /**
     * 导航管理
     * @return mixed
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 添加导航
     * @param string $pid
     * @return mixed
     */
    public function add($pid = '')
    {
        return $this->fetch('add', ['pid' => $pid]);
    }

    /**
     * 保存导航
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->post();
            $data['s_id'] =$this->instance_id;
            $validate_result = $this->validate($data, 'Nav');
            $linkValue = '';

            //检测导航名称是否存在
            $checkName = $this->nav_model->getInfo(['name'=>$data['name']],'id');
            if($checkName){
                $this->error('导航名称已经存在');
            }

            //重新拼接url
            if(isset($data['link-value'])){
                foreach($data['link-value'] as $k=> $v){
                    $linkValue = '&'.$k.'='.$v;
                }
                $data['link'] =  $data['link'].'?'.trim($linkValue,'&');
                unset($data['link-value']);
            }

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->nav_model->pageSave($data)) {
                    $this->success('保存成功');
                } else {
                    $this->error('保存失败');
                }
            }
        }
    }

    /**
     * 编辑导航
     * @param $id
     * @return mixed
     */
    public function edit($id)
    {
        $nav = $this->nav_model->getInfo(['id'=>$id]);
        if( empty($nav) ){
            $this->error('您没有权限操作');
        }
        $link = explode('?',$nav['link']);
        $nav['link'] = $link[0];
        $nav['params'] = $paramsArray = [];
        if(!empty($link[1])){
            $params = explode('&',$link[1]);
            foreach ($params as $v){
                $s = explode('=',$v);
                $paramsArray[$s[0]] = $s[1];
            }
        }
        $nav['params'] = $paramsArray;

        return $this->fetch('edit', ['nav' => $nav]);
    }

    /**
     * 更新导航
     * @param $id
     */
    public function update($id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->post();
            //数据验证
            $validate_result = $this->validate($data, 'Nav');
            //检测导航名称是否存在
            $checkName = $this->nav_model->getInfo(['name'=>$data['name'],'id'=>['<>',$id]],'id');
            if($checkName){
                $this->error('导航名称已经存在');
            }

            //重新拼接url
            if(isset($data['link-value'])){
                foreach($data['link-value'] as $k=> $v){
                    $linkValue = '&'.$k.'='.$v;
                }
                $data['link'] =  $data['link'].'?'.trim($linkValue,'&');
                unset($data['link-value']);
            }

             if ($validate_result !== true) {
                 $this->error($validate_result);
             } else {
                if ($this->nav_model->pageSave($data,['id'=>$id]) !== false) {
                    $this->success('更新成功');
                } else {
                    $this->error('更新失败');
                }
             }
        }
    }
    /**
     * 删除导航
     * @param $id
     */
    public function delete($id)
    {
        if ($this->nav_model->pageDel(['id'=>$id])) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}