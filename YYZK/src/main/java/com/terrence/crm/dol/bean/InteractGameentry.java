package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class InteractGameentry extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 互动的ID
	 */
	private Long gameId;
	/**
	 * 资源路径
	 */
	private String resImg;
	/**
	 * 对应数字
	 */
	private Integer equalNumber;
	/**
	 * 标签名称
	 */
	private String tagName;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public Long getGameId(){
		return this.gameId;
	}
	public void setGameId(Long gameId){
		this.gameId=gameId;
	}
	public String getResImg(){
		return this.resImg;
	}
	public void setResImg(String resImg){
		this.resImg=resImg;
	}
	public Integer getEqualNumber(){
		return this.equalNumber;
	}
	public void setEqualNumber(Integer equalNumber){
		this.equalNumber=equalNumber;
	}
	public String getTagName(){
		return this.tagName;
	}
	public void setTagName(String tagName){
		this.tagName=tagName;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("GameId",getGameId())
			.append("ResImg",getResImg())
			.append("EqualNumber",getEqualNumber())
			.append("TagName",getTagName())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getGameId())
			.append(getResImg())
			.append(getEqualNumber())
			.append(getTagName())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof InteractGameentry == false) return false;
		if(this == obj) return true;
		InteractGameentry other = (InteractGameentry)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getGameId(),other.getGameId())
			.append(getResImg(),other.getResImg())
			.append(getEqualNumber(),other.getEqualNumber())
			.append(getTagName(),other.getTagName())
			.isEquals();
		}

}
