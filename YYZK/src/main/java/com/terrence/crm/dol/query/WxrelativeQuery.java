package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class WxrelativeQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	/**
	 * 进行扫描的人的微信号
	 */
	private String wxCode;
	/**
	 * 被扫描人的微信号
	 */
	private String upwxCode;
	/**
	 * 时间
	 */
	private String createTime;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getWxCode(){
		return this.wxCode;
	}
	public void setWxCode(String wxCode){
		this.wxCode=wxCode;
	}
	public String getUpwxCode(){
		return this.upwxCode;
	}
	public void setUpwxCode(String upwxCode){
		this.upwxCode=upwxCode;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}

}
