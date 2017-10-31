package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Unityobj extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键标识ID
	 */
	private Long id;
	/**
	 * 场景标识
	 */
	private String sceneCode;
	/**
	 * 对象名称
	 */
	private String objName;
	/**
	 * 备注描述
	 */
	private String fmark;
	/**
	 * 英文名称
	 */
	private String enName;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 创建人
	 */
	private Long createrUserId;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getSceneCode(){
		return this.sceneCode;
	}
	public void setSceneCode(String sceneCode){
		this.sceneCode=sceneCode;
	}
	public String getObjName(){
		return this.objName;
	}
	public void setObjName(String objName){
		this.objName=objName;
	}
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}
	public String getEnName(){
		return this.enName;
	}
	public void setEnName(String enName){
		this.enName=enName;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public Long getCreaterUserId(){
		return this.createrUserId;
	}
	public void setCreaterUserId(Long createrUserId){
		this.createrUserId=createrUserId;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("SceneCode",getSceneCode())
			.append("ObjName",getObjName())
			.append("Fmark",getFmark())
			.append("EnName",getEnName())
			.append("CreateTime",getCreateTime())
			.append("CreaterUserId",getCreaterUserId())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getSceneCode())
			.append(getObjName())
			.append(getFmark())
			.append(getEnName())
			.append(getCreateTime())
			.append(getCreaterUserId())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Unityobj == false) return false;
		if(this == obj) return true;
		Unityobj other = (Unityobj)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getSceneCode(),other.getSceneCode())
			.append(getObjName(),other.getObjName())
			.append(getFmark(),other.getFmark())
			.append(getEnName(),other.getEnName())
			.append(getCreateTime(),other.getCreateTime())
			.append(getCreaterUserId(),other.getCreaterUserId())
			.isEquals();
		}

}
