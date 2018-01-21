<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/1/14
 * Time: 18:20
 */

namespace app\api\model;


class Article extends BaseModel
{
    /**
     * 更具指定数量获取文章
     * @param int $page
     * @param int $size
     * @param string $sort
     * @param string $order
     * @param $field
     * @param bool $paginate
     * @return false|\PDOStatement|string|\think\Collection|\think\Paginator
     */
    public static function getAllArticle($page=1,$size=10,$paginate = true,$sort='sort',$order='desc')
    {
        $field = 'id,title,introduction,thumb,author,reading';
        $map = [];
        $map['publish_time'] = ['<','now()'];
        $map['status'] = ['=','1'];
        if( !empty($keyword) ){
            $map['title']    = ['like','%'.$keyword.'%'];
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
     * 通过分类id获取文章列表
     * @param int $id
     * @param string $field
     * @return string
     */
    public static function getListByCid( $id = -1 ,$field = '')
    {

        $map = [];
        $map['publish_time'] = ['<','now()'];
        $map['status']       = ['=','1'];
        $map['cid']          = ['=',$id];

        $row = self::where(
                $map
        )->field($field)
            ->limit(5)
            ->order('sort asc')
            ->select();
        return $row;
    }


    public static function getArticleById( $id = -1,$field='')
    {
        $row = self::where([
                'status' => 1
                ]
        )->field($field)
            ->find($id);

        return $row;
    }

    /**
     * 获取置顶的文章列表
     * @return Row
     */
    public static function getTopArticle()
    {
        $row = self::where(['is_top'=>1,'status'=>1])
            ->field('id,title,thumb,introduction')
            ->order('sort asc')
            ->limit(4)
            ->select();
        return $row;
    }



}