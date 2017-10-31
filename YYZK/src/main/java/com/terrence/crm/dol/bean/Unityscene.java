package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Unityscene extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 唯一标识ID
	 */
	private Long id;
	/**
	 * 场景名称
	 */
	private String sceneName;
	/**
	 * 最低年龄
	 */
	private Integer minage;
	/**
	 * 最高年龄
	 */
	private Integer maxage;
	/**
	 * 是否可用
	 */
	private Integer fstatus;
	/**
	 * 场景代码
	 */
	private String sceneCode;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 创建人
	 */
	private Long createrUserId;
	/**
	 * 备注
	 */
	private String fmark;
	/**
	 * 图片位置
	 */
	private String resourceIcon;
	/**
	 * 场景序号
	 */
	private Integer fseq;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getSceneName(){
		return this.sceneName;
	}
	public void setSceneName(String sceneName){
		this.sceneName=sceneName;
	}
	public Integer getMinage(){
		return this.minage;
	}
	public void setMinage(Integer minage){
		this.minage=minage;
	}
	public Integer getMaxage(){
		return this.maxage;
	}
	public void setMaxage(Integer maxage){
		this.maxage=maxage;
	}
	public Integer getFstatus(){
		return this.fstatus;
	}
	public void setFstatus(Integer fstatus){
		this.fstatus=fstatus;
	}
	public String getSceneCode(){
		return this.sceneCode;
	}
	public void setSceneCode(String sceneCode){
		this.sceneCode=sceneCode;
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
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}
	public String getResourceIcon(){
		return this.resourceIcon;
	}
	public void setResourceIcon(String resourceIcon){
		this.resourceIcon=resourceIcon;
	}
	public Integer getFseq(){
		return this.fseq;
	}
	public void setFseq(Integer fseq){
		this.fseq=fseq;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("SceneName",getSceneName())
			.append("Minage",getMinage())
			.append("Maxage",getMaxage())
			.append("Fstatus",getFstatus())
			.append("SceneCode",getSceneCode())
			.append("CreateTime",getCreateTime())
			.append("CreaterUserId",getCreaterUserId())
			.append("Fmark",getFmark())
			.append("ResourceIcon",getResourceIcon())
			.append("Fseq",getFseq())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getSceneName())
			.append(getMinage())
			.append(getMaxage())
			.append(getFstatus())
			.append(getSceneCode())
			.append(getCreateTime())
			.append(getCreaterUserId())
			.append(getFmark())
			.append(getResourceIcon())
			.append(getFseq())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Unityscene == false) return false;
		if(this == obj) return true;
		Unityscene other = (Unityscene)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getSceneName(),other.getSceneName())
			.append(getMinage(),other.getMinage())
			.append(getMaxage(),other.getMaxage())
			.append(getFstatus(),other.getFstatus())
			.append(getSceneCode(),other.getSceneCode())
			.append(getCreateTime(),other.getCreateTime())
			.append(getCreaterUserId(),other.getCreaterUserId())
			.append(getFmark(),other.getFmark())
			.append(getResourceIcon(),other.getResourceIcon())
			.append(getFseq(),other.getFseq())
			.isEquals();
		}

}
