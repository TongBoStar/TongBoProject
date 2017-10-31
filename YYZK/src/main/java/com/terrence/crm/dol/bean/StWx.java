package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class StWx extends BaseEntity implements java.io.Serializable {
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
	/**
	 * 使用者姓名 只用于显示
	 */
	private String username;
	/**
	 * 地址 只用于显示
	 */
	private String faddress;
	
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFaddress() {
		return faddress;
	}
	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("Wxcode",getWxcode())
			.append("StCode",getStCode())
			.append("SerialNumber",getSerialNumber())
			.append("CreateDate",getCreateDate())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getWxcode())
			.append(getStCode())
			.append(getSerialNumber())
			.append(getCreateDate())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof StWx == false) return false;
		if(this == obj) return true;
		StWx other = (StWx)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getWxcode(),other.getWxcode())
			.append(getStCode(),other.getStCode())
			.append(getSerialNumber(),other.getSerialNumber())
			.append(getCreateDate(),other.getCreateDate())
			.isEquals();
		}

}
