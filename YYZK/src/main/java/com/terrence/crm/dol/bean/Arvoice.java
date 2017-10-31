package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Arvoice extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 唯一标识ID
	 */
	private Long id;
	/**
	 * 音频名称
	 */
	private String voiceName;
	/**
	 * 音频路径
	 */
	private String voicePath;
	/**
	 * 别名
	 */
	private String actionName;
	/**
	 * 备注
	 */
	private String fmark;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getVoiceName(){
		return this.voiceName;
	}
	public void setVoiceName(String voiceName){
		this.voiceName=voiceName;
	}
	public String getVoicePath(){
		return this.voicePath;
	}
	public void setVoicePath(String voicePath){
		this.voicePath=voicePath;
	}
	public String getActionName(){
		return this.actionName;
	}
	public void setActionName(String actionName){
		this.actionName=actionName;
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
			.append("VoiceName",getVoiceName())
			.append("VoicePath",getVoicePath())
			.append("ActionName",getActionName())
			.append("Fmark",getFmark())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getVoiceName())
			.append(getVoicePath())
			.append(getActionName())
			.append(getFmark())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Arvoice == false) return false;
		if(this == obj) return true;
		Arvoice other = (Arvoice)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getVoiceName(),other.getVoiceName())
			.append(getVoicePath(),other.getVoicePath())
			.append(getActionName(),other.getActionName())
			.append(getFmark(),other.getFmark())
			.isEquals();
		}

}
