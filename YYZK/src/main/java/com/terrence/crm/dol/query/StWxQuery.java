package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class StWxQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	private String wxcode;
	/**
	 * 依云序列号
	 */
	private String stCode;
	private String serialNumber;
	private String createDate;

	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public String getWxcode(){
		return this.wxcode;
	}
	public void setWxcode(String wxcode){
		this.wxcode=wxcode;
	}
	public String getStCode(){
		return this.stCode;
	}
	public void setStCode(String stCode){
		this.stCode=stCode;
	}
	public String getSerialNumber(){
		return this.serialNumber;
	}
	public void setSerialNumber(String serialNumber){
		this.serialNumber=serialNumber;
	}
	public String getCreateDate(){
		return this.createDate;
	}
	public void setCreateDate(String createDate){
		this.createDate=createDate;
	}

}
