package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Usermark extends BaseEntity implements java.io.Serializable {
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
	 * 使用人
	 */
	private String username;
	/**
	 * 手机号
	 */
	private String telNumber;
	/**
	 * 地址
	 */
	private String faddress;
	/**
	 * 采集时间Long
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTelNumber() {
		return telNumber;
	}
	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}
	public String getFaddress() {
		return faddress;
	}
	public void setFaddress(String faddress) {
		this.faddress = faddress;
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
	public String getAgentName() {
		return agentName;
	}
	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("UpTime",getUpTime())
			.append("OperateType",getOperateType())
			.append("MarkContent",getMarkContent())
			.append("SerialNumber",getSerialNumber())
			.append("Fyear",getFyear())
			.append("Fmonth",getFmonth())
			.append("Fday",getFday())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getUpTime())
			.append(getOperateType())
			.append(getMarkContent())
			.append(getSerialNumber())
			.append(getFyear())
			.append(getFmonth())
			.append(getFday())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Usermark == false) return false;
		if(this == obj) return true;
		Usermark other = (Usermark)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getUpTime(),other.getUpTime())
			.append(getOperateType(),other.getOperateType())
			.append(getMarkContent(),other.getMarkContent())
			.append(getSerialNumber(),other.getSerialNumber())
			.append(getFyear(),other.getFyear())
			.append(getFmonth(),other.getFmonth())
			.append(getFday(),other.getFday())
			.isEquals();
		}

}
