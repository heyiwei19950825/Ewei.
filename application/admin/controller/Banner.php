<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Db;

/**
 * 轮播图分类
 * Class SlideCategory
 * @package app\admin\controller
 */
class Banner extends AdminBase
{
    protected function _initialize()
    {
        parent::_initialize();

    }

    /**
     * 轮播图分类
     * @return mixed
     */
    public function index()
    {
        $banner_list = Db::name('banner')->where(['s_id'=>$this->instance_id])->select();

        return $this->fetch('index', ['banner_list' => $banner_list]);
    }

    /**
     * 添加分类
     * @return mixed
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 保存分类
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $data['s_id'] = $this->instance_id;

            if (Db::name('banner')->insert($data)) {
                $this->success('保存成功');
            } else {
                $this->error('保存失败');
            }
        }
    }

    /**
     * 编辑分类
     * @param $id
     * @return mixed
     */
    public function edit($id)
    {
        $banner = Db::name('banner')->where(['s_id'=>$this->instance_id])->find($id);

        return $this->fetch('edit', ['banner' => $banner]);
    }

    /**
     * 更新分类
     * @throws \think\Exception
     */
    public function update()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $data['s_id'] = $this->instance_id;

            if (Db::name('banner')->update($data) !== false) {
                $this->success('更新成功');
            } else {
                $this->error('更新失败');
            }
        }
    }

    /**
     * 删除分类
     * @param $id
     * @throws \think\Exception
     */
    public function delete($id)
    {
        if (Db::name('banner')->delete(['id'=>$id,'s_id'=>$this->instance_id]) !== false) {

            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}