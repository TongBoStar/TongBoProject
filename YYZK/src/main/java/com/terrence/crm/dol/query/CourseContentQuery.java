package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class CourseContentQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	private Integer contentType;
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

}
