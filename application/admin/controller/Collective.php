<?php
/**
 * 
 * @authors Ewei (lamp_heyiwei@163.com)
 * @date    2017-12-19 22:51:29
 * @version $Id$
 */
namespace app\admin\controller;

use app\common\model\Collective as CollectiveModel;
use app\common\model\Category as CategoryModel;
use app\common\model\Goods as GoodsModel;
use app\common\controller\AdminBase;
use think\Config;
use think\Db;

class Collective extends AdminBase {
    protected $collective_model;
    protected $goods_model;
    protected $cateage_model;

    function _initialize(){
        parent::_initialize();
		$this->collective_model = new CollectiveModel();
		$this->goods_model      = new GoodsModel();
		$this->cateage_model    = new CategoryModel();
    }

    /**
     * 开团规则列表页面显示
     * @return [type] [description]
     */
    public function index($keyword = '', $page = 1){
        $map   = [];
    	$field = 'c.id,c.goods_id,c.start_time,c.end_time,g.name,g.sp_price,c.state as c_state,c.user_number';


    	if (!empty($keyword)) {
            $map['name'] = ['like', "%{$keyword}%"];
        }

        $collective_list = Db::table('collective')
		->alias('c')
		->join('goods g','c.goods_id = g.id')
		->field( $field )
		->where( $map )
		->order(['start_time' => 'DESC'])->paginate(15, false, ['page' => $page]);

        // $collective_list  = $this->collective_model->where($map)->order(['start_time' => 'DESC'])->paginate($limit, false, ['page' => $page])->toArray();
 		return $this->fetch('index', ['collective_list' => $collective_list , 'keyword' => $keyword]);
    }
    
    /**
     * 开团规则列表数据
     * @param  string  $keyword [description]
     * @param  integer $limit   [description]
     * @param  integer $page    [description]
     * @return [type]           [description]
     */
    public function getList($keyword = '', $limit=10, $page=1){
    

    }

    public function add(){

    }

    public function save(){

    }

    public function edit(){

    }

    public function update(){

    }

    public function delete(){

    }
}