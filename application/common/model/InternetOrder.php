<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/3/26
 * Time: 0:27
 */

namespace app\common\model;


use think\Model;

class InternetOrder extends Model
{
    public function getOrderList($page_index, $page_size, $condition, $order, $field){
       $row = $this->pageQuery($page_index, $page_size, $condition, $order, $field);

        return $row;
    }
}