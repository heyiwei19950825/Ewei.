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
        if( $ids != ''){
            $map['id'] = ['in',$ids];
            //数据处理
            $goods_list = $this->goods_model->pageQuery(0,0,$map,'id desc',$field);
            return $goods_list['data'];
        }
    }
}