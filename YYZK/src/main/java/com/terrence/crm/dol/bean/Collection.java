package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;

@Entity
public class Collection extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	/**
	 * 项目ID
	 */
	private Integer itemId;
	/**
	 * 收藏用户ID
	 */
	private Integer userId;
	/**
	 * 收藏时间
	 */
	private String createTime;
	/**
	 * 项目信息
	 */
	private Item item;
	
	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getItemId(){
		return this.itemId;
	}
	public void setItemId(Integer itemId){
		this.itemId=itemId;
	}
	public Integer getUserId(){
		return this.userId;
	}
	public void setUserId(Integer userId){
		this.userId=userId;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("ItemId",getItemId())
			.append("UserId",getUserId())
			.append("CreateTime",getCreateTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getItemId())
			.append(getUserId())
			.append(getCreateTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Collection == false) return false;
		if(this == obj) return true;
		Collection other = (Collection)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getItemId(),other.getItemId())
			.append(getUserId(),other.getUserId())
			.append(getCreateTime(),other.getCreateTime())
			.isEquals();
		}

}
