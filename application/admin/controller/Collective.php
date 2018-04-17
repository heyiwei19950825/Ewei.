<?php
/**
 * 
 * @authors Ewei (lamp_heyiwei@163.com)
 * @date    2017-12-19 22:51:29
 * @version $Id$
 */
namespace app\admin\controller;

use app\common\model\GoodsCollective as CollectiveModel;
use app\common\model\Category as CategoryModel;
use app\common\model\Goods as GoodsModel;
use app\common\controller\AdminBase;
use think\Config;
use think\Db;
use app\common\lib\Helper as HelperClass;

class Collective extends AdminBase {
    protected $collective_model;
    protected $goods_model;
    protected $cateage_model;
    protected $helper_class;
     protected $where = [];

    function _initialize(){
        parent::_initialize();
		$this->collective_model = new CollectiveModel();
		$this->goods_model      = new GoodsModel();
		$this->cateage_model    = new CategoryModel();
		$this->helper_class      = new HelperClass();
    }

    /**
     * 开团规则列表页面显示
     * @return [type] [description]
     */
    public function index($keyword = '', $page = 1){
        $map   = [];
        if($this->instance_id!= 1){
            $map['c.s_id'] = $this->instance_id;
        }
        
    	$field = 'c.id,c.goods_id,c.time,c.start_time,c.end_time,c.goods_price,g.name,g.sp_price,c.status as c_status,c.user_number,s.shop_name,g.id as g_id';


    	if (!empty($keyword)) {
            $map['g.name'] = ['like', "%{$keyword}%"];
        }

        $collective_list = Db::table('ewei_goods_collective')
		->alias('c')
		->join('goods g','c.goods_id = g.id','LEFT')
        ->join('shop s','g.s_id = s.id','LEFT')
		->field( $field )
		->where( $map )
		->order(['start_time' => 'DESC'])->paginate(15, false, ['page' => $page]);
		$list = array();

 		return $this->fetch('index', ['list'=>$list,'collective_list' => $collective_list , 'keyword' => $keyword]);
    }
    
    /**
     * 修改开团规则
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function edit($id){
        $field = 'c.id,c.goods_id,c.time,c.start_time,c.end_time,c.goods_price,g.thumb,g.name,g.sp_price,c.status as c_status,c.user_number';
        $collective_info = Db::table('ewei_goods_collective')
        ->alias('c')
        ->join('goods g','c.goods_id = g.id')
        ->field( $field )
        ->where(['c.id'=>$id] )
        ->find();

    	return $this->fetch('edit',['collective_info'=>$collective_info]);
    }

    public function update(){
        if($this->request->isPost()){
            $data            = $this->request->param();
            if( Db::table('ewei_goods_collective')->where([ 'goods_id'=>$data['goods_id'] ])->update($data) !== false){
                $this->success('更新成功');
            }else{
                $this->error('更新失败');
            }
        }
    }

    /**
     * [delete description]
     * @return [type] [description]
     */
     public function delete($id = 0, $ids = [])
    {
        $id = $ids ? $ids : $id;
        if ($id) {
            if ( $this->collective_model->destroy($id) ) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        } else {
            $this->error('请选择需要删除的规则');
        }
    }

    /**
     * 修改状态
     */
    public function updateState($ids = [], $state = '')
    {
        $data   = [];
        if (!empty($ids)) {
            foreach ($ids as $value) {
                $data[] = ['id' => $value, 'status' => $state];
            }

            if ( $this->collective_model->saveAll($data)) {
                $this->success('操作成功');
            } else {
                $this->error('操作失败');
            }
        } else {
            $this->error('请选择需要操作的规则');
        }
    }
}