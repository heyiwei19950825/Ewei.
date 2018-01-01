<?php
/**
 * 公共助手函数
 * @authors Your Name (you@example.org)
 * @date    2017-12-26 23:06:37
 * @version $Id$
 */
namespace app\common\lib;
class Helper {
	//////////////////////////////////
    ///////////时间处理//////////////
    ////////////////////////////////
    //将秒数转换为时间（年、天、小时、分、秒）
    //
    static function Sec2Time($time){  
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
   
}