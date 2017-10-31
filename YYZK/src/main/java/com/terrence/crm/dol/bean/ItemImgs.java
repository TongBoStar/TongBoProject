package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class ItemImgs extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 项目ID
	 */
	private Integer itemId;
	/**
	 * 照片名称
	 */
	private String imgName;
	/**
	 * 照片地址
	 */
	private String imgPath;
	/**
	 * 是否首页显示
	 */
	private Integer showIndexStatus;
	/**
	 * 是否显示
	 */
	private Integer showStatus;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 修改时间
	 */
	private String modifyTime;
	/**
	 * 图片JSON
	 */
	private String filesJson;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public Integer getItemId(){
		return this.itemId;
	}
	public void setItemId(Integer itemId){
		this.itemId=itemId;
	}
	public String getImgName(){
		return this.imgName;
	}
	public void setImgName(String imgName){
		this.imgName=imgName;
	}
	public String getImgPath(){
		return this.imgPath;
	}
	public void setImgPath(String imgPath){
		this.imgPath=imgPath;
	}
	public Integer getShowIndexStatus(){
		return this.showIndexStatus;
	}
	public void setShowIndexStatus(Integer showIndexStatus){
		this.showIndexStatus=showIndexStatus;
	}
	public Integer getShowStatus(){
		return this.showStatus;
	}
	public void setShowStatus(Integer showStatus){
		this.showStatus=showStatus;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public String getModifyTime(){
		return this.modifyTime;
	}
	public void setModifyTime(String modifyTime){
		this.modifyTime=modifyTime;
	}
	public String getFilesJson() {
		return filesJson;
	}
	public void setFilesJson(String filesJson) {
		this.filesJson = filesJson;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("ItemId",getItemId())
			.append("ImgName",getImgName())
			.append("ImgPath",getImgPath())
			.append("ShowIndexStatus",getShowIndexStatus())
			.append("ShowStatus",getShowStatus())
			.append("CreateTime",getCreateTime())
			.append("ModifyTime",getModifyTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getItemId())
			.append(getImgName())
			.append(getImgPath())
			.append(getShowIndexStatus())
			.append(getShowStatus())
			.append(getCreateTime())
			.append(getModifyTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof ItemImgs == false) return false;
		if(this == obj) return true;
		ItemImgs other = (ItemImgs)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getItemId(),other.getItemId())
			.append(getImgName(),other.getImgName())
			.append(getImgPath(),other.getImgPath())
			.append(getShowIndexStatus(),other.getShowIndexStatus())
			.append(getShowStatus(),other.getShowStatus())
			.append(getCreateTime(),other.getCreateTime())
			.append(getModifyTime(),other.getModifyTime())
			.isEquals();
		}

}
