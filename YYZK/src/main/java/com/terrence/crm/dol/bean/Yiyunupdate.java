package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Yiyunupdate extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 更新的表名称
	 */
	private String ftable;
	/**
	 * 更新的对象的ID号
	 */
	private Long fid;
	/**
	 * 更新人ID
	 */
	private Long createrId;
	/**
	 * 更新时间
	 */
	private String createTime;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getFtable(){
		return this.ftable;
	}
	public void setFtable(String ftable){
		this.ftable=ftable;
	}
	public Long getFid(){
		return this.fid;
	}
	public void setFid(Long fid){
		this.fid=fid;
	}
	public Long getCreaterId(){
		return this.createrId;
	}
	public void setCreaterId(Long createrId){
		this.createrId=createrId;
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
			.append("Ftable",getFtable())
			.append("Fid",getFid())
			.append("CreaterId",getCreaterId())
			.append("CreateTime",getCreateTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getFtable())
			.append(getFid())
			.append(getCreaterId())
			.append(getCreateTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Yiyunupdate == false) return false;
		if(this == obj) return true;
		Yiyunupdate other = (Yiyunupdate)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getFtable(),other.getFtable())
			.append(getFid(),other.getFid())
			.append(getCreaterId(),other.getCreaterId())
			.append(getCreateTime(),other.getCreateTime())
			.isEquals();
		}

}
