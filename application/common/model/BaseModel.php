<?php 
namespace app\common\model;
use think\Model;
use think\Session;


class BaseModel extends Model{

    protected  $condition;
    public function __construct()
    {
        $this->authWhere();
    }

    //权限认证
    protected function authWhere(){
        $admin_groups_id = Session::get('admin_group');
        //检测是否是独立账户下的子账户
        $admin_id = Session::get('admin_p_id')!=0?Session::get('admin_p_id'):Session::get('admin_id');
        //过滤数据表
        $excludeTable = [
            config('database.prefix').'admin_user' =>[
            ],
            config('database.prefix').'auth_group_access' =>[
            ],
            config('database.prefix').'shop' =>[
            ],
            config('database.prefix').'shop_replace' =>[
            ],
            config('database.prefix').'city' =>[
            ],
            config('database.prefix').'district' =>[
            ],
            config('database.prefix').'province' =>[
            ],
            config('database.prefix').'category' =>[
            ],
            config('database.prefix').'user_collective' =>[
            ],
        ];
        $restrictTable = [
            config('database.prefix').'express_company' =>[
            ],
        ];
        if( $admin_groups_id != 1 && !array_key_exists($this->table,$excludeTable)){
            $this->condition['s_id'] = $admin_id;
        }elseif($admin_groups_id == 1){
             if( array_key_exists($this->table,$restrictTable)){
                 $this->condition['s_id'] = $admin_id;
             }else{
                 $this->condition = [];
             }
        }else{
            if(!in_array($this->table,$excludeTable)){

            }
            $this->condition = [];
        }
    }

    /**
     * 列表查询
     * @param $page_index
     * @param $page_size
     * @param $condition
     * @param $order
     * @param $field
     * @param $paginate
     * @param $group
     * @return array
     */
    public function pageQuery($page_index=0, $page_size=0, $condition=[], $order='', $field='*',$paginate = false,$group = '')
    {
        $condition = empty($condition)?$this->condition:array_merge($this->condition,$condition);
        $count = $this->table($this->table)->where($condition)->count();
        if ($page_size == 0) {
            $list = $this->table($this->table)->field($field)
                ->where($condition)
                ->order($order)
                ->group($group)
                ->select();
            if( $list){
                $list = $list->toArray();
            }
            $page_count = 1;
        } else {
            if( $paginate == true ){
                $list = $this->table($this->table)->field($field)
                    ->where($condition)
                    ->order($order)
                    ->group($group)
                    ->paginate($page_size, false, ['page' => $page_index]);
                    return $list;
            }else{
                $start_row = $page_size * ($page_index - 1);
                $list = $this->table($this->table)->field($field)
                    ->where($condition)
                    ->order($order)
                    ->limit($start_row . "," . $page_size)
                    ->group($group)
                    ->select();
                if( $list){
                    $list = $list->toArray();
                }
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
     * @param string $condition
     * @param string $field
     * @param string $filtration   是否验证商家
     * @return array|false|\PDOStatement|string|Model
     */
    public function getInfo($condition = '', $field = '',$filtration = true)
    {
        if( !is_string($condition) && $filtration == true){
            $condition = empty($condition)?$this->condition:array_merge($this->condition,$condition);
        }

        $info = $this->table($this->table)->where($condition)
            ->field($field)
            ->find();
        return $info;
    }

    /**
     * 统计
     */
    public function pageCount($condition='', $field = '*',$group = ''){

    }

    /**
     * 删除数据
     * @param $condition
     * @return array
     */
    public function pageDel( $condition ){
        $condition = empty($condition)?$this->condition:array_merge($this->condition,$condition);

        $row = $this->table($this->table)->where($condition)
            ->delete();

        return $row;
    }

    /**
     * 保存
     * @param $condition
     * @param $data
     * @param bool $more   是否是多条插入
     * @return bool
     */
    public function pageSave($data,$condition=[],$more = false){
        //检测是修改还是添加
        $selectCheck = $condition == []?false:true;
        $condition = empty($condition)?$this->condition:array_merge($this->condition,$condition);

        $row = $this->table($this->table)
            ->where($condition);
        if($selectCheck){
            $row =$row->update($data);
        }else{
            if( $more ){
                $row = $row->insertAll($data);
                echo $this->table($this->table)->getLastSql();die;
            }else{
                $row =  $row->insertGetId($data);
            }
        }

        if( $row ){
            return $row;
        }else{
            return false;
        }
    }
}