<?php
/**
 * 公共助手函数
 * @authors Your Name (you@example.org)
 * @date    2017-12-26 23:06:37
 * @version $Id$
 */
namespace app\common\lib;
use PHPExcel;
use PHPExcel_IOFactory;
use PHPExcel_Style_Fill;
use PHPExcel_Style_Border;
use PHPExcel_Style_Alignment;

class Helper {
	//////////////////////////////////
    ///////////时间处理//////////////
    ////////////////////////////////
    //将秒数转换为时间（年、天、小时、分、秒）
    //
	/**
	 * 时间转时间戳
	 *
	 * @param unknown $time            
	 */
	static function getTimeTurnTimeStamp($time)
	{
	    $time_stamp = strtotime($time);
	    return $time_stamp;
	}

    /**
     * 时间转换为多少分钟前
     * @param $the_time
     * @return string
     */

    static function time_tran($time) {
        $time = is_int($time)?$time: strtotime($time);
        $time = (int) substr($time, 0, 10);
        $int = time() - $time;
        if ($int <= 2){
            $str = sprintf('刚刚', $int);
        }elseif ($int < 60){
            $str = sprintf('%d秒前', $int);
        }elseif ($int < 3600){
            $str = sprintf('%d分钟前', floor($int / 60));
        }elseif ($int < 86400){
            $str = sprintf('%d小时前', floor($int / 3600));
        }elseif ($int < 2592000){
            $str = sprintf('%d天前', floor($int / 86400));
        }else{
            $str = date('Y-m-d H:i:s', $time);
        }
        return $str;
    }



    /**
     * Excel表格导出
     * @param $title
     * @param $data
     */
    public  static function exportExport( $filename, $data){
        //计算字段长度
        $lineLength = count($data[1]);
        $array = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','I','S','T','U','V','W','X','Y','Z'];
        $filename=str_replace('.xls', '', $filename).'.xls';
        $phpexcel = new PHPExcel();
        $objActSheet = $phpexcel->getActiveSheet();
        $phpexcel->getProperties()
            ->setCreator("Maarten Balliauw")
            ->setLastModifiedBy("Maarten Balliauw")
            ->setTitle("Office 2007 XLSX Test Document")
            ->setSubject("Office 2007 XLSX Test Document")
            ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
            ->setKeywords("office 2007 openxml php")
            ->setCategory("Test result file");
        $phpexcel->getActiveSheet()->fromArray($data);
        $phpexcel->getActiveSheet()->setTitle('Sheet1');

        //设置样式
        $phpexcel->getDefaultStyle()->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER)->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);//设置excel文件默认水平垂直方向居中
        $phpexcel->getDefaultStyle()->getFont()->setSize(8)->setName("微软雅黑");//设置默认字体大小和格式
        $objActSheet->getStyle("A1:".$array[$lineLength-1]."1")->getFont()->setSize(10)->setBold(true);//设置第一行字体大小和加粗
        $objActSheet->getDefaultRowDimension()->setRowHeight(30);//设置默认行高
        $objActSheet->getRowDimension(1)->setRowHeight(20);//设置第一行行高
        //设置列的宽度
        for ($i=0;$i<=$lineLength-1;$i++){
            if($i==$lineLength-1){
                $objActSheet->getColumnDimension( $array[$i] )->setWidth(50);
            }else{
                $objActSheet->getColumnDimension( $array[$i] )->setWidth(20);
            }
        }
        $styleThinBlackBorderOutline = array(
            'borders' => array (
                'outline' => array (
                    'style' => PHPExcel_Style_Border::BORDER_THICK, //设置border样式 'color' => array ('argb' => 'FF000000'), //设置border颜色
                ),
            ));
        $phpexcel->getActiveSheet()->getStyle("A1:".$array[$lineLength-1]."1")->applyFromArray($styleThinBlackBorderOutline);

        //设置背景色
        $phpexcel->getActiveSheet()->getStyle( "A1:".$array[$lineLength-1]."1")->getFill()->setFillType('solid');
        $phpexcel->getActiveSheet()->getStyle("A1:".$array[$lineLength-1]."1")->getFill()->getStartColor()->setRGB('FFEB9C');
        $phpexcel->setActiveSheetIndex(0);


        ob_end_clean();
        ob_start();
        header('Content-Type: application/vnd.ms-excel');
        header("Content-Disposition: attachment;filename=$filename");
        header('Cache-Control: max-age=0');
        header('Cache-Control: max-age=1');
        header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
        header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
        header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
        header ('Pragma: public'); // HTTP/1.0
        $objwriter = PHPExcel_IOFactory::createWriter($phpexcel, 'Excel5');
        $objwriter->save('php://output');
        exit;
        
        
        
//        
//        $objPHPExcel = new PHPExcel();
//        $xlsTitle = $expTitle;
////        $xlsTitle = iconv('utf-8', 'gb2312', $expTitle); // 文件名称
//        $fileName = $expTitle . date('_YmdHis'); // or $xlsTitle 文件名称可根据自己情况设定
//        $cellName = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI', 'AJ', 'AK', 'AL', 'AM', 'AN', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'AY', 'AZ'
//        );
//        $cellNum = count($expCellName);
//        $dataNum = count($expTableData);
//        // 实例化完了之后就先把数据库里面的数据查出来
//        // 设置表头信息
////        foreach ($title as $key=>$item) {
////            $objPHPExcel->setActiveSheetIndex(0)
////                ->setCellValue($cellName[$key].($key+1), $item);
////        }
////
////
////        /*--------------开始从数据库提取信息插入Excel表中------------------*/
////
//////        $i=2;  //定义一个i变量，目的是在循环输出数据是控制行数
//////        $count = count($data);  //计算有多少条数据
//////        for ($i = 2; $i <= $count+1; $i++) {
////            foreach ($data as  $item ){
////                foreach ( $item as $key=>$Item) {
////                    $objPHPExcel->getActiveSheet()->setCellValue($cellName[$key+2] . ($key+2), $Item);
////                }
////            }
//////            $objPHPExcel->getActiveSheet()->setCellValue('A' . $i, $sql[$i-2]['nickname']);
//////        }
//        for ($i = 0; $i < $cellNum; $i ++) {
//            $objPHPExcel->setActiveSheetIndex(0)->setCellValue($cellName[$i] . '2', $expCellName[$i][1]);
//        }
//        for ($i = 0; $i < $dataNum; $i ++) {
//            for ($j = 0; $j < $cellNum; $j ++) {
//                $objPHPExcel->getActiveSheet(0)->setCellValue($cellName[$j] . ($i + 3), " " . $expTableData[$i][$expCellName[$j][0]]);
//            }
//        }
//        /*--------------下面是设置其他信息------------------*/
//        $objPHPExcel->getActiveSheet()->setTitle('productaccess');      //设置sheet的名称
//        $objPHPExcel->setActiveSheetIndex(0);                   //设置sheet的起始位置
//        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');   //通过PHPExcel_IOFactory的写函数将上面数据写出来
//        ob_end_clean();
//        ob_start();
//        header('Content-type:application/vnd.ms-excel;charset=utf-8;name="' . $xlsTitle . '.xls"');
//        header('Content-Disposition: attachment;filename="'.$fileName.'.xls"');
//        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
//
//        $objWriter->save("php://output");die; //表示在$path路径下面生成demo.xlsx文件
    }


    /**
     * @param string $url get请求地址
     * @param int $httpCode 返回状态码
     * @return mixed
     */
    public static function  curl_get($url, &$httpCode = 0)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        //不做证书校验,部署在linux环境下请改为true
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
        $file_contents = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        return $file_contents;
    }

    /**
     * 生成随机Code码
     * @param $length
     * @return string
     */
    public static function createCode($length){
        $chars ='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $code = '';
        for ( $i = 0; $i < $length; $i++ )
        {
            $code .= $chars[ mt_rand(0, strlen($chars) - 1) ];
        }

        return $code;
    }
   
}