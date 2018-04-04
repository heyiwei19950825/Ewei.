<?php 
namespace app\common\model;
use think\Model;


class BaseModel extends Model{
    /**
     * 列表查询
     * @param $page_index
     * @param $page_size
     * @param $condition
     * @param $order
     * @param $field
     * @param $paginate
     * @return array
     */
    public function pageQuery($page_index, $page_size, $condition, $order, $field,$paginate = false)
    {
        $count = $this->where($condition)->count();
        if ($page_size == 0) {
            $list = $this->field($field)
                ->where($condition)
                ->order($order)
                ->select();
            $page_count = 1;
        } else {
            if( $paginate == true ){
                $list = $this->field($field)
                    ->where($condition)
                    ->order($order)
                    ->paginate($page_size, false, ['page' => $page_index]);

                return $list;
            }else{
                $start_row = $page_size * ($page_index - 1);
                $list = $this->field($field)
                    ->where($condition)
                    ->order($order)
                    ->limit($start_row . "," . $page_size)
                    ->select();
                if ($count % $page_size == 0) {
                    $page_count = $count / $page_size;
                } else {
                    $page_count = (int) ($count / $page_size) + 1;
                }
            }

        }
        return array(
            'data' => $list,
            'total_count' => $count,
            'page_count' => $page_count
        );
    }


    /**
     * 获取单条记录的基本信息
     *
     * @param unknown $condition            
     * @param string $field            
     */
    public function getInfo($condition = '', $field = '*')
    {
        $info = $this->where($condition)
            ->field($field)
            ->find();
        return $info;
    }
}