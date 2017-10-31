package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Course extends BaseEntity implements java.io.Serializable {
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
	private String courseName;
	/**
	 * 课程序号
	 */
	private Integer courseNo;
	/**
	 * 课程类型
	 */
	private Integer courseType;
	/**
	 * 图片地址
	 */
	private String courseIcon;
	/**
	 * 课程内容图片
	 */
	private String contentImgPath;
	/**
	 * 所属领域ID
	 */
	private Integer domainId;
	/**
	 * 所属领域代码
	 */
	private String domainCode;
	/**
	 * 所属领域名称
	 */
	private String domainName;
	/**
	 * 课程总时长
	 */
	private Integer courseTimes;
	/**
	 * 课程描述
	 */
	private String courseDesc;
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
	 * 起始年龄
	 */
	private Integer startAge;
	/**
	 * 结束年龄
	 */
	private Integer endAge;
	/**
	 * 互动信息ID
	 */
	private Long interactId;
	/**
	 * 互动信息
	 */
	private InteractGame interactGame;
	/**
	 * 课程顺序
	 */
	private Integer courseseq;
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getCourseName(){
		return this.courseName;
	}
	public void setCourseName(String courseName){
		this.courseName=courseName;
	}
	public Integer getCourseNo(){
		return this.courseNo;
	}
	public void setCourseNo(Integer courseNo){
		this.courseNo=courseNo;
	}
	public Integer getCourseType(){
		return this.courseType;
	}
	public void setCourseType(Integer courseType){
		this.courseType=courseType;
	}
	public String getCourseIcon(){
		return this.courseIcon;
	}
	public void setCourseIcon(String courseIcon){
		this.courseIcon=courseIcon;
	}
	public Integer getCourseTimes(){
		return this.courseTimes;
	}
	public void setCourseTimes(Integer courseTimes){
		this.courseTimes=courseTimes;
	}
	public String getCourseDesc(){
		return this.courseDesc;
	}
	public void setCourseDesc(String courseDesc){
		this.courseDesc=courseDesc;
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
	public Integer getStartAge(){
		return this.startAge;
	}
	public void setStartAge(Integer startAge){
		this.startAge=startAge;
	}
	public Integer getEndAge(){
		return this.endAge;
	}
	public void setEndAge(Integer endAge){
		this.endAge=endAge;
	}
	public Integer getDomainId() {
		return domainId;
	}
	public void setDomainId(Integer domainId) {
		this.domainId = domainId;
	}
	public String getDomainName() {
		return domainName;
	}
	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}
	public String getDomainCode() {
		return domainCode;
	}
	public void setDomainCode(String domainCode) {
		this.domainCode = domainCode;
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
	public String getContentImgPath() {
		return contentImgPath;
	}
	public void setContentImgPath(String contentImgPath) {
		this.contentImgPath = contentImgPath;
	}
	public Integer getCourseseq() {
		return courseseq;
	}
	public void setCourseseq(Integer courseseq) {
		this.courseseq = courseseq;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("CourseName",getCourseName())
			.append("CourseNo",getCourseNo())
			.append("CourseType",getCourseType())
			.append("CourseIcon",getCourseIcon())
			.append("CourseTimes",getCourseTimes())
			.append("CourseDesc",getCourseDesc())
			.append("CreateUserId",getCreateUserId())
			.append("CreateTime",getCreateTime())
			.append("ModifyTime",getModifyTime())
			.append("StartAge",getStartAge())
			.append("EndAge",getEndAge())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getCourseName())
			.append(getCourseNo())
			.append(getCourseType())
			.append(getCourseIcon())
			.append(getCourseTimes())
			.append(getCourseDesc())
			.append(getCreateUserId())
			.append(getCreateTime())
			.append(getModifyTime())
			.append(getStartAge())
			.append(getEndAge())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Course == false) return false;
		if(this == obj) return true;
		Course other = (Course)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getCourseName(),other.getCourseName())
			.append(getCourseNo(),other.getCourseNo())
			.append(getCourseType(),other.getCourseType())
			.append(getCourseIcon(),other.getCourseIcon())
			.append(getCourseTimes(),other.getCourseTimes())
			.append(getCourseDesc(),other.getCourseDesc())
			.append(getCreateUserId(),other.getCreateUserId())
			.append(getCreateTime(),other.getCreateTime())
			.append(getModifyTime(),other.getModifyTime())
			.append(getStartAge(),other.getStartAge())
			.append(getEndAge(),other.getEndAge())
			.isEquals();
		}

}
