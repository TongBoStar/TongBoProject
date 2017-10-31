package com.terrence.crm.dol.utils;

import java.util.LinkedList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MathUtil {
	
	public static double find(double[] a) {
		 double max = 0;
		  for (int j = 0; j < a.length-1; j++) {
		   for (int k = j+1 ; k < a.length; k++) {
		    if (a[j] < a[k]){
		     max = a[k];
		    }else{
		     max = a[j];
		    }
		   }
		  }
		  return max;
	} 
	//去除数组中重复的记录  
	public static String[] array_unique(String[] a) {  
	    // array_unique  
	    List<String> list = new LinkedList<String>();  
	    for(int i = 0; i < a.length; i++) {  
	        if(!list.contains(a[i])) {  
	            list.add(a[i]);  
	        }  
	    }  
	    return (String[])list.toArray(new String[list.size()]);  
	} 
	
	public static void main(String[] args) {
		/*double[] dNumber= {1d,2d,3d};
		System.out.println( find( dNumber ) );*/
		/*String[] numbers = {"A/B", "A/B", "C/D", "C/D", "E", "E"};
		String[] numbersNEW=array_unique(numbers);
		for (int i = 0; i < numbersNEW.length; i++) {
			System.out.println(numbersNEW[i]);
		}*/
		/*Number[] orderTypeArrDistinctMoney=new Number[3];
		for (Number number : orderTypeArrDistinctMoney) {
			System.out.println(number);
			if(null==number){
				System.out.println("1");
			}
		}*/
		String x="43535+50.34/98*108.47-3876.9%7√=";
		 Pattern p = Pattern.compile("[=√%*/+-]"); //设定字符
		String[] r= p.split(x); //按设定的字符进行分割
		Matcher m=p.matcher(x); //把找到的设定字符赋给m
		while(m.find())System.out.println("运算符:"+5+m.group()+6); //打印出所有运算符
		for(int i=0; i<r.length; i++){
			System.out.println(r[i]);
		}//打印出所有参数
	}
}
