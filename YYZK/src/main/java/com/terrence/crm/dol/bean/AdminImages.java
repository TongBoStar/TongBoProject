package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class AdminImages extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 唯一标识ID
	 */
	private Long id;
	/**
	 * 上传的图片的路径
	 */
	private String imgPath;
	/**
	 * 图片名称
	 */
	private String imgName;
	/**
	 * 上传时间
	 */
	private String crateTime;
	/**
	 * 用户的ID号
	 */
	private Long adminId;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getImgPath(){
		return this.imgPath;
	}
	public void setImgPath(String imgPath){
		this.imgPath=imgPath;
	}
	public String getImgName(){
		return this.imgName;
	}
	public void setImgName(String imgName){
		this.imgName=imgName;
	}
	public String getCrateTime(){
		return this.crateTime;
	}
	public void setCrateTime(String crateTime){
		this.crateTime=crateTime;
	}
	public Long getAdminId(){
		return this.adminId;
	}
	public void setAdminId(Long adminId){
		this.adminId=adminId;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("ImgPath",getImgPath())
			.append("ImgName",getImgName())
			.append("CrateTime",getCrateTime())
			.append("AdminId",getAdminId())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getImgPath())
			.append(getImgName())
			.append(getCrateTime())
			.append(getAdminId())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof AdminImages == false) return false;
		if(this == obj) return true;
		AdminImages other = (AdminImages)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getImgPath(),other.getImgPath())
			.append(getImgName(),other.getImgName())
			.append(getCrateTime(),other.getCrateTime())
			.append(getAdminId(),other.getAdminId())
			.isEquals();
		}

}
