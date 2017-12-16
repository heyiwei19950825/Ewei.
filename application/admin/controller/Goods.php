<?php
/**
 * ============================
 * @Author:   Ewei
 * @Version:  1.0 
 * @DateTime: 2017-8-6 14:52
 * ============================
 */
namespace app\admin\controller;

use app\common\model\Goods as GoodsModel;
use app\common\model\Category as CategoryModel;
use app\common\controller\AdminBase;
use think\Db;


/**
 * 商品管理
 * Class Article
 * @package app\admin\controller
 */
class Goods extends AdminBase
{
    protected $goods_model;
    protected $category_model;
    protected $category_level_list;

    protected function _initialize()
    {
        parent::_initialize();
        $this->goods_model  = new GoodsModel();
        $this->category_model = new CategoryModel();

        $this->category_level_list = $this->category_model->getLevelList();
        $this->assign('category_level_list', $this->category_level_list);
    }

    /**
     * 商品管理
     * @param int    $cid     分类ID
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($cid = 0, $keyword = '', $page = 1)
    {
        $map   = [];
        $field = 'id,name,cid,thumb,is_recommend,status,is_hot,is_top,sort,sp_price,sp_inventory,sp_market,publish_time';

        if ($cid > 0) {
            $category_children_ids = $this->category_model->where(['path' => ['like', "%,{$cid},%"]])->column('id');
            $category_children_ids = (!empty($category_children_ids) && is_array($category_children_ids)) ? implode(',', $category_children_ids) . ',' . $cid : $cid;
            $map['cid']            = ['IN', $category_children_ids];
        }

        if (!empty($keyword)) {
            $map['name'] = ['like', "%{$keyword}%"];
        }

        $goods_list  = $this->goods_model->field($field)->where($map)->order(['publish_time' => 'DESC'])->paginate(15, false, ['page' => $page]);
        $category_list = $this->category_model->column('name', 'id');
        return $this->fetch('index', ['goods_list' => $goods_list, 'category_list' => $category_list, 'cid' => $cid, 'keyword' => $keyword]);
    }

    /**
     * 添加商品
     * @return mixed
     */
    public function add()
    {
        //必须创建分类
        if( empty($this->category_level_list) ){
            $this->error('请先创建商品分类','admin/Category/add');
        }

        return $this->fetch();
    }

    /**
     * 保存商品
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'Goods');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->goods_model->allowField(true)->save($data)) {
                    $this->success('保存成功');
                } else {
                    $this->error('保存失败');
                }
            }
        }
    }

    /**
     * 编辑商品
     * @param $id
     * @return mixed
     */
    public function edit($id)
    {
        $goods = $this->goods_model->find($id);
        //查询规格
        $property = Db::name('product_property')->where(['product_id'=>$id])->select();
        return $this->fetch('edit', ['goods' => $goods,'property'=>$property]);
    }

    /**
     * 更新商品
     * @param $id
     */
    public function update($id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            //处理产品属性数据
            $property_key = empty($data['property_key'])?array():$data['property_key'];
            unset($data['property_key']);//删除多余属性
            $property_val = empty($data['property_val'])?array():$data['property_val'];
            unset($data['property_val']);//删除多余属性
            $property = array();
            foreach ($property_key as $key => $value) {
               $property[$key] = ['name'=>$value,'detail'=>$property_val[$key],'product_id'=>$id];
            }

            //删除原有产品属性
            Db::name('product_property')->where(['product_id'=>$id])->delete();
            //保存提交的属性
            Db::name('product_property')->insertAll($property);

            $validate_result = $this->validate($data, 'Goods');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->goods_model->allowField(true)->save($data, $id) !== false) {
                    $this->success('更新成功');
                } else {
                    $this->error('更新失败');
                }
            }
        }
    }

    /**
     * 删除商品
     * @param int   $id
     * @param array $ids
     */
    public function delete($id = 0, $ids = [])
    {
        $id = $ids ? $ids : $id;
        if ($id) {
            if ($this->goods_model->destroy($id)) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        } else {
            $this->error('请选择需要删除的商品');
        }
    }

    /**
     * 商品审核状态切换
     * @param array  $ids
     * @param string $type 操作类型
     */
    public function toggle($ids = [], $type = '')
    {
        $data   = [];
        $status = $type == 'audit' ? 1 : 0;

        if (!empty($ids)) {
            foreach ($ids as $value) {
                $data[] = ['id' => $value, 'status' => $status];
            }
            if ($this->goods_model->saveAll($data)) {
                $this->success('操作成功');
            } else {
                $this->error('操作失败');
            }
        } else {
            $this->error('请选择需要操作的商品');
        }
    }
}