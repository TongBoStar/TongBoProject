package com.terrence.core.dol.query;

import java.io.Serializable;

import com.terrence.crm.dol.base.BaseQuery;

public class RoleQuery extends BaseQuery implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -630964300331937177L;
	private Long id;
	private Long pId;
	private String pCode;
	private String name;
	private String code;
	private String keywords;
	private Long empId;// 用户id core_emp_dept 用到
	private Long adminId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Long getEmpId() {
		return empId;
	}

	public void setEmpId(Long empId) {
		this.empId = empId;
	}

	public Long getpId() {
		return pId;
	}

	public void setpId(Long pId) {
		this.pId = pId;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Long getAdminId() {
		return adminId;
	}

	public void setAdminId(Long adminId) {
		this.adminId = adminId;
	}
	
}
