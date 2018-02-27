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
use app\common\model\ExpressCompany as ExpressaModel;
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
    protected $expressa_model;
    protected $where = [];

    protected function _initialize()
    {
        parent::_initialize();
        $this->goods_model  = new GoodsModel();
        $this->category_model = new CategoryModel();
        $this->expressa_model = new ExpressaModel();

        $this->category_level_list = $this->category_model->getLevelList();
        //获取商家信息
        $shop_id = $this->shop['id'];

        if( $shop_id != 1 ){
            $this->where = ['sid'=>$shop_id];
        }
        $this->expressa = $this->expressa_model->where(['shop_id'=>$shop_id])->select();
        
        $this->assign('category_level_list', $this->category_level_list);
        $this->assign('express', $this->expressa);
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
        $map = [];
        $field = 'id,sid,name,cid,thumb,is_recommend,status,is_hot,is_top,sort,sp_price,sp_inventory,sp_market,publish_time';

        if ($cid > 0) {
            $category_children_ids = $this->category_model->where(['path' => ['like', "%,{$cid},%"]])->column('id');
            $category_children_ids = (!empty($category_children_ids) && is_array($category_children_ids)) ? implode(',', $category_children_ids) . ',' . $cid : $cid;
            $map['cid']            = ['IN', $category_children_ids];
        }

        if (!empty($keyword)) {
            $map['name'] = ['like', "%{$keyword}%"];
        }
        $this->where = array_merge($this->where,$map);

        $goods_list  = $this->goods_model->field($field)->where($this->where)->order(['sort' => 'DESC'])->paginate(15, false, ['page' => $page]);
        foreach ($goods_list as $key => &$value) {
            $value['shop'] = Db::name('shop')->field('shop_logo,shop_name')->find($value['sid']);
        }
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
            $data['sid']     = $this->shop['id'];
            $property       = [];
            $validate_result = $this->validate($data, 'Goods');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->goods_model->allowField(true)->save($data)) {
                    $id = $this->goods_model->id;

                    if( !empty($data['sku_name']) ) {
                        $i = 1;
                        foreach ($data['sku_name'] as $key => $value) {
                            foreach ($property as $k => $v) {
                                if ($v['sku_name'] == $value) {
                                    $i = $v['group_id'];
                                } else {
                                    $i++;
                                }
                            }
                            $property[$key] = ['sku_name' => $value, 'attr_value_items' => $data['attr_value_items'][$key], 'goods_id' => $id, 'cost_price' => $data['cost_price'][$key], 'price' => $data['price'][$key], 'stock' => $data['stock'][$key], 'group_id' => $i];
                        }

                        //删除原有产品属性
                        Db::name('goods_sku')->where(['goods_id' => $id])->delete();
                        //保存提交的属性
                        Db::name('goods_sku')->insertAll($property);
                    }
                    if( $data['collective_state'] == '1' ){
                    //开团信息保存
                    $collective = array(
                        'user_number' => $data['collective_number'],
                        'goods_price' => $data['collective_price'],
                        'time'        => $data['collective_time'],
                        'state'       => $data['collective_state'],
                        'start_time'  => $data['collective_start_time'],
                        'end_time'    => $data['collective_end_time'],
                        'goods_id'    => $this->goods_model->id,
                        'sid'         => $this->shop['id'],
                    );
                    try {
                        //重新创建开团规则
                        Db::name('goods_collective')->insert($collective);
                        
                    } catch (Exception $e) {
                        echo $e->getMessage();die;
                    }
                }


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
        $this->where = ['id'=>$id];
        $field = 's.sku_name,s.attr_value_items,s.cost_price,s.price,s.stock,p.pic_cover,p.pic_id,group_id';
        $goods = $this->goods_model->where($this->where)->find();
        //没有查询到商品信息
        if( empty($goods) ){
            $this->error('没有找到对应的商品信息~');
        }
        $sku = [];
        $i = 0;
        //查询规格
        $property = Db::table('ewei_goods_sku')->alias('s')->join('album_picture p','s.picture = p.pic_id','LEFT')->field($field)->where(['goods_id'=>$id])->group('s.sku_id')->select();
        if( !empty($property) ){
            $property = $property->toArray();
            foreach ($property as $item) {
                    foreach ( $sku as $k=>$v) {
                        if( $item['group_id'] == $k ){
                            $sku[$item['group_id']][] = $item;
                            $i = 1;
                        }
                    }

                    if( $i != 1 ){
                        $sku[$item['group_id']][] = $item;
                    }
                $i = 0;
            }
        }

        //查询是否选择开团
        $collective = Db::name('goods_collective')->where(['goods_id'=>$id])->find();

        return $this->fetch('edit', ['goods' => $goods,'sku'=>$sku, 'collective'=>$collective]);
    }

    /**
     * 更新商品
     * @param $id
     */
    public function update($id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $property = array();
            //检查是否有存在并权限修改
            $this->where = array_merge($this->where,['id'=>$id]);
            $checkIssue = $this->goods_model->field('name')->where( $this->where )->find();
            if( $checkIssue == false ){
                $this->error('没有权限修改或修改商品不存在~');
            }
            $validate_result = $this->validate($data, 'Goods');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->goods_model->allowField(true)->save($data, $id) !== false) {
                    if( !empty($data['sku_name']) ){
                        $i = 1;
                        foreach ($data['sku_name'] as $key => $value) {
                            foreach ($property as $k =>$v) {
                                if( $v['sku_name'] == $value){
                                    $i = $v['group_id'];
                                }else{
                                    $i++;
                                }
                            }
                           $property[$key] = ['sku_name'=>$value,'attr_value_items'=>$data['attr_value_items'][$key],'goods_id'=>$id,'cost_price'=>$data['cost_price'][$key],'price'=>$data['price'][$key],'stock'=>$data['stock'][$key],'group_id'=>$i];
                        }
                        //删除原有产品属性
                        Db::name('goods_sku')->where(['goods_id'=>$id])->delete();
                        //保存提交的属性
                        Db::name('goods_sku')->insertAll($property);
                    }else{
                        //删除原有产品属性
                        Db::name('goods_sku')->where(['goods_id'=>$id])->delete();
                    }
                   

                    //开团信息保存
                    $collective = array(
                        'user_number' => $data['collective_number'],
                        'goods_price' => $data['collective_price'],
                        'time'        => $data['collective_time'],
                        'state'       => $data['collective_state'],
                        'start_time'  => $data['collective_start_time'],
                        'end_time'    => $data['collective_end_time'],
                        'goods_id'    => $id,
                        'sid'         => $this->shop['id'],
                    );

                    try {
                        //删除开团规则
                        Db::name('goods_collective')->where(['goods_id'=>$id])->delete();
                        //重新创建开团规则
                        Db::name('goods_collective')->insert($collective);
                        
                    } catch (Exception $e) {
                        echo $e->getMessage();die;
                    }


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
        $field = 'id,name,cid,thumb,status,sort,sp_price,sp_o_price,status,prefix_title,sp_inventory,sp_market,publish_time';
        $map = [];

        if (!empty($keyword)) {
            $map['name'] = ['like', "%{$keyword}%"];
        }
        $this->where = array_merge($this->where,$map);
        $goods_list  = $this->goods_model->where($this->where)->field($field)->limit( ($page-1)*10,$page*10)->select();
        $count = ceil($this->goods_model->where($this->where)->count()/10);

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
                $map['id'] = ['in',$ids];
                $this->where =array_merge($this->where,$map);
                 //数据处理
                $ids = trim($ids,',');
                $goods_list = $this->goods_model->where($this->where)->field($field)->select();
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