<?php 
namespace app\common\model;

use think\Db;
class OrderGoods extends BaseModel {

    protected $table = 'order_product';

    public function __construct()
    {
        $this->table = config('database.prefix').$this->table;

        parent::__construct();
    }

    /**
     * 更具订单商品表中的分类统计销售商品数量
     * @return array
     */
    public static function countGoodsNumberByCId(){
        $sql = 'SELECT cid,SUM(num) as number FROM ewei_order_product GROUP BY cid';
        $row = Db::query($sql);
        return $row;
    }

    public static function del($id){
        Db::name('order_product')->where([
            'order_id'=>$id
        ])->delete();
    }

}
