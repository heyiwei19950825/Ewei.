<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/3/26
 * Time: 14:56
 */

namespace app\common\model;


use think\Model;

class InternetOrderMachine extends Model
{
    public function getList($page_index, $page_size, $condition, $order, $field){
        $row = $this->pageQuery($page_index, $page_size, $condition, $order, $field);

        return $row;
    }
}