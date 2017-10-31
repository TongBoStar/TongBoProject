package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Stuselog extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 书童依云编号
	 */
	private String stCode;
	/**
	 * 书童序列号
	 */
	private String serialNumber;
	/**
	 * 操作类型
	 */
	private String operateType;
	/**
	 * 操作模块
	 */
	private String operateModule;
	/**
	 * 操作内容
	 */
	private String operateContent;
	private String takeTime;
	private Long takeTimeLong;
	/**
	 * 上传时间
	 */
	private String upLoadTime;
	/**
	 * 操作类型标记
	 */
	private String operateTypeMark;
	/**
	 * 操作模块标记
	 */
	private String operateModuleMark;
	/**
	 * 解析时间
	 */
	private Long parseTimeLong;
	/**
	 * 本记录时长
	 */
	private String sTime;
	/**
	 * 操作时间 小时
	 */
	private Integer takeTimeHour;
	/**
	 * 归属名称
	 */
	private String belongName;
	/**
	 * 类别
	 */
	private String itemType;
	
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getStCode(){
		return this.stCode;
	}
	public void setStCode(String stCode){
		this.stCode=stCode;
	}
	public String getSerialNumber(){
		return this.serialNumber;
	}
	public void setSerialNumber(String serialNumber){
		this.serialNumber=serialNumber;
	}
	public String getOperateType(){
		return this.operateType;
	}
	public void setOperateType(String operateType){
		this.operateType=operateType;
	}
	public String getOperateModule(){
		return this.operateModule;
	}
	public void setOperateModule(String operateModule){
		this.operateModule=operateModule;
	}
	public String getOperateContent(){
		return this.operateContent;
	}
	public void setOperateContent(String operateContent){
		this.operateContent=operateContent;
	}
	public String getTakeTime(){
		return this.takeTime;
	}
	public void setTakeTime(String takeTime){
		this.takeTime=takeTime;
	}
	public Long getTakeTimeLong(){
		return this.takeTimeLong;
	}
	public void setTakeTimeLong(Long takeTimeLong){
		this.takeTimeLong=takeTimeLong;
	}
	public String getUpLoadTime(){
		return this.upLoadTime;
	}
	public void setUpLoadTime(String upLoadTime){
		this.upLoadTime=upLoadTime;
	}
	public String getOperateTypeMark(){
		return this.operateTypeMark;
	}
	public void setOperateTypeMark(String operateTypeMark){
		this.operateTypeMark=operateTypeMark;
	}
	public String getOperateModuleMark(){
		return this.operateModuleMark;
	}
	public void setOperateModuleMark(String operateModuleMark){
		this.operateModuleMark=operateModuleMark;
	}
	public Long getParseTimeLong() {
		return parseTimeLong;
	}
	public void setParseTimeLong(Long parseTimeLong) {
		this.parseTimeLong = parseTimeLong;
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public Integer getTakeTimeHour() {
		return takeTimeHour;
	}
	public void setTakeTimeHour(Integer takeTimeHour) {
		this.takeTimeHour = takeTimeHour;
	}
	public String getBelongName() {
		return belongName;
	}
	public void setBelongName(String belongName) {
		this.belongName = belongName;
	}
	public String getItemType() {
		return itemType;
	}
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("StCode",getStCode())
			.append("SerialNumber",getSerialNumber())
			.append("OperateType",getOperateType())
			.append("OperateModule",getOperateModule())
			.append("OperateContent",getOperateContent())
			.append("TakeTime",getTakeTime())
			.append("TakeTimeLong",getTakeTimeLong())
			.append("UpLoadTime",getUpLoadTime())
			.append("OperateTypeMark",getOperateTypeMark())
			.append("OperateModuleMark",getOperateModuleMark())
			.append("sTime",getsTime())
			.append("parseTimeLong",getParseTimeLong())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getStCode())
			.append(getSerialNumber())
			.append(getOperateType())
			.append(getOperateModule())
			.append(getOperateContent())
			.append(getTakeTime())
			.append(getTakeTimeLong())
			.append(getUpLoadTime())
			.append(getOperateTypeMark())
			.append(getOperateModuleMark())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Stuselog == false) return false;
		if(this == obj) return true;
		Stuselog other = (Stuselog)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getStCode(),other.getStCode())
			.append(getSerialNumber(),other.getSerialNumber())
			.append(getOperateType(),other.getOperateType())
			.append(getOperateModule(),other.getOperateModule())
			.append(getOperateContent(),other.getOperateContent())
			.append(getTakeTime(),other.getTakeTime())
			.append(getTakeTimeLong(),other.getTakeTimeLong())
			.append(getUpLoadTime(),other.getUpLoadTime())
			.append(getOperateTypeMark(),other.getOperateTypeMark())
			.append(getOperateModuleMark(),other.getOperateModuleMark())
			.isEquals();
		}

}
