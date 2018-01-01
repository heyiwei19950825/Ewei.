<?php
/**
 * 
 * @authors Your Name (you@example.org)
 * @date    2018-01-02 00:44:58
 * @version $Id$
 */
namespace app\common\server;

use app\common\model\Goods as GoodsModel;
use app\common\server\BaseServer;

class Goods extends BaseServer {
    
    protected $goods_model;
    function __construct(){
        $this->goods_model  = new GoodsModel();
    }

    public function getGoodsListByIds($ids= ''){
    	$field = 'id,name,cid,thumb,status,sort,sp_price,sp_o_price,status,prefix_title,sp_inventory,sp_market,publish_time';
        $data = $list = array();
        if( $ids != ''){
            //数据处理
            $ids .= '0';
            $goods_list = $this->goods_model->where('id','in',$ids)->field($field)->select()->toArray();
            foreach ($goods_list as $key => $value) {
                $value['status'] = $value['status'] == 1?'审核通过':'未审核通过';
                $list[$key] = $value;
            }
        }

        return $list;
    }
}