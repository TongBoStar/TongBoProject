/**
 * 
 */
package com.terrence.crm.dol.base.utils;

import java.util.HashMap;

/**
 * @author thinkpad
 *
 */
public class JsonResult extends HashMap<String,Object>{
	
	private static String RESULT_KEY = "result";
	private static String LOGIN_KEY = "login";
	private static String MESSAGE_KEY = "message";
	/**
	 * 
	 */
	private static final long serialVersionUID = 9057532981454626913L;

	public JsonResult(boolean result,boolean isLogin){
		this.put(RESULT_KEY, result);
		this.put(LOGIN_KEY, isLogin);
	}
	public JsonResult(boolean result){
		this.put(RESULT_KEY, result);
	}
	public void addData(String key , Object value){
		this.put(key, value);
	}
	
	public void setMessage(String message){
		this.put(MESSAGE_KEY, message);
	}
	
	public static JsonResult buildFailJsonResult(){
		return new JsonResult(false);
	}
	
	public static JsonResult buildFailLoginJsonResult(){
		return new JsonResult(false,false);
	}
	
	public static JsonResult buildSuccessJsonResult(){
		return new JsonResult(true);
	}
	
}
