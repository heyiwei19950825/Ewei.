<?php
/**
 * 城市
 * @authors Ewei (lamp_heyiwei@163.com)
 * @date    2017-12-19 22:51:29
 * @version $Id$
 */
namespace app\common\model;



class City extends BaseModel {

    protected $table = 'city';

    public function __construct()
    {
        $this->table = config('database.prefix').$this->table;
        parent::__construct();
    }

}