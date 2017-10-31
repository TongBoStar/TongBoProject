package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Stinfo extends BaseEntity implements java.io.Serializable {
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
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("StName",getStName())
			.append("Stsex",getStsex())
			.append("Birthday",getBirthday())
			.append("Age",getAge())
			.append("Password",getPassword())
			.append("HeaderUrl",getHeaderUrl())
			.append("WxCode",getWxCode())
			.append("SerialNumber",getSerialNumber())
			.append("Fversion",getFversion())
			.append("LoginTime",getLoginTime())
			.append("LogoutTime",getLogoutTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getStName())
			.append(getStsex())
			.append(getBirthday())
			.append(getAge())
			.append(getPassword())
			.append(getHeaderUrl())
			.append(getWxCode())
			.append(getSerialNumber())
			.append(getFversion())
			.append(getLoginTime())
			.append(getLogoutTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Stinfo == false) return false;
		if(this == obj) return true;
		Stinfo other = (Stinfo)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getStName(),other.getStName())
			.append(getStsex(),other.getStsex())
			.append(getBirthday(),other.getBirthday())
			.append(getAge(),other.getAge())
			.append(getPassword(),other.getPassword())
			.append(getHeaderUrl(),other.getHeaderUrl())
			.append(getWxCode(),other.getWxCode())
			.append(getSerialNumber(),other.getSerialNumber())
			.append(getFversion(),other.getFversion())
			.append(getLoginTime(),other.getLoginTime())
			.append(getLogoutTime(),other.getLogoutTime())
			.isEquals();
		}

}
