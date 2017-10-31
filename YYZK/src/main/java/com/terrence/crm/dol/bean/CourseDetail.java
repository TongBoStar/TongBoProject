package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class CourseDetail extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 课程名称
	 */
	private String courseDetailName;
	/**
	 * 课程序号
	 */
	private Integer courseDetailNo;
	/**
	 * 课程ID
	 */
	private Integer courseId;
	/**
	 * 课程类型
	 */
	private Integer courseDetailType;
	/**
	 * 课程图标地址
	 */
	private String courseDetailIcon;
	/**
	 * 课程资源地址
	 */
	private String courseDetailRes;
	/**
	 * 课程时长
	 */
	private Integer courseDetailTimes;
	/**
	 * 课时描述
	 */
	private String courseDetailDesc;
	/**
	 * 创建人ID
	 */
	private Long createUserId;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 修改时间
	 */
	private String modifyTime;
	/**
	 * uuid
	 */
	private String uuid;
	/**
	 * vuid
	 */
	private String vuid;
	/**
	 * 课程信息
	 */
	private Course course;
	/**
	 * 互动ID
	 */
	private Long interactId;
	/**
	 * 互动信息
	 */
	private InteractGame interactGame;
	/**
	 * 视频ID号
	 */
	private String videoId;
	/**
	 * 专辑名称
	 */
	private String album;
	/**
	 * 奖励的游戏
	 */
	private String gameaward;
	/**
	 * 奖励玩儿的游戏包名
	 */
	private String gameawardpackage;
	
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getCourseDetailName(){
		return this.courseDetailName;
	}
	public void setCourseDetailName(String courseDetailName){
		this.courseDetailName=courseDetailName;
	}
	public Integer getCourseDetailNo(){
		return this.courseDetailNo;
	}
	public void setCourseDetailNo(Integer courseDetailNo){
		this.courseDetailNo=courseDetailNo;
	}
	public Integer getCourseId(){
		return this.courseId;
	}
	public void setCourseId(Integer courseId){
		this.courseId=courseId;
	}
	public Integer getCourseDetailType(){
		return this.courseDetailType;
	}
	public void setCourseDetailType(Integer courseDetailType){
		this.courseDetailType=courseDetailType;
	}
	public String getCourseDetailIcon(){
		return this.courseDetailIcon;
	}
	public void setCourseDetailIcon(String courseDetailIcon){
		this.courseDetailIcon=courseDetailIcon;
	}
	public Integer getCourseDetailTimes(){
		return this.courseDetailTimes;
	}
	public void setCourseDetailTimes(Integer courseDetailTimes){
		this.courseDetailTimes=courseDetailTimes;
	}
	public String getCourseDetailDesc(){
		return this.courseDetailDesc;
	}
	public void setCourseDetailDesc(String courseDetailDesc){
		this.courseDetailDesc=courseDetailDesc;
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
	public String getModifyTime(){
		return this.modifyTime;
	}
	public void setModifyTime(String modifyTime){
		this.modifyTime=modifyTime;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public String getCourseDetailRes() {
		return courseDetailRes;
	}
	public void setCourseDetailRes(String courseDetailRes) {
		this.courseDetailRes = courseDetailRes;
	}
	public Long getInteractId() {
		return interactId;
	}
	public void setInteractId(Long interactId) {
		this.interactId = interactId;
	}
	public InteractGame getInteractGame() {
		return interactGame;
	}
	public void setInteractGame(InteractGame interactGame) {
		this.interactGame = interactGame;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getVuid() {
		return vuid;
	}
	public void setVuid(String vuid) {
		this.vuid = vuid;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public String getGameaward() {
		return gameaward;
	}
	public void setGameaward(String gameaward) {
		this.gameaward = gameaward;
	}
	public String getGameawardpackage() {
		return gameawardpackage;
	}
	public void setGameawardpackage(String gameawardpackage) {
		this.gameawardpackage = gameawardpackage;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("CourseDetailName",getCourseDetailName())
			.append("CourseDetailNo",getCourseDetailNo())
			.append("CourseId",getCourseId())
			.append("CourseDetailType",getCourseDetailType())
			.append("CourseDetailIcon",getCourseDetailIcon())
			.append("CourseDetailTimes",getCourseDetailTimes())
			.append("CourseDetailDesc",getCourseDetailDesc())
			.append("CreateUserId",getCreateUserId())
			.append("CreateTime",getCreateTime())
			.append("ModifyTime",getModifyTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getCourseDetailName())
			.append(getCourseDetailNo())
			.append(getCourseId())
			.append(getCourseDetailType())
			.append(getCourseDetailIcon())
			.append(getCourseDetailTimes())
			.append(getCourseDetailDesc())
			.append(getCreateUserId())
			.append(getCreateTime())
			.append(getModifyTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof CourseDetail == false) return false;
		if(this == obj) return true;
		CourseDetail other = (CourseDetail)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getCourseDetailName(),other.getCourseDetailName())
			.append(getCourseDetailNo(),other.getCourseDetailNo())
			.append(getCourseId(),other.getCourseId())
			.append(getCourseDetailType(),other.getCourseDetailType())
			.append(getCourseDetailIcon(),other.getCourseDetailIcon())
			.append(getCourseDetailTimes(),other.getCourseDetailTimes())
			.append(getCourseDetailDesc(),other.getCourseDetailDesc())
			.append(getCreateUserId(),other.getCreateUserId())
			.append(getCreateTime(),other.getCreateTime())
			.append(getModifyTime(),other.getModifyTime())
			.isEquals();
		}

}
