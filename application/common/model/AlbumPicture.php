<?php
/**
 * 省
 * @authors Ewei (lamp_heyiwei@163.com)
 * @date    2017-12-19 22:51:29
 * @version $Id$
 */
namespace app\common\model;

use app\Common\Model\BaseModel;

class AlbumPicture extends BaseModel {

    protected $table = 'ewei_album_picture';
    protected $rule = [
        'pic_id'  =>  '', 
        'pic_tag'  =>  'no_html_parse',
        'pic_name'  =>  'no_html_parse',
        'pic_cover'  =>  'no_html_parse',
        'pic_cover_big'  =>  'no_html_parse',
        'pic_cover_mid'  =>  'no_html_parse',
        'pic_cover_small'  =>  'no_html_parse',
        'pic_cover_micro'  =>  'no_html_parse'
    ];
    protected $msg = [
        'pic_id'  =>  '',
        'pic_tag'  =>  '',
        'pic_name'  =>  '',
        'pic_cover'  =>  '',
        'pic_cover_big'  =>  '',
        'pic_cover_mid'  =>  '',
        'pic_cover_small'  =>  '',
        'pic_cover_micro'  =>  ''
    ];
}