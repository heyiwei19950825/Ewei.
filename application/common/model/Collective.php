<?php
/**
 * 
 * @authors Ewei (lamp_heyiwei@163.com)
 * @date    2017-12-19 22:54:53
 * @version $Id$
 */
namespace app\common\model;

use think\Model;
class Collective extends Model {
    
   protected $insert = ['create_time'];

    /**
     * 创建时间
     * @return bool|string
     */
    protected function setCreateTimeAttr()
    {
        return date('Y-m-d H:i:s');
    }

}