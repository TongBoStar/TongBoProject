package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Yqkitem extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键唯一标识
	 */
	private Long id;
	/**
	 * 模块名称
	 */
	private String itemclassName;
	/**
	 * 父级ID
	 */
	private Integer parentId;
	/**
	 * 父级名称
	 */
	private String parentName;
	/**
	 * 图标路径
	 */
	private String itemicon;
	/**
	 * 级别
	 */
	private Integer flevel;
	/**
	 * 描述
	 */
	private String fdesc;
	/**
	 * 创建人
	 */
	private Long createUserId;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 专辑类别
	 */
	private String itemType ;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getItemclassName(){
		return this.itemclassName;
	}
	public void setItemclassName(String itemclassName){
		this.itemclassName=itemclassName;
	}
	public Integer getParentId(){
		return this.parentId;
	}
	public void setParentId(Integer parentId){
		this.parentId=parentId;
	}
	public String getItemicon(){
		return this.itemicon;
	}
	public void setItemicon(String itemicon){
		this.itemicon=itemicon;
	}
	public Integer getFlevel(){
		return this.flevel;
	}
	public void setFlevel(Integer flevel){
		this.flevel=flevel;
	}
	public String getFdesc(){
		return this.fdesc;
	}
	public void setFdesc(String fdesc){
		this.fdesc=fdesc;
	}
	public Long getCreateUserId(){
		return this.createUserId;
	}
	public void setCreateUserId(Long createUserId){
		this.createUserId=createUserId;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getItemType() {
		return itemType;
	}
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("ItemclassName",getItemclassName())
			.append("ParentId",getParentId())
			.append("Itemicon",getItemicon())
			.append("Flevel",getFlevel())
			.append("Fdesc",getFdesc())
			.append("CreateUserId",getCreateUserId())
			.append("CreateTime",getCreateTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getItemclassName())
			.append(getParentId())
			.append(getItemicon())
			.append(getFlevel())
			.append(getFdesc())
			.append(getCreateUserId())
			.append(getCreateTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Yqkitem == false) return false;
		if(this == obj) return true;
		Yqkitem other = (Yqkitem)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getItemclassName(),other.getItemclassName())
			.append(getParentId(),other.getParentId())
			.append(getItemicon(),other.getItemicon())
			.append(getFlevel(),other.getFlevel())
			.append(getFdesc(),other.getFdesc())
			.append(getCreateUserId(),other.getCreateUserId())
			.append(getCreateTime(),other.getCreateTime())
			.isEquals();
		}

}
