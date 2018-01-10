<?php
namespace app\common\model;

use think\Db;
use think\Model;


class ExpressCompany extends Model {

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