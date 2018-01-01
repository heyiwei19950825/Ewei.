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
        //查询开团状态
        $collective = Db::name('goods_collective')->where(['goods_id'=>$id])->find();

        if( empty($collective) ){
            $collective = array(
                'state'       =>0,
                'goods_price' =>0,
                'user_number' =>0,
                'time'        =>0,
                'start_time'  =>date('Y-m-d H:i:s',time()),
                'end_time'    =>date('Y-m-d H:i:s',time()),

            );
            
        }
        return $this->fetch('edit', ['goods' => $goods,'property'=>$property, 'collective'=>$collective]);
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

            //开团信息保存
            $collective = array(
                'user_number' => $data['collective_number'],
                'goods_price' => $data['collective_price'],
                'time'        => $data['collective_time'],
                'state'       => $data['collective_state'],
                'start_time'  => $data['collective_start_time'],
                'end_time'    => $data['collective_end_time'],
                'goods_id'    => $id,
            );

            try {
                //删除开团规则
                Db::name('goods_collective')->where(['goods_id'=>$id])->delete();
                //重新创建开团规则
                Db::name('goods_collective')->insert($collective);
                
            } catch (Exception $e) {
                echo $e->getMessage();die;
            }

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

    /**
     * 商品列表数据
     * @return [type] [description]
     */
    public function goodsList(){
        return $this->fetch('goods_list');
    }

    /**
     * 获取商品数据列表  已json格式返回
     * @param  integer $page    [description]
     * @param  string  $keyword [description]
     * @return [type]           [description]
     */
    public function getGoodsList($page = 1,$keyword = ''){
        $field = 'id,name,cid,thumb,status,sort,sp_price,status,prefix_title,sp_inventory,sp_market,publish_time';
        $map = [];

        if (!empty($keyword)) {
            $map['name'] = ['like', "%{$keyword}%"];
        }

        $goods_list  = $this->goods_model->where($map)->field($field)->limit( ($page-1)*10,$page*10)->select();
        $count = ceil($this->goods_model->where($map)->count()/10);

        $list = array();
        foreach ($goods_list as $key => $value) {
            $value['status'] = $value['status'] == 1?'审核通过':'未审核通过';
            $list[$key] = $value;
        }

        $data = array(
            'list' => $list,
            'pages' => $count
            );

        return json(['data'=>$data,'code'=>1,'message'=>'操作完成']);
    }

    /**
     * 通过多个id号获取商品数据
     * @param  string $ids [description]
     * @return [type]      [description]
     */
    public function getGoodsListByIds($ids = ''){
        if($this->request->isPOst()){
            $field = 'id,name,cid,thumb,status,sort,sp_price,sp_o_price,status,prefix_title,sp_inventory,sp_market,publish_time';
            if( $ids != ''){
                 //数据处理
                $ids = trim($ids,',');
                $goods_list = $this->goods_model->where('id','in',$ids)->field($field)->select();
                $data = $list = array();
                foreach ($goods_list as $key => $value) {
                    $value['status'] = $value['status'] == 1?'审核通过':'未审核通过';
                    $list[$key] = $value;
                }

                if( $goods_list ){
                    return json(['data'=>$list,'code'=>1,'message'=>'操作完成']);
                }else{
                    return json(['data'=>$list,'code'=>0,'message'=>'没有数据']);
                }

            }


        }
    }
}