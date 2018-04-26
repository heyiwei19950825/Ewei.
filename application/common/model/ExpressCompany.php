<?php
namespace app\common\model;

use think\Db;
use think\Model;


class ExpressCompany extends BaseModel {

    protected $table = 'express_company';

    public function __construct()
    {
        $this->table = config('database.prefix').$this->table;
        parent::__construct();
    }

	/**
     *
     * {@inheritdoc}
     *
     * @see \data\api\IExpress::expressCompanyQuery()
     */
    public function expressCompanyQuery($where = "", $field = "*")
    {
        $ns_express_company = new NsOrderExpressCompanyModel();
        return $ns_express_company->where($where)
            ->field($field)
            ->select();
    }
}