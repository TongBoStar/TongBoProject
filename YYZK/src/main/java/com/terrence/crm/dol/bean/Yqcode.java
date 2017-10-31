package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Yqcode extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 序号
	 */
	private Long seqno;
	/**
	 * 模块标识
	 */
	private String fmark;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public Long getSeqno(){
		return this.seqno;
	}
	public void setSeqno(Long seqno){
		this.seqno=seqno;
	}
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("Seqno",getSeqno())
			.append("Fmark",getFmark())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getSeqno())
			.append(getFmark())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Yqcode == false) return false;
		if(this == obj) return true;
		Yqcode other = (Yqcode)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getSeqno(),other.getSeqno())
			.append(getFmark(),other.getFmark())
			.isEquals();
		}

}
