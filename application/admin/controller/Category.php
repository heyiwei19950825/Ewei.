<?php
namespace app\admin\controller;

use app\common\model\Goods as GoodsModel;
use app\common\model\Category as CategoryModel;
use app\common\controller\AdminBase;


/**
 * 分类管理
 * Class Category
 * @package app\admin\controller
 */
class Category extends AdminBase
{

    protected $category_model;
    protected $goods_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->category_model = new CategoryModel();
        $this->goods_model  = new GoodsModel();
        $map = [];
        if($this->instance_id != 1) $map['s_id'] = $this->instance_id;
        $category_level_list  = $this->category_model->pageQuery(1,0,$map,'s_id asc,sort desc');
        $category_level_list = array2level($category_level_list['data']);

        $this->assign('category_level_list', $category_level_list);
    }

    /**
     * 分类管理
     * @return mixed
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 添加分类
     * @param string $pid
     * @return mixed
     */
    public function add($pid = '')
    {
        return $this->fetch('add', ['pid' => $pid]);
    }

    /**
     * 保存分类
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'Category');
            $data['s_id']    = $this->instance_id;
            $checkName = $this->category_model->getInfo(['name'=>$data['name']],'id');
            if($checkName){
                $this->error('分类名已经存在');
            }

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if( $data['pid'] != 0){
                    $pCategory = $this->category_model->getInfo(['id'=>$data['pid']]);
                    $data['is_hide'] = $pCategory['is_hide'];
                    $data['path'] = $pCategory['path'] . $data['pid'] . ',';
                }else{
                    $data['path'] = 0 . ',';
                }
                if ($this->category_model->pageSave($data)) {
                    $this->success('保存成功');
                } else {
                    $this->error('保存失败');
                }
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
        $category = $this->category_model->getInfo(['id'=>$id,'s_id'=>$this->instance_id]);
        if(!$category){
            return $this->error('您没有权限修改');
        }
        if( $category['thumb'] != ''){
            $category['thumb'] = explode(',',$category['thumb']);
        }
        $category['thumbCount'] = count($category['thumb']);


        return $this->fetch('edit', ['category' => $category]);
    }

    /**
     * 更新分类
     * @param $id
     */
    public function update($id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            //数据验证
            $validate_result = $this->validate($data, 'Category');
            $info = $this->category_model->getInfo(['name'=>$data['name']],'');
            if($info && $id != $info['id']){
                $this->error('分类名已经存在');
            }

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                $children = $this->category_model->where(['path' => ['like', "%,{$id},%"]])->column('id');
                if( $data['is_hide'] == 1){
                    $map = [
                      'id' => ['in',implode(',',$children)]
                    ];
                    //父类隐藏 所有子类都隐藏
                    $this->category_model->where($map)->update(['is_hide' => 1]);
                }else{
                    //子类开启父类也开启
                    $this->category_model->where(['id'=>$data['pid']])->update(['is_hide' => 0]);
                }
                if (in_array($data['pid'], $children)) {
                    $this->error('不能移动到自己的子分类');
                } else {

                    $data['thumb'] = !empty($data['thumb'])?implode(',',$data['thumb']):'';
                    //设置路径
                    if ($data['pid'] == 0) {
                        $data['path'] = 0 . ',';
                    } else {
                        $parent       = $this->category_model->getInfo(['id'=>$data['pid']],'path');
                        $data['path'] = $parent['path'] . $data['pid'] . ',';
                    }
                    if ($this->category_model->allowField(true)->pageSave($data,['id'=>$id]) !== false) {
                        //修改父类下的所有子类路径
                        $children = $this->category_model->pageQuery(0,0,['path' => ['like', "%{$id},%"]]);
                        if($children['total_count'] != 0 ){
                            foreach ($children['data'] as $value) {
                                $this->category_model->allowField(true)->pageSave(['path'=>$data['path'] . $id . ','],['id'=>$value['id']]);
                            }
                        }

                        $this->success('更新成功');
                    } else {
                        $this->error('更新失败');
                    }
                }
            }
        }
    }

    /**
     * 删除栏目
     * @param $id
     */
    public function delete($id)
    {
        $category = $this->category_model->getInfo(['pid' => $id]);
        $goods  = $this->goods_model->getInfo(['cid' => $id]);

        if (!empty($category)) {
            $this->error('此分类下存在子分类，不可删除');
        }

        if (!empty($goods)) {
            $this->error('此分类下存在商品，不可删除');
        }

        if ($this->category_model->pageDel(['id'=>$id])) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}