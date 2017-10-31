package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Wxrelative extends BaseEntity implements java.io.Serializable {
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
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("WxCode",getWxCode())
			.append("UpwxCode",getUpwxCode())
			.append("CreateTime",getCreateTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getWxCode())
			.append(getUpwxCode())
			.append(getCreateTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Wxrelative == false) return false;
		if(this == obj) return true;
		Wxrelative other = (Wxrelative)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getWxCode(),other.getWxCode())
			.append(getUpwxCode(),other.getUpwxCode())
			.append(getCreateTime(),other.getCreateTime())
			.isEquals();
		}

}
