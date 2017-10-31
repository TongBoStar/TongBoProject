package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Yyzkhttp extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	/**
	 * 控制模块
	 */
	private String actionModule;
	/**
	 * 类型
	 */
	private Integer ftype;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getActionModule(){
		return this.actionModule;
	}
	public void setActionModule(String actionModule){
		this.actionModule=actionModule;
	}
	public Integer getFtype(){
		return this.ftype;
	}
	public void setFtype(Integer ftype){
		this.ftype=ftype;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("ActionModule",getActionModule())
			.append("Ftype",getFtype())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getActionModule())
			.append(getFtype())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Yyzkhttp == false) return false;
		if(this == obj) return true;
		Yyzkhttp other = (Yyzkhttp)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getActionModule(),other.getActionModule())
			.append(getFtype(),other.getFtype())
			.isEquals();
		}

}
