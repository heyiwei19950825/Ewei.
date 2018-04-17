<?php
namespace app\admin\controller;

use app\common\model\Banner as BannerCategoryModel;
use app\common\model\BannerItem as BannerItemModel;
use app\common\controller\AdminBase;
use think\Db;

/**
 * 轮播图管理
 * Class Slide
 * @package app\admin\controller
 */
class BannerItem extends AdminBase
{

    protected function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 轮播图管理
     * @return mixed
     */
    public function index()
    {
        $banner_model           = new BannerCategoryModel();
        $banner_item_model      = new BannerItemModel();
        $banner_list            = $banner_model->column('name', 'id');
        $banner_item            = $banner_item_model->where(['s_id'=>$this->instance_id])->select();

        return $this->fetch('index', ['banner_item' => $banner_item, 'banner_list' => $banner_list]);
    }

    /**
     * 添加轮播图
     * @return mixed
     */
    public function add()
    {
        $banner_model   = new BannerCategoryModel();
        $banner_list = $banner_model->where(['s_id'=>$this->instance_id])->select();

        return $this->fetch('add', ['banner_list' => $banner_list]);
    }

    /**
     * 保存轮播图
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $data['s_id']    = $this->instance_id;

            $validate_result = $this->validate($data, 'Banner');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                $banner_model = new BannerItemModel();
                if ($banner_model->allowField(true)->save($data)) {
                    $this->success('保存成功');
                } else {
                    $this->error('保存失败');
                }
            }
        }
    }

    /**
     * 编辑轮播图
     * @param $id
     * @return mixed
     */
    public function edit($id)
    {
        $banner_model           = new BannerCategoryModel();
        $banner_item_model      = new BannerItemModel();
        $banner_list            = $banner_model->where(['s_id'=>$this->instance_id])->select();
        $banner_item            = $banner_item_model->where(['s_id'=>$this->instance_id,'id'=>$id])->find();

        return $this->fetch('edit', ['banner_item' => $banner_item, 'banner_list' => $banner_list]);
    }

    /**
     * 更新轮播图
     * @param $id
     */
    public function update($id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'Banner');
            $data['s_id']    = $this->instance_id;

            //如果状态为2则修改喊出时间
            if( $data['status'] == 0 ){
                $data['delete_time']=time();
            }else{
                $data['delete_time']=null;
            }

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                $banner_model = new BannerItemModel();
                if ($banner_model->allowField(true)->save($data, $id) !== false) {
                    $this->success('更新成功');
                } else {
                    $this->error('更新失败');
                }
            }
        }
    }

    /**
     * 删除轮播图
     * @param $id
     */
    public function delete($id)
    {
        if (BannerItemModel::destroy($id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}