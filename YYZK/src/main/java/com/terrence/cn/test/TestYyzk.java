package com.terrence.cn.test;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.ParseLog;

public class TestYyzk {
	public static void main(String[] args) throws Exception{
		int[] aa = getSequence(3);
		for(int i=0;i<3;i++){
			System.out.println(aa[i]);
		}
		System.out.println(String.format("%0" + 6 + "d", Integer.parseInt("000") + 1000));
		System.out.println("abc".substring(3,"abc".length()));
		
		System.out.println("sd1/sd2/sd3".split("/")[1]);
		
		 Random random = new Random();
		 System.out.println(random.nextInt(5));
		 System.out.println(new Date().getTime());
		 SimpleDateFormat formt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// System.out.println(formt.parse(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd")).getTime());
		 System.out.println("--------------"+formt.format(new Date(1497238800002L)));
		 
		SimpleDateFormat formt2 = new SimpleDateFormat("yyyyMMdd");
		String filepath = "E:\\" + formt2.format(new Date()) + "\\";
		File file = new File(filepath);
		if (file.isDirectory()) {
			String[] filelist = file.list();
			for (int i = 0; i < filelist.length; i++) {
				File readfile = new File(filepath + "\\" + filelist[i]);
				if (!readfile.isDirectory()) {
					System.out.println("path=" + readfile.getPath());
					System.out.println("absolutepath="+ readfile.getAbsolutePath());
					System.out.println("name=" + readfile.getName());
				}
			}
		}
		
		System.out.println("2017-05-08".replaceAll("-", ""));
		
		Map<String,String>  map = new HashMap<String,String>();
		System.out.println(map.get("haha"));
		System.out.println(formatTime(42805625L));
		
		SimpleDateFormat formt3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(formt3.format(1502107135421L));
		System.out.println(3600000/(1000*60*60));
		
		System.out.println("打开音乐".split("打开")[1]);
	}
	/* 
	 * 毫秒转化时分秒毫秒 
	 */  
	public static String formatTime(Long ms) {  
	    Integer ss = 1000;  
	    Integer mi = ss * 60;  
	    Integer hh = mi * 60;  
	    Integer dd = hh * 24;  
	  
	    Long day = ms / dd;  
	    Long hour = (ms - day * dd) / hh;  
	    Long minute = (ms - day * dd - hour * hh) / mi;  
	    Long second = (ms - day * dd - hour * hh - minute * mi) / ss;  
	    Long milliSecond = ms - day * dd - hour * hh - minute * mi - second * ss;  
	      
	    StringBuffer sb = new StringBuffer();  
	    if(day > 0) {  
	        sb.append(day+"天");  
	    }  
	    if(hour > 0) {  
	        sb.append(hour+"小时");  
	    }  
	    if(minute > 0) {  
	        sb.append(minute+"分");  
	    }  
	    if(second > 0) {  
	        sb.append(second+"秒");  
	    }  
	    if(milliSecond > 0) {  
	        sb.append(milliSecond+"毫秒");  
	    }  
	    return sb.toString();  
	}
	/**
     * 对给定数目的自0开始步长为1的数字序列进行乱序
     * @param no 给定数目
     * @return 乱序后的数组
     */
    public static int[] getSequence(int no) {
        int[] sequence = new int[no];
        for(int i = 0; i < no; i++){
            sequence[i] = i;
        }
        Random random = new Random();
        for(int i = 0; i < no; i++){
            int p = random.nextInt(no);
            int tmp = sequence[i];
            sequence[i] = sequence[p];
            sequence[p] = tmp;
        }
        random = null;
        return sequence;
    }
}
