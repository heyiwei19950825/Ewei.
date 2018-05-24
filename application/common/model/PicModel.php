<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/4/17
 * Time: 10:30
 */

namespace app\common\model;


use think\Model;
use think\Db;

class PicModel extends Model
{
    /**
     * 根据条件查询图片魔方数据
     * @param array $condition
     * @param string $field
     * @return array
     */
    public static function getPicModel( $condition=[],$field=''){
        //查询数据
        $row = Db::name('pic_model')->where($condition)
            ->where(['is_delete'=>0])
            ->field($field)->select()->toArray();
        //数据处理
        foreach ( $row as $k=>&$v){
            $v['data'] = json_decode($v['data'],true);//解析图片json数据
            foreach ($v['data']['pic_list'] as $pk =>&$pv){//图片添加域名

                if( empty($pv['pic_url']) ){//删除空数据
                    unset($v['data']['pic_list'][$pk]);
                    continue;
                }
                $pv['pic_url'] = config('setting.domain').$pv['pic_url'];
            }
        }
        return $row;
    }
}