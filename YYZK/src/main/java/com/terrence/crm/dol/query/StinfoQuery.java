package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class StinfoQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键标识
	 */
	private Long id;
	/**
	 * 书童名称
	 */
	private String stName;
	/**
	 * 性别
	 */
	private Integer stsex;
	/**
	 * 出生年月
	 */
	private String birthday;
	/**
	 * 年龄
	 */
	private Integer age;
	/**
	 * 家长密码
	 */
	private String password;
	/**
	 * 头像
	 */
	private String headerUrl;
	/**
	 * 微信号
	 */
	private String wxCode;
	/**
	 * 序列号
	 */
	private String serialNumber;
	/**
	 * 版本号
	 */
	private Integer fversion;
	/**
	 * 登录时间
	 */
	private String loginTime;
	/**
	 * 注销时间
	 */
	private String logoutTime;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getStName(){
		return this.stName;
	}
	public void setStName(String stName){
		this.stName=stName;
	}
	public Integer getStsex(){
		return this.stsex;
	}
	public void setStsex(Integer stsex){
		this.stsex=stsex;
	}
	public String getBirthday(){
		return this.birthday;
	}
	public void setBirthday(String birthday){
		this.birthday=birthday;
	}
	public Integer getAge(){
		return this.age;
	}
	public void setAge(Integer age){
		this.age=age;
	}
	public String getPassword(){
		return this.password;
	}
	public void setPassword(String password){
		this.password=password;
	}
	public String getHeaderUrl(){
		return this.headerUrl;
	}
	public void setHeaderUrl(String headerUrl){
		this.headerUrl=headerUrl;
	}
	public String getWxCode(){
		return this.wxCode;
	}
	public void setWxCode(String wxCode){
		this.wxCode=wxCode;
	}
	public String getSerialNumber(){
		return this.serialNumber;
	}
	public void setSerialNumber(String serialNumber){
		this.serialNumber=serialNumber;
	}
	public Integer getFversion(){
		return this.fversion;
	}
	public void setFversion(Integer fversion){
		this.fversion=fversion;
	}
	public String getLoginTime(){
		return this.loginTime;
	}
	public void setLoginTime(String loginTime){
		this.loginTime=loginTime;
	}
	public String getLogoutTime(){
		return this.logoutTime;
	}
	public void setLogoutTime(String logoutTime){
		this.logoutTime=logoutTime;
	}

}
