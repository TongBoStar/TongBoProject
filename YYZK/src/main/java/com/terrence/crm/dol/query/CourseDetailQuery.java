package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class CourseDetailQuery extends BaseQuery implements java.io.Serializable {
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
	 * 互动信息ID
	 */
	private Long interactId;
	/**
	 * uuid
	 */
	private String uuid;
	/**
	 * vuid
	 */
	private String vuid;
	/**
	 * 视频ID号
	 */
	private String videoId;
	/**
	 * 专辑名称
	 */
	private String album;
	/**
	 * 互动答对后奖励玩儿的游戏
	 */
	private String gameaward;
	/**
	 * 互动答对后奖励玩儿的游戏包名
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

}
