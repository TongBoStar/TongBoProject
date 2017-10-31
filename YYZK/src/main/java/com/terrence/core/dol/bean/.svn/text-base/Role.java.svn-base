package com.terrence.core.dol.bean;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Id;

import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.bean.AdminRole;

public class Role extends BaseEntity implements java.io.Serializable{

	private static final long serialVersionUID = 1768778731514802367L;

	@Id
	private Long id;
	private Long pId;
	private String pCode;
	private String name;
	private String code;
	private String keywords;
	private List<Role> children;
	private Set adminRoles = new HashSet(0);
	
	
	public void setAdminRoles(Set<AdminRole> adminRole){
		this.adminRoles = adminRole;
	}
	
	public Set<AdminRole> getAdminRoles() {
		return adminRoles;
	}
	
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
	public List<Role> getChildren() {
		return children;
	}
	public void setChildren(List<Role> children) {
		this.children = children;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
}