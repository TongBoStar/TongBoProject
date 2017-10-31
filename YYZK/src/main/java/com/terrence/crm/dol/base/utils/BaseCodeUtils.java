package com.terrence.crm.dol.base.utils;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

/**
 * md5加密
 * 
 * @author frank
 */
public abstract class BaseCodeUtils {

	public static Md5PasswordEncoder md5coder = null;
	public static String SYSTEM_ID = "woai9";

	static {
		md5coder = new Md5PasswordEncoder();
	}

	public static String getMd5PasswordEncoder(String password) {
		
		return md5coder.encodePassword(password, SYSTEM_ID);
	}
	
	public static String getMd5PasswordEncoder(String password, String salt) {
		
		return md5coder.encodePassword(password, salt);
	}

	public static void main(String[] args) {
		System.out.println(getMd5PasswordEncoder("liuxiang", "烦人123"));
		
	}
	
}
