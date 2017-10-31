package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Turingtest extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 测试模块名称
	 */
	private String modelName;
	/**
	 * 测试记录内容
	 */
	private String fanswer;
	/**
	 * 问的问题
	 */
	private String fask;
	/**
	 * 是否正常
	 */
	private Integer fstatus;
	/**
	 * 测试时间
	 */
	private String createTime;
	/**
	 * 回复的原始记录
	 */
	private String fcontent;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getModelName(){
		return this.modelName;
	}
	public void setModelName(String modelName){
		this.modelName=modelName;
	}
	public String getFanswer(){
		return this.fanswer;
	}
	public void setFanswer(String fanswer){
		this.fanswer=fanswer;
	}
	public String getFask(){
		return this.fask;
	}
	public void setFask(String fask){
		this.fask=fask;
	}
	public Integer getFstatus(){
		return this.fstatus;
	}
	public void setFstatus(Integer fstatus){
		this.fstatus=fstatus;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public String getFcontent(){
		return this.fcontent;
	}
	public void setFcontent(String fcontent){
		this.fcontent=fcontent;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("ModelName",getModelName())
			.append("Fanswer",getFanswer())
			.append("Fask",getFask())
			.append("Fstatus",getFstatus())
			.append("CreateTime",getCreateTime())
			.append("Fcontent",getFcontent())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getModelName())
			.append(getFanswer())
			.append(getFask())
			.append(getFstatus())
			.append(getCreateTime())
			.append(getFcontent())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Turingtest == false) return false;
		if(this == obj) return true;
		Turingtest other = (Turingtest)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getModelName(),other.getModelName())
			.append(getFanswer(),other.getFanswer())
			.append(getFask(),other.getFask())
			.append(getFstatus(),other.getFstatus())
			.append(getCreateTime(),other.getCreateTime())
			.append(getFcontent(),other.getFcontent())
			.isEquals();
		}

}
