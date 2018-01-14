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
    public static function getAllArticle()
    {

    }

    public static function getArticleByTop()
    {

    }

    public static function getArticleById()
    {

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