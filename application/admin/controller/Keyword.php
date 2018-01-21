<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/1/21
 * Time: 18:45
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use think\Db;

class Keyword extends AdminBase
{
    protected function _initialize()
    {
        parent::_initialize();

    }

    /**
     *
     */
    public function index(){
        $keyword_list = Db::name('keywords')->order('sort_order asc')->select();

        return $this->fetch('index', ['keyword_list' => $keyword_list]);
    }

    /**
     * 添加关键字
     * @return mixed
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 保存关键字
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();

            if (Db::name('keywords')->insert($data)) {
                $this->success('保存成功');
            } else {
                $this->error('保存失败');
            }
        }
    }

    /**
     * 编辑关键字
     * @param $id
     * @return mixed
     */
    public function edit($id)
    {
        $keyword = Db::name('keywords')->where(['id'=>$id])->find();

        return $this->fetch('edit', ['keyword' => $keyword]);
    }

    /**
     * 更新关键字
     * @throws \think\Exception
     */
    public function update()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();

            if (Db::name('keywords')->update($data) !== false) {
                $this->success('更新成功');
            } else {
                $this->error('更新失败');
            }
        }
    }

    /**
     * 删除关键字
     * @param $id
     * @throws \think\Exception
     */
    public function delete($id)
    {
        if (Db::name('keywords')->where(['id'=>$id])->delete() !== false) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}