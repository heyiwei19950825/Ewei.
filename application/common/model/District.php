<?php
/**
 * 区
 * @authors Ewei (lamp_heyiwei@163.com)
 * @date    2017-12-19 22:51:29
 * @version $Id$
 */
namespace app\common\model;


class District extends BaseModel {
    protected $table = 'district';

    public function __construct()
    {
        $this->table = config('database.prefix').$this->table;
        parent::__construct();
    }
}