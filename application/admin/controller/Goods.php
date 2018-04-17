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
use app\common\model\Shop;
use think\Db;
use think\db\Query;


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
    protected $shop_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->goods_model      = new GoodsModel();
        $this->category_model   = new CategoryModel();
        $this->expressa_model   = new ExpressaModel();
        $this->shop_model       = new Shop();


        //获取分类
        $category_level_list  = $this->category_model->pageQuery(1,0,[],'s_id desc,sort desc','id,pid,name',true);


        $category_level_list = array2level($category_level_list['data']);
        $this->category_level_list = $category_level_list;

        //商家运输信息
        $this->expressa = $this->expressa_model->pageQuery();

        $this->assign('category_level_list', $category_level_list);
        $this->assign('express', $this->expressa['data']);
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
        $map = $goods_list = [];
        $field = 'id,s_id,name,cid,thumb,is_recommend,status,is_hot,is_top,sort,sp_price,sp_inventory,sp_market,publish_time,etime';
        if ($cid > 0) {
            $category_children_ids = $this->category_model->where(['path' => ['like', "%,{$cid},%"]])->column('id');
            $category_children_ids = (!empty($category_children_ids) && is_array($category_children_ids)) ? implode(',', $category_children_ids) . ',' . $cid : $cid;
            $map['cid']            = ['IN', $category_children_ids];
        }
        if (!empty($keyword)) {
            $map['name'] = ['like', "%{$keyword}%"];
        }
        $map['is_virtual'] = 0;
        $goodsListObject  = $this->goods_model->pageQuery($page,30,$map,'s_id asc,sort desc',$field,true);
        if($goodsListObject){
            foreach ($goodsListObject as $key => $value) {
                $value['shop'] =$this->shop_model->getInfo(['id'=>$value['s_id']],'shop_logo,shop_name');
                $goods_list[$key] = $value;

                //获取分类名称
                foreach ($this->category_level_list as $v){
                    if( $v['id'] == $value['cid']){
                        $goods_list[$key]['category'] = $v['name'];
                    }
                }

            }
        }
        return $this->fetch('index', ['goods_list' => $goods_list,'goodsListObject'=>$goodsListObject, 'cid' => $cid, 'keyword' => $keyword]);
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
            $data['s_id']   = $this->instance_id;
            $validate_result = $this->validate($data, 'Goods');
            $collectiveData = $data['collective'];
            unset($data['collective']);
            unset($data['editorValue']);

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                $instId = $this->goods_model->pageSave($data);

                if ($instId) {
                    //开团信息保存
                    if( $data['is_collective'] == '1' ){
                        $collective = array(
                            'user_number' => $collectiveData['collective_number'],
                            'goods_price' => $collectiveData['collective_price'],
                            'time'        => $collectiveData['collective_time'],
                            'start_time'  => $collectiveData['collective_start_time'],
                            'end_time'    => $collectiveData['collective_end_time'],
                            'goods_id'    => $instId,
                            's_id'         => $this->instance_id,
                            'status'      => $data['is_collective']
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
        $field = 's.sku_name,s.attr_value_items,s.cost_price,s.price,s.stock,p.pic_cover,p.pic_id,group_id,is_pay';
        $goods = $this->goods_model->getInfo($this->where);

        //没有查询到商品信息
        if( empty($goods) ){
            $this->error('没有找到对应的商品信息~');
        }
        $sku = [];
//        $i = 0;
        //查询规格
//        $property = Db::table('ewei_goods_sku')->alias('s')->join('album_picture p','s.picture = p.pic_id','LEFT')->field($field)->where(['goods_id'=>$id])->group('s.sku_id')->select();
//        if( !empty($property) ){
//            $property = $property->toArray();
//            foreach ($property as $item) {
//                    foreach ( $sku as $k=>$v) {
//                        if( $item['group_id'] == $k ){
//                            $sku[$item['group_id']][] = $item;
//                            $i = 1;
//                        }
//                    }
//
//                    if( $i != 1 ){
//                        $sku[$item['group_id']][] = $item;
//                    }
//                $i = 0;
//            }
//        }
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
            $checkIssue = $this->goods_model->getInfo(['id'=>$id],'name');
            if( $checkIssue == false ){
                $this->error('没有权限修改或修改商品不存在~');
            }
            $validate_result = $this->validate($data, 'Goods');
            $collectiveData = $data['collective'];
            unset($data['collective']);
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {

                if ($this->goods_model->pageSave($data,['id'=>$id]) !== false) {
//                    if( !empty($data['sku_name']) ){
//                        $i = 1;
//                        foreach ($data['sku_name'] as $key => $value) {
//                            foreach ($property as $k =>$v) {
//                                if( $v['sku_name'] == $value){
//                                    $i = $v['group_id'];
//                                }else{
//                                    $i++;
//                                }
//                            }
//                           $property[$key] = ['sku_name'=>$value,'attr_value_items'=>$data['attr_value_items'][$key],'goods_id'=>$id,'cost_price'=>$data['cost_price'][$key],'price'=>$data['price'][$key],'stock'=>$data['stock'][$key],'group_id'=>$i];
//                        }
//                        //删除原有产品属性
//                        Db::name('goods_sku')->where(['goods_id'=>$id])->delete();
//                        //保存提交的属性
//                        Db::name('goods_sku')->insertAll($property);
//                    }else{
//                        //删除原有产品属性
//                        Db::name('goods_sku')->where(['goods_id'=>$id])->delete();
//                    }
                    $collective = array(
                        'user_number' => $collectiveData['collective_number'],
                        'goods_price' => $collectiveData['collective_price'],
                        'time'        => $collectiveData['collective_time'],
                        'start_time'  => $collectiveData['collective_start_time'],
                        'end_time'    => $collectiveData['collective_end_time'],
                        'goods_id'    => $id,
                        's_id'        => $this->instance_id,
                        'status'      => $data['is_collective']
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


            if ($this->goods_model->pageDel(['id'=>['in',$id]])) {
                $row = Db::name('goods_collective')->where(['goods_id'=>['in',$id]])->delete();
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
        $status = $type == 'audit' ? 1 : 0;

        if (!empty($ids)) {
            if ($this->goods_model->pageSave(['status' => $status],['id'=>['in',$ids]])) {
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
        $map['status'] = 1;
        if (!empty($keyword)) {
            $map['name'] = ['like', "%{$keyword}%"];
        }
        $goods_list  = $this->goods_model->pageQuery($page,10,$map,'id desc',$field);

        $data = array(
            'list' => $goods_list['data'],
            'pages' => $goods_list['page_count']
            );

        return json(['data'=>$data,'code'=>1,'message'=>'操作完成']);
    }

    /**
     * 通过多个id号获取商品数据
     * @param  string $ids [description]
     * @return [type]      [description]
     */
    public function getGoodsListByIds($ids = ''){
        if($this->request->isPost()){
            $field = 'id,name,cid,thumb,status,sort,sp_price,sp_o_price,status,prefix_title,sp_inventory,sp_market,publish_time';
            if( $ids != ''){
                $map['id'] = ['in',$ids];
                 //数据处理
                $goods_list = $this->goods_model->pageQuery(0,0,$map,'id desc',$field);
                if( $goods_list ){
                    return json(['data'=>$goods_list['data'],'code'=>1,'message'=>'操作完成']);
                }else{
                    return json(['data'=>$goods_list['data'],'code'=>0,'message'=>'没有数据']);
                }

            }
        }
    }

    /**
     * 虚拟商品列表
     * */
    public function virtual($keyword = '', $page = 1){
        $map = $goods_list = [];
        $field = 'id,s_id,name,cid,thumb,status,sort,sp_price,sp_inventory,sp_market,publish_time,sp_integral,etime';
        $map['is_virtual'] = 1;
        if (!empty($keyword)) {
            $map['name'] = ['like', "%{$keyword}%"];
        }

        $goodsListObject  = $this->goods_model->pageQuery($page,30,$map,'sort desc',$field,true);
        if($goodsListObject){
            foreach ($goodsListObject as $key => $value) {
                $value['shop'] =$this->shop_model->getInfo(['id'=>$value['s_id']],'shop_logo,shop_name');
                //获取分类名称
                foreach ($this->category_level_list as $v){
                    if( $v['id'] == $value['cid']){
                        $value['category'] = $v['name'];
                    }
                }
                $goods_list[] = $value;
            }
        }
        $category_list = $this->category_model->column('name', 'id');

        return $this->fetch('virtual', ['controller'=>'virtual','goods_list' => $goods_list,'goodsListObject'=>$goodsListObject, 'category_list' => $category_list, 'keyword' => $keyword]);
    }
    /**
     * 添加虚拟物品
     */
    public function virtualAdd(){
        if($this->request->isPost()){
            $params = $this->request->param();
            $params['s_id'] = $this->instance_id;

            if($this->goods_model->pageSave($params)){
                $this->success('添加成功');
            }else{
                $this->error('添加失败');
            }
        }else{
            $rank = Db::name('user_rank')->select();
            return $this->fetch('',['controller'=>'virtual','rank'=>$rank]);
        }
    }
    /**
     * 编辑虚拟物品
     */
    public function virtualEdit($id){
        if($this->request->isPost()){
            $data = $this->request->param();
            if ($this->goods_model->allowField(true)->save($data, $id) !== false) {
                $this->success('更新成功');
            }else{
                $this->error('更新失败');
            }
        }else{
            $goods = $this->goods_model->getInfo(['id'=>$id]);
            //没有查询到商品信息
            if( empty($goods) ){
                $this->error('没有找到对应的商品信息~');
            }
            $rank = Db::name('user_rank')->select();
            return $this->fetch('',['controller'=>'virtual','goods'=>$goods,'rank'=>$rank]);
        }
    }

    /**
     * 删除虚拟物品
     * @param $id
     * @param $ids
     */
    public function virtualDelete($id,$ids){
        $id = $ids ? $ids : $id;
        if ($id) {
            if ($this->goods_model->pageDel(['id'=>['in',$id]])) {
                $row = Db::name('goods_collective')->where(['goods_id'=>['in',$id]])->delete();
                $this->success('删除成功');
            } else {
                $this->error('删除失败');

            }
        } else {
            $this->error('请选择需要删除的商品');
        }
    }
}