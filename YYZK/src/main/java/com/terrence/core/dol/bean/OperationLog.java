package com.terrence.core.dol.bean;

import java.util.Date;

import com.base.BaseEntity;
import com.terrence.crm.dol.utils.DateUtils;

public class OperationLog extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = -7028447989871027081L;
	
	private Long empId;
	private String empUserName;
	private String moduleName;
	private String ip;
	private String machineName;
	private Date operateDate;
	private String empLoginName;
	private String operateType;
	private String operateDescription;

	public Long getEmpId(){
		return empId;
	}

	public void setEmpId(Long empId){
		this.empId = empId;
	}

	public String getEmpUserName(){
		return empUserName;
	}

	public void setEmpUserName(String empUserName){
		this.empUserName = empUserName;
	}

	public String getModuleName(){
		return moduleName;
	}

	public void setModuleName(String moduleName){
		this.moduleName = moduleName;
	}

	public String getIp(){
		return ip;
	}

	public void setIp(String ip){
		this.ip = ip;
	}

	public String getMachineName(){
		return machineName;
	}

	public void setMachineName(String machineName){
		this.machineName = machineName;
	}
	public String getOperateDateString(){
		return DateUtils.formtDateTime(operateDate, "yyyy-MM-dd HH:mm:ss");
	}
	public Date getOperateDate(){
		return operateDate;
	}

	public void setOperateDate(Date operateDate){
		this.operateDate = operateDate;
	}

	public String getEmpLoginName(){
		return empLoginName;
	}

	public void setEmpLoginName(String empLoginName){
		this.empLoginName = empLoginName;
	}

	public String getOperateType(){
		return operateType;
	}

	public void setOperateType(String operateType){
		this.operateType = operateType;
	}

	public String getOperateDescription(){
		return operateDescription;
	}

	public void setOperateDescription(String operateDescription){
		this.operateDescription = operateDescription;
	}

}