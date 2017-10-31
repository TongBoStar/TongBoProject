package com.terrence.cn.test.wxmms;

public final class Contants {
	public static String ACCESS_TOKEN = "access_token";
	public static String JSAPI_TICKET = "jsapi_ticket";
	public static String APPID = "APPID";
	public static String APPSECRET = "APPSECRET";
	
	public static String IMAGE = "image";
	public static String VOICE = "voice";
	public static String VIDEO = "video";
	public static String THUMB = "thumb";
	
	public static String SEND_MSG_TEXT = "text";
	public static String SEND_MSG_IMAGE = "image";
	public static String SEND_MSG_TEXT_IMAGE = "text_image";
	
	public static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	
	public static final String UPLOAD_URL = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";

	public static final String CREATE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";

	public static final String QUERY_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";

	public static final String DELETE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";

	public static final String CREATE_KF_URL = "https://api.weixin.qq.com/customservice/kfaccount/add?access_token=ACCESS_TOKEN";
	
	/**
	 * 图文素材
	 */
	public static final String UPLOAD_TW_URL = "https://api.weixin.qq.com/cgi-bin/media/uploadnews?access_token=ACCESS_TOKEN";
	
	/**
	 * 获取所有关注用户openid
	 */
	public static final String QUERY_USER_OPENID = "https://api.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN";
	public static final String QUERY_USER_OPENID_NEXT_OPENID = "https://api.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN&next_openid=NEXT_OPENID";
	
	/**
	 * 根据用户open 群发消息
	 */
	public static final String SEND_BY_OPENID = "https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=ACCESS_TOKEN";
	
	
	/**
	 * 错误码
	 */
	public static int ERROR_40003 = 40003;
}
