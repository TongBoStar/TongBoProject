package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class WxuserQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 名称
	 */
	private String nickname;
	/**
	 * 微信号
	 */
	private String wxCode;
	/**
	 * 头像
	 */
	private String headerurl;
	/**
	 * 省
	 */
	private String province;
	/**
	 * 市
	 */
	private String city;
	/**
	 * 性别
	 */
	private Integer sex;
	private String fmark;
	/**
	 * 真实名称
	 */
	private String username;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getNickname(){
		return this.nickname;
	}
	public void setNickname(String nickname){
		this.nickname=nickname;
	}
	public String getWxCode(){
		return this.wxCode;
	}
	public void setWxCode(String wxCode){
		this.wxCode=wxCode;
	}
	public String getHeaderurl(){
		return this.headerurl;
	}
	public void setHeaderurl(String headerurl){
		this.headerurl=headerurl;
	}
	public String getProvince(){
		return this.province;
	}
	public void setProvince(String province){
		this.province=province;
	}
	public String getCity(){
		return this.city;
	}
	public void setCity(String city){
		this.city=city;
	}
	public Integer getSex(){
		return this.sex;
	}
	public void setSex(Integer sex){
		this.sex=sex;
	}
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}
	public String getUsername(){
		return this.username;
	}
	public void setUsername(String username){
		this.username=username;
	}

}
