<?php

namespace app\api\model;

use think\Db;

class Goods extends BaseModel
{
    protected $autoWriteTimestamp = 'datetime';
    protected $hidden = [
        'delete_time', 'main_img_id', 'pivot', 'from',
        'create_time', 'update_time'];

    /**
     * 图片属性
     */
    public function imgs()
    {
        return $this->hasMany('ProductImage', 'product_id', 'id');
    }

    public function getMainImgUrlAttr($value, $data)
    {
        return $this->prefixImgUrl($value, $data);
    }


    public function properties()
    {
        return $this->hasMany('ProductProperty', 'product_id', 'id');
    }

    /**
     * 获取某分类下商品
     * @param $categoryId       分类ID
     * @param bool $paginate    是否是简洁模式
     * @param string $field     筛选字段
     * @param string $keyword   关键字
     * @param string $sort      排序字段
     * @param string $order     排序方式
     * @param int $page
     * @param int $size
     * @return \think\Paginator
     */
    public static function getProductsByCategoryID(
        $categoryId, $paginate = true, $field='', $keyword='', $sort='is_recommend', $order='asc', $page = 1, $size = 30)
    {
        $ids = '';
        if( $categoryId !=0 ){
            //查询判断手否是父级分类
            $categoryIds = Db::name('category')->where(['pid'=>$categoryId])->field('id')->select()->toArray();
            if( !empty($categoryIds) ){
                foreach ($categoryIds as $v) {
                    $ids .= $v['id'].',';
                }
                $ids .= $categoryId;
            }else{
                $ids = $categoryId;
            }
        }


        $now = date('Y-m-d H:i:s',time());
        if($categoryId != 0 ){
            $map['cid']     = ['in',$ids];
        }

        $map['btime']   = ['<=',$now];
        $map['etime']   = ['>=',$now];
        $map['status']  = ['=',1];

        if( !empty($keyword) ){
            $map['name']    = ['like','%'.$keyword.'%'];
        }
        $query = self::
        where(
           $map
        )
            ->field($field)
            ->order(
                $sort.' '.$order
            );
        if (!$paginate)
        {
            $query->select();
            return $query->select();
        }
        else
        {
            // paginate 第二参数true表示采用简洁模式，简洁模式不需要查询记录总数

            return $query->paginate(
                $size, false, [
                'page' => $page
            ]);
        }
    }

    /**
     * 获取商品详情
     * @param $id
     * @return null | Product
     */
    public static function getProductDetail($id)
    {
        $product = self::find($id);
        return $product;
    }

    public static function getMostRecent($count)
    {
        $products = self::limit($count)
            ->order('create_time desc')
            ->select();
        return $products;
    }

    /**
     * @param $id
     * @param $field
     * @return null | Product
     */
    public static function getCategoryByGoodsId( $id ,$field ){
        $product = self::alias('g')
            ->join('category c','g.cid = c.id','LEFT')
            ->field( $field )
            ->where( ['g.id'=>$id,'g.status'=>1] )
            ->find();
        return $product;
    }

    /**
     * 获取热门商品信息
     * @return string
     */
    public static function hotGoods()
    {
        $now = date('Y-m-d H:i:s',time());
        $map['is_hot']     = ['=',1];
        $map['btime']   = ['<=',$now];
        $map['etime']   = ['>=',$now];
        $map['status']  = ['=',1];
        $product = self::where($map)
            ->field('id,name,thumb,sp_price,prefix_title')
            ->order('sort asc')
            ->limit(4)
            ->select( );
        return $product;
    }

    /**
     * 获取最新商品信息
     * @return string
     */
    public static function recommendGoods()
    {
        $now = date('Y-m-d H:i:s',time());
        $map['btime']   = ['<=',$now];
        $map['etime']   = ['>=',$now];
        $map['status']  = ['=',1];
        $map['is_recommend']     = ['=',1];

        $product = self::where($map)
            ->field('id,name,thumb,sp_price,prefix_title')
            ->order('sort asc')
            ->limit(4)
            ->select( );
        return $product;
    }


    }
