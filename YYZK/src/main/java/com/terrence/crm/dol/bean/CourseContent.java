package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class CourseContent extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	/**
	 * 内容类型
	 */
	private Integer contentType;
	/**
	 * 文本内容
	 */
	private String contentText;
	/**
	 * 音乐地址
	 */
	private String musicUrl;
	/**
	 * 视频地址
	 */
	private String videoUrl;
	/**
	 * 图片地址
	 */
	private String imgUrl;
	/**
	 * 内容标题
	 */
	private String contentTitle;
	/**
	 * 内容序号
	 */
	private Integer contentNo;
	/**
	 * 创建人ID
	 */
	private Integer createUserId;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 修改时间
	 */
	private String modifyTime;
	/**
	 * 课时ID
	 */
	private Integer courseDetailId;

	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getContentType(){
		return this.contentType;
	}
	public void setContentType(Integer contentType){
		this.contentType=contentType;
	}
	public String getContentText(){
		return this.contentText;
	}
	public void setContentText(String contentText){
		this.contentText=contentText;
	}
	public String getMusicUrl(){
		return this.musicUrl;
	}
	public void setMusicUrl(String musicUrl){
		this.musicUrl=musicUrl;
	}
	public String getVideoUrl(){
		return this.videoUrl;
	}
	public void setVideoUrl(String videoUrl){
		this.videoUrl=videoUrl;
	}
	public String getImgUrl(){
		return this.imgUrl;
	}
	public void setImgUrl(String imgUrl){
		this.imgUrl=imgUrl;
	}
	public String getContentTitle(){
		return this.contentTitle;
	}
	public void setContentTitle(String contentTitle){
		this.contentTitle=contentTitle;
	}
	public Integer getContentNo(){
		return this.contentNo;
	}
	public void setContentNo(Integer contentNo){
		this.contentNo=contentNo;
	}
	public Integer getCreateUserId(){
		return this.createUserId;
	}
	public void setCreateUserId(Integer createUserId){
		this.createUserId=createUserId;
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
	public Integer getCourseDetailId(){
		return this.courseDetailId;
	}
	public void setCourseDetailId(Integer courseDetailId){
		this.courseDetailId=courseDetailId;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("ContentType",getContentType())
			.append("ContentText",getContentText())
			.append("MusicUrl",getMusicUrl())
			.append("VideoUrl",getVideoUrl())
			.append("ImgUrl",getImgUrl())
			.append("ContentTitle",getContentTitle())
			.append("ContentNo",getContentNo())
			.append("CreateUserId",getCreateUserId())
			.append("CreateTime",getCreateTime())
			.append("ModifyTime",getModifyTime())
			.append("CourseDetailId",getCourseDetailId())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getContentType())
			.append(getContentText())
			.append(getMusicUrl())
			.append(getVideoUrl())
			.append(getImgUrl())
			.append(getContentTitle())
			.append(getContentNo())
			.append(getCreateUserId())
			.append(getCreateTime())
			.append(getModifyTime())
			.append(getCourseDetailId())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof CourseContent == false) return false;
		if(this == obj) return true;
		CourseContent other = (CourseContent)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getContentType(),other.getContentType())
			.append(getContentText(),other.getContentText())
			.append(getMusicUrl(),other.getMusicUrl())
			.append(getVideoUrl(),other.getVideoUrl())
			.append(getImgUrl(),other.getImgUrl())
			.append(getContentTitle(),other.getContentTitle())
			.append(getContentNo(),other.getContentNo())
			.append(getCreateUserId(),other.getCreateUserId())
			.append(getCreateTime(),other.getCreateTime())
			.append(getModifyTime(),other.getModifyTime())
			.append(getCourseDetailId(),other.getCourseDetailId())
			.isEquals();
		}

}
