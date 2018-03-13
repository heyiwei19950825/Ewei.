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

class Helper {
	//////////////////////////////////
    ///////////时间处理//////////////
    ////////////////////////////////
    //将秒数转换为时间（年、天、小时、分、秒）
    //
    static function Sec2Time($time){
        $time = is_int($time)?$time:strtotime($time);
	    if(is_numeric($time)){  
	    $value = array(  
	      "years" => 0, "days" => 0, "hours" => 0,  
	      "minutes" => 0, "seconds" => 0,  
	    );  
	    // if($time >= 31556926){  
	    //   $value["years"] = floor($time/31556926);  
	    //   $time = ($time%31556926);  
	    // }  
	    if($time >= 86400){  
	      $value["days"] = floor($time/86400);  
	      $time = ($time%86400);  
	    }  
	    if($time >= 3600){  
	      $value["hours"] = floor($time/3600);  
	      $time = ($time%3600);  
	    }  
	    if($time >= 60){  
	      $value["minutes"] = floor($time/60);  
	      $time = ($time%60);  
	    }  
	    $value["seconds"] = floor($time);  
  
	    // $t=$value["years"] ."年". $value["days"] ."天"." ". $value["hours"] ."小时". $value["minutes"] ."分".$value["seconds"]."秒"; 
	    $t= $value["days"] ."天"." ". $value["hours"] ."小时". $value["minutes"] ."分".$value["seconds"]."秒";  
	     

	    return $t;
	    }else{

	    	return (bool) FALSE;  
	    }  
	 }
	
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
    static function time_tran($the_time)
    {
        $now_time = date("Y-m-d H:i:s", time() + 8 * 60 * 60);
        $now_time = is_int($now_time)?$now_time: strtotime($now_time);
        $show_time = is_int($the_time)?$the_time:strtotime($the_time);
        $dur = $now_time - $show_time;
        if ($dur < 0) {
            return $the_time;
        } else {
            if ($dur < 60) {
                return $dur . '秒前';
            } else {
                if ($dur < 3600) {
                    return floor($dur / 60) . '分钟前';
                } else {
                    if ($dur < 86400) {
                        return floor($dur / 3600) . '小时前';
                    } else {
                        if ($dur < 99999999) {//3天内
                            return floor($dur / 86400) . '天前';
                        } else {
                            return $the_time;
                        }
                    }
                }
            }
        }
    }

    /**
     * Excel表格导出
     * @param $title
     * @param $data
     */
    public  static function exportExport( $expTitle, $expCellName, $expTableData){
        $objPHPExcel = new PHPExcel();
        $xlsTitle = iconv('utf-8', 'gb2312', $expTitle); // 文件名称
        $fileName = $expTitle . date('_YmdHis'); // or $xlsTitle 文件名称可根据自己情况设定
        $cellName = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI', 'AJ', 'AK', 'AL', 'AM', 'AN', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'AY', 'AZ'
        );
        $cellNum = count($expCellName);
        $dataNum = count($expTableData);
        // 实例化完了之后就先把数据库里面的数据查出来
        // 设置表头信息
//        foreach ($title as $key=>$item) {
//            $objPHPExcel->setActiveSheetIndex(0)
//                ->setCellValue($cellName[$key].($key+1), $item);
//        }
//
//
//        /*--------------开始从数据库提取信息插入Excel表中------------------*/
//
////        $i=2;  //定义一个i变量，目的是在循环输出数据是控制行数
////        $count = count($data);  //计算有多少条数据
////        for ($i = 2; $i <= $count+1; $i++) {
//            foreach ($data as  $item ){
//                foreach ( $item as $key=>$Item) {
//                    $objPHPExcel->getActiveSheet()->setCellValue($cellName[$key+2] . ($key+2), $Item);
//                }
//            }
////            $objPHPExcel->getActiveSheet()->setCellValue('A' . $i, $sql[$i-2]['nickname']);
////        }
        for ($i = 0; $i < $cellNum; $i ++) {
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue($cellName[$i] . '2', $expCellName[$i][1]);
        }
        for ($i = 0; $i < $dataNum; $i ++) {
            for ($j = 0; $j < $cellNum; $j ++) {
                $objPHPExcel->getActiveSheet(0)->setCellValue($cellName[$j] . ($i + 3), " " . $expTableData[$i][$expCellName[$j][0]]);
            }
        }
        /*--------------下面是设置其他信息------------------*/
        $objPHPExcel->getActiveSheet()->setTitle('productaccess');      //设置sheet的名称
        $objPHPExcel->setActiveSheetIndex(0);                   //设置sheet的起始位置
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');   //通过PHPExcel_IOFactory的写函数将上面数据写出来
        ob_end_clean();
        ob_start();
        header('Content-type:application/vnd.ms-excel;charset=utf-8;name="' . $xlsTitle . '.xls"');
        header('Content-Disposition: attachment;filename="'.$fileName.'.xls"');
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');

        $objWriter->save("php://output");die; //表示在$path路径下面生成demo.xlsx文件
    }
   
}