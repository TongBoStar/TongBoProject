package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class CommentImg extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 评论的ID
	 */
	private Long commentId;
	/**
	 * 图片路径
	 */
	private String imgPath;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public Long getCommentId(){
		return this.commentId;
	}
	public void setCommentId(Long commentId){
		this.commentId=commentId;
	}
	public String getImgPath(){
		return this.imgPath;
	}
	public void setImgPath(String imgPath){
		this.imgPath=imgPath;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("CommentId",getCommentId())
			.append("ImgPath",getImgPath())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getCommentId())
			.append(getImgPath())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof CommentImg == false) return false;
		if(this == obj) return true;
		CommentImg other = (CommentImg)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getCommentId(),other.getCommentId())
			.append(getImgPath(),other.getImgPath())
			.isEquals();
		}

}
