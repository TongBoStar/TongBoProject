package com.base;

import java.util.Date;

import javax.persistence.Id;

public class BaseEntity implements java.io.Serializable{

	private static final long serialVersionUID = -7011992155712838174L;

	@Id
	private Long id;
	
	private String createUserRealName;
	private Long createUserId;
	private Date createDate;
	
	private String modifyUserRealName;
	private Long modifyUserId;
	private Date modifyDate;
	
	private Long systemId;//系统标识如 北京、常州
	
	public String getCreateUserRealName() {
		return createUserRealName;
	}
	public void setCreateUserRealName(String createUserRealName) {
		this.createUserRealName = createUserRealName;
	}
	public Long getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getModifyUserRealName() {
		return modifyUserRealName;
	}
	public void setModifyUserRealName(String modifyUserRealName) {
		this.modifyUserRealName = modifyUserRealName;
	}
	public Long getModifyUserId() {
		return modifyUserId;
	}
	public void setModifyUserId(Long modifyUserId) {
		this.modifyUserId = modifyUserId;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getSystemId() {
		return systemId;
	}
	public void setSystemId(Long systemId) {
		this.systemId = systemId;
	}
}