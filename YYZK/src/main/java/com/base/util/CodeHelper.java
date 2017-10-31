package com.base.util;

import com.character.StringHelper;

/**
 * 
 * 树形结构的数据库，获取code的方法
 * 格式：6位1组
 * 000000
 * 000001
 * @author haifeng
 *
 */
public class CodeHelper {

	public static String getCode(String code){
		String prefix=code.substring(0, code.length()-6);
		String suffix=code.substring(code.length()-6,code.length());
		String result = prefix + StringHelper.padLeft((Long.parseLong(suffix)+1)+"", 6, "0");
		return result;
	}
	
	public static void main(String[] args) {
		System.out.println(getCode("000001"));
	}
}
