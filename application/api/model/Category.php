<?php

namespace app\api\model;

use think\Model;

class Category extends BaseModel
{
    public function products()
    {
        return $this->hasMany('Goods', 'cid', 'id');
    }

    public function img()
    {
        return $this->belongsTo('Image', 'topic_img_id', 'id');
    }

    public static function getCategories($ids)
    {
        $categories = self::with('products')
            ->with('products.img')
            ->select($ids);
        return $categories;
    }
    
    public static function getCategory($id,$field)
    {
        $category = self::field($field)
            ->find($id);
        return $category;
    }

    /**
     * 获取顶级分类
     * @param $field string
     * @return object FilterCategory
     */
    public static function filterCategory( $field='' ){
        $filterCategory = self::where(['pid'=>0])
            ->field($field)
            ->order('sort asc')
            ->select();

        return $filterCategory;
    }

    /**
     * @param $id
     * @param string $field
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function childCategory( $id,$field='' ){
        $filterCategory = self::where(['pid'=>$id])
            ->field($field)
            ->order('sort asc')
            ->select();

        return $filterCategory;
    }
}
