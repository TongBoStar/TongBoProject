package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class CourseQuery extends BaseQuery implements java.io.Serializable {
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
	 * 所属领域
	 */
	private Integer domainId;
	/**
	 * 所属领域代码
	 */
	private String domainCode;
	/**
	 * 图片地址
	 */
	private String courseIcon;
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
	 * 起始年龄
	 */
	private Integer startAge;
	/**
	 * 结束年龄
	 */
	private Integer endAge;
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
	public String getDomainCode() {
		return domainCode;
	}
	public void setDomainCode(String domainCode) {
		this.domainCode = domainCode;
	}
	public Integer getCourseseq() {
		return courseseq;
	}
	public void setCourseseq(Integer courseseq) {
		this.courseseq = courseseq;
	}
}
