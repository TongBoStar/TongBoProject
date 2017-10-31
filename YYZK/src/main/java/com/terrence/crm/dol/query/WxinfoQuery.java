package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class WxinfoQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	/**
	 * 帐号名称
	 */
	private String wxName;
	/**
	 * APPID 应用ID 重要
	 */
	private String appId;
	/**
	 * 应用密钥
	 */
	private String appSecret;
	/**
	 * 微信类型 1订阅号 2服务号
	 */
	private String wxtype;
	/**
	 * token名称
	 */
	private String token;
	/**
	 * access_token
	 */
	private String access_token;
	/**
	 * token过期时间
	 */
	private Long token_expireTime;
	/**
	 * jsapi_ticket
	 */
	private String jsapi_ticket;
	/**
	 * noncestr
	 */
	private String noncestr;
	/**
	 * signature
	 */
	private String signature;

	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public String getWxName(){
		return this.wxName;
	}
	public void setWxName(String wxName){
		this.wxName=wxName;
	}
	public String getAppId(){
		return this.appId;
	}
	public void setAppId(String appId){
		this.appId=appId;
	}
	public String getAppSecret(){
		return this.appSecret;
	}
	public void setAppSecret(String appSecret){
		this.appSecret=appSecret;
	}
	public String getWxtype(){
		return this.wxtype;
	}
	public void setWxtype(String wxtype){
		this.wxtype=wxtype;
	}
	public String getToken(){
		return this.token;
	}
	public void setToken(String token){
		this.token=token;
	}
	public String getAccess_token(){
		return this.access_token;
	}
	public void setAccess_token(String access_token){
		this.access_token=access_token;
	}
	public Long getToken_expireTime(){
		return this.token_expireTime;
	}
	public void setToken_expireTime(Long token_expireTime){
		this.token_expireTime=token_expireTime;
	}
	public String getJsapi_ticket(){
		return this.jsapi_ticket;
	}
	public void setJsapi_ticket(String jsapi_ticket){
		this.jsapi_ticket=jsapi_ticket;
	}
	public String getNoncestr(){
		return this.noncestr;
	}
	public void setNoncestr(String noncestr){
		this.noncestr=noncestr;
	}
	public String getSignature(){
		return this.signature;
	}
	public void setSignature(String signature){
		this.signature=signature;
	}

}
