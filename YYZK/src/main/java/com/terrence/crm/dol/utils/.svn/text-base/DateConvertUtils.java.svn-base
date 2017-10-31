package com.terrence.crm.dol.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.util.Assert;

import com.opensymphony.xwork2.conversion.impl.DefaultTypeConverter;
/**
 * 日期转换类
 */
public class DateConvertUtils extends DefaultTypeConverter {
	
	private static final DateFormat[] ACCEPT_DATE_FORMATS = {  
        new SimpleDateFormat("dd/MM/yyyy"),  
        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), 
        new SimpleDateFormat("yyyy-MM-dd"),
        new SimpleDateFormat("yyyy/MM/dd") }; //支持转换的日期格式   
	
	public static Date getCurrentDateTime() {
		java.util.Calendar calNow = java.util.Calendar.getInstance();
		java.util.Date dtNow = calNow.getTime();
		return dtNow;
	}
	public static Date getCurrentDate() {
		java.util.Calendar calNow = java.util.Calendar.getInstance();
		java.util.Date dtNow = calNow.getTime();
		return parse(dtNow, "yyyy-MM-dd");
	}
	public static Date getCurrentDateTimeInfo() {
		java.util.Calendar calNow = java.util.Calendar.getInstance();
		java.util.Date dtNow = calNow.getTime();
		return parse(dtNow, "yyyy-MM-dd HH:mm:ss");
	}
	public static java.util.Date parse(String dateString,String dateFormat) {
		return parse(dateString, dateFormat,java.util.Date.class);
	}
	
	@SuppressWarnings("unchecked")
	public static <T extends java.util.Date> T parse(String dateString,String dateFormat,Class<T> targetResultType) {
		if(StringUtils.isEmpty(dateString))
			return null;
		DateFormat df = new SimpleDateFormat(dateFormat);
		try {
			long time = df.parse(dateString).getTime();
			java.util.Date t = targetResultType.getConstructor(long.class).newInstance(time);
			return (T)t;
		} catch (ParseException e) {
			String errorInfo = "cannot use dateformat:"+dateFormat+" parse datestring:"+dateString;
			throw new IllegalArgumentException(errorInfo,e);
		} catch (Exception e) {
			throw new IllegalArgumentException("error targetResultType:"+targetResultType.getName(),e);
		}
	}
	/**
	 * String 时间戳Date取年月日
	 * 
	 * @param count
	 * @return
	 */
	public static String dateToString(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str ="";
		try {
			Date parsedate = sdf.parse(date );
		    str = sdf.format(parsedate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return str;
	}
	public static java.util.Date parse(java.util.Date date, String dateFormat) {
		String dateString = format(date, dateFormat);
		return parse(dateString, dateFormat,java.util.Date.class);
	}
	
	public static String format(java.util.Date date,String dateFormat) {
		 if(date == null)
			 return null;
		 return new SimpleDateFormat(dateFormat).format(date);
	}
	
	
    public Object convertValue(Map context, Object value, Class toType) {   
        if (toType == Date.class) {  //浏览器向服务器提交时，进行String to Date的转换   
            Date date = null;   
            String dateString = null;   
            String[] params = (String[])value;   
            dateString = params[0];//获取日期的字符串   
            for (DateFormat format : ACCEPT_DATE_FORMATS) {   
                try {   
                    return format.parse(dateString);//遍历日期支持格式，进行转换   
                } catch(Exception e) {   
                    continue;   
                }   
            }   
            return null;   
        }   
        else if (toType == String.class) {   //服务器向浏览器输出时，进行Date to String的类型转换   
            Date date = (Date)value;   
            return new SimpleDateFormat("yyyy-MM-dd").format(date);//输出的格式是yyyy-MM-dd   
        }   
          
        return null;   
    }  
    
    public static Date getMonthEnd(int year, int month) {
		StringBuffer sb = new StringBuffer(10);
		Date date;
		if (month < 12) {
			sb.append(Integer.toString(year));
			sb.append("-");
			sb.append(month + 1);
			sb.append("-1");
			date = parse(sb.toString(), "yyyy-MM-dd");
		} else {
			sb.append(Integer.toString(year + 1));
			sb.append("-1-1");
			date = parse(sb.toString(), "yyyy-MM-dd");
		}
		date.setTime(date.getTime() - 1);
		return date;
	}
    
    /**
	 * 获取月底
	 * @param when 要计算月底的日期
	 * @return 月底的Date对象。例如：2006-3-31 23:59:59.999
	 */
	public static Date getMonthEnd(Date when) {
		Assert.notNull(when, "date must not be null !");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(when);
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		return getMonthEnd(year, month);
	}
	
	 /**
	  * 获取给定日期的年
	  * @param currentDateTime
	  * @return
	  */
	 public static int getYearOfDate(Date currentDateTime){ 
	       Calendar calendar = Calendar.getInstance();
	       
	        calendar.setTime(currentDateTime);
	        return calendar.get(Calendar.YEAR);
	   
	    }
	 
	 /**
	  * 获取给定日期的月
	  * @param currentDateTime
	  * @return
	  */
	 public static int getMonthOfDate(Date currentDateTime){ 
	       Calendar calendar = Calendar.getInstance();
	       
	        calendar.setTime(currentDateTime);
	        return calendar.get(Calendar.MONTH) +1;
	   
	    }
    
	 /**
		 * 日期加法
		 * @param when 被计算的日期
		 * @param field the time field. 在Calendar中定义的常数，例如Calendar.DATE
		 * @param amount 加数
		 * @return 计算后的日期
		 */
		public static Date add(Date when, int field, int amount) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(when);
			calendar.add(field, amount);
			return calendar.getTime();
		}
		
		/**
		 * 计算给定的日期加上给定的天数。
		 * @param when 给定的日期
		 * @param amount 给定的天数
		 * @return 计算后的日期
		 */
		public static Date addDays(Date when, int amount) {
			return add(when, Calendar.DAY_OF_YEAR, amount);
		}

		/**
		 * 计算给定的日期加上给定的月数。
		 * @param when 给定的日期
		 * @param amount 给定的月数
		 * @return 计算后的日期
		 */
		public static Date addMonths(Date when, int amount) {
			return add(when, Calendar.MONTH, amount);
		}
		/**
		 * 一天的开始
		 * @param date
		 * @return
		 */
		public static Date getStartForDay(Date date){
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.set(Calendar.HOUR_OF_DAY, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			calendar.set(Calendar.MILLISECOND, 0);
			return calendar.getTime();
		}
		/**
		 * 一天的结束
		 * @param date
		 * @return
		 */
		public static Date getEndForDay(Date date){
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.set(Calendar.HOUR_OF_DAY, 23);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.SECOND, 59);
			calendar.set(Calendar.MILLISECOND, 999);
			return calendar.getTime();
		}
		
		/**
		 * 间隔的天数
		 * @param start
		 * @param end
		 * @return
		 */
		public static Integer intervalDayOfYear(Date start,Date end){
			Integer rnt = null;
			if(start!=null&&end!=null){
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(start);
				calendar.set(Calendar.HOUR_OF_DAY, 0);
				calendar.set(Calendar.MINUTE, 0);
				calendar.set(Calendar.SECOND, 0);
				calendar.set(Calendar.MILLISECOND, 0);
				
				long startTime = calendar.getTime().getTime();
				
				calendar = Calendar.getInstance();
				calendar.setTime(end);
				calendar.set(Calendar.HOUR_OF_DAY, 0);
				calendar.set(Calendar.MINUTE, 0);
				calendar.set(Calendar.SECOND, 0);
				calendar.set(Calendar.MILLISECOND, 0);
				calendar.add(Calendar.DAY_OF_YEAR, 1);
				long endTime = calendar.getTime().getTime();
				
				rnt = (int)(endTime-startTime)/(1000*60*60*24);
			}
			
			return rnt;
		}
		/**
		 * 把数随机分到指定的数组中
		 * @param arrayLength
		 * @param num
		 * @return
		 */
		public static int[] randomDistribution(int arrayLength,int num){
			int[] arr = new int[arrayLength];
			//平均数
			int averageNum = num/arrayLength;
			//余数
			int remainder = num%arrayLength;
			
			for(int i=0;i<arrayLength;i++){
				arr[i] = averageNum;
			}
			
			java.util.Random r = new java.util.Random();
			
			
			if(arrayLength/2>remainder){
				while(remainder>0){
					int index = r.nextInt(arrayLength-1);
					if(arr[index]==averageNum){
						arr[index]+=1;
						remainder--;
					}
				}
			}else{
				for(int i=0;i<arrayLength;i++){
					arr[i] += 1;
				}
				while(arrayLength-remainder>0){
					int index = r.nextInt(arrayLength-1);
					if(arr[index]==averageNum+1){
						arr[index]-=1;
						remainder++;
					}
				}
			}
				
			
			return arr;
		}
		/**
		 * 
		 * @param day
		 * @param startTime
		 * @param endTime
		 * @param num
		 * @return
		 */
		public static long[] randomTime(Date day,int startTime , int endTime , int num){
			long[] arr = new long[num];
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(day);
			calendar.set(Calendar.HOUR_OF_DAY, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			calendar.set(Calendar.MILLISECOND, 0);
			
			calendar.add(Calendar.SECOND, startTime);
			
			java.util.Random r = new java.util.Random();
			int interval = (endTime-startTime)/num;
			//int start = r.nextInt(interval);
			
			//calendar.add(Calendar.SECOND, start);
			for(int i=0;i<arr.length;i++){
				arr[i] =  calendar.getTime().getTime()+r.nextInt(interval/2)*1000;
				calendar.add(Calendar.SECOND, interval);
			}
			
			return arr;
		}
		
		
    public static void main(String []args){
//    	Date date=DateConvertUtils.parse("2015-07-09"+" 00:00:000","yyyy-MM-dd HH:mm:ss");
//    	System.out.println(date.toString());
//    	System.out.println(getCurrentDateTimeInfo());
	 }
}
