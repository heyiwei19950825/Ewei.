<?php
namespace app\common\model;

use think\Model;
use think\Session;
use think\Db;

class Goods extends Model
{
    protected $insert = ['create_time'];
    protected $update = ['update_time'];
    protected $delete = ['delete_time'];

    /**
     * 文章作者
     * @param $value
     * @return mixed
     */
    protected function setAuthorAttr($value)
    {
        return $value ? $value : Session::get('admin_name');
    }

    /**
     * 反转义HTML实体标签
     * @param $value
     * @return string
     */
    protected function setContentAttr($value)
    {
        return htmlspecialchars_decode($value);
    }

    /**
     * 序列化photo图集
     * @param $value
     * @return string
     */
    protected function setPhotoAttr($value)
    {
        return serialize($value);
    }

    /**
     * 反序列化photo图集
     * @param $value
     * @return mixed
     */
    protected function getPhotoAttr($value)
    {
        return unserialize($value);
    }

    /**
     * 创建时间
     * @return bool|string
     */
    protected function setCreateTimeAttr()
    {
        return date('Y-m-d H:i:s');
    }

    /**
    * 查询商品列表信息
    * @param $map    array   查询条件数组
    * @param $page   int     页码
    * @param $field  string  查询的商品表字段
    **/
    public function getGoodsList( $map = array(), $page = 1, $field = '' ){

        $article_list  = $this->field($field)->where($map)->order(['publish_time' => 'DESC'])->paginate(15, false, ['page' => $page])->toArray();

        return $article_list;
    }

    /**
    * 通过条件查询商品信息
    * @param $id     int     商品ID号
    * @param $field  string  查询的商品表字段
    **/
    public function getGoodsInfo($id, $field){
        //关键字查询
        $param = [];
        //ID单数据查询
        $article_info  = $this->field($field)->where(array('id'=>$id))->find();

        return $article_info;
    }

    /**
     * 获取指定时间段的商品发布数量
     * @param  [type] $time [description]
     * @return [type]       [description]
     */
    public static function getCount($time = 'all'){
        $where = ' status=1 ';

        if( $time != 'all' ){
            $where .=  ' AND DATE_SUB(CURDATE(), INTERVAL'.$time.') <= DATE(create_time)';
        }

        $sql =  'SELECT COUNT(id) as number FROM ewei_goods WHERE '.$where;

        $row = Db::query($sql);
        return $row[0]['number'];
    }
}