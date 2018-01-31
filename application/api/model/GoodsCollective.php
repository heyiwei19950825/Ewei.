<?php
/**
 * 团购信息
 * User: heyiw
 * Date: 2018/2/1
 * Time: 1:56
 */

namespace app\api\model;

use think\Db;

class GoodsCollective extends BaseModel
{
    /**
     * @return mixed
     */
    public static function getList( $page,$limit = 5){
        $now = date('Y-m-d H:i:s',time());
        $map['g.btime']   = ['<=',$now];
        $map['g.etime']   = ['>=',$now];
        $map['g.status']  = ['=',1];
        $map['c.state']  = ['=',1];
        $row = Db::name('goods_collective')->alias('c')
            ->join('goods g','c.goods_id = g.id','LEFT')
            ->field('g.id,g.thumb,g.sp_price,g.name,g.prefix_title,c.user_number,c.goods_price')
            ->where($map)
            ->paginate(
                $limit, false, [
                'page' => $page
            ]);
        $row = $row->toArray();
        return $row;
    }
}