package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class UsermarkQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 上传时间
	 */
	private String upTime;
	/**
	 * 操作类型
	 */
	private Integer operateType;
	/**
	 * 记录内容
	 */
	private String markContent;
	/**
	 * 序列号
	 */
	private String serialNumber;
	/**
	 * 依云序列号
	 */
	private String stCode;
	/**
	 * 年份
	 */
	private Integer fyear;
	/**
	 * 月份
	 */
	private Integer fmonth;
	/**
	 * 天
	 */
	private Integer fday;
	/**
	 * 版本号
	 */
	private Float fversion;
	/**
	 * 采集时间
	 */
	private Long takeTime;
	/**
	 * 使用时间Long
	 */
	private Long useTimes;
	/**
	 * 经度
	 */
	private Double longitude;
	/**
	 * 纬度
	 */
	private Double latitude;
	/**
	 * 使用人 仅用于查询
	 */
	private String username;
	/**
	 * 代理商 仅用于查询
	 */
	private String agentName;
	
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getUpTime(){
		return this.upTime;
	}
	public void setUpTime(String upTime){
		this.upTime=upTime;
	}
	public Integer getOperateType(){
		return this.operateType;
	}
	public void setOperateType(Integer operateType){
		this.operateType=operateType;
	}
	public String getMarkContent(){
		return this.markContent;
	}
	public void setMarkContent(String markContent){
		this.markContent=markContent;
	}
	public String getSerialNumber(){
		return this.serialNumber;
	}
	public void setSerialNumber(String serialNumber){
		this.serialNumber=serialNumber;
	}
	public Integer getFyear(){
		return this.fyear;
	}
	public void setFyear(Integer fyear){
		this.fyear=fyear;
	}
	public Integer getFmonth(){
		return this.fmonth;
	}
	public void setFmonth(Integer fmonth){
		this.fmonth=fmonth;
	}
	public Integer getFday(){
		return this.fday;
	}
	public void setFday(Integer fday){
		this.fday=fday;
	}
	public String getStCode() {
		return stCode;
	}
	public void setStCode(String stCode) {
		this.stCode = stCode;
	}
	public Float getFversion() {
		return fversion;
	}
	public void setFversion(Float fversion) {
		this.fversion = fversion;
	}
	public Long getTakeTime() {
		return takeTime;
	}
	public void setTakeTime(Long takeTime) {
		this.takeTime = takeTime;
	}
	public Long getUseTimes() {
		return useTimes;
	}
	public void setUseTimes(Long useTimes) {
		this.useTimes = useTimes;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAgentName() {
		return agentName;
	}
	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}

}
