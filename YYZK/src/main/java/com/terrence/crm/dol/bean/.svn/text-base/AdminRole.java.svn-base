package com.terrence.crm.dol.bean;

import javax.persistence.Entity;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.core.dol.bean.Role;

import com.terrence.crm.dol.base.BaseEntity;

@Entity
public class AdminRole extends BaseEntity implements java.io.Serializable {
	

	
	//columns START
	private java.lang.Long id;
	private java.lang.Long adminId;
	private java.lang.Long roleId;
	//columns END

	public void setAdminId(java.lang.Long value) {
		this.adminId = value;
	}


	public java.lang.Long getAdminId() {
		return this.adminId;
	}
	public void setRoleId(java.lang.Long value) {
		this.roleId = value;
	}
	
	public java.lang.Long getRoleId() {
		return this.roleId;
	}
	
	private Role role;
	
	public void setRole(Role role){
		this.role = role;
	}
	
	public Role getRole() {
		return role;
	}
	
	private Admin admin;
	
	public void setAdmin(Admin admin){
		this.admin = admin;
	}
	
	public Admin getAdmin() {
		return admin;
	}

	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("AdminId",getAdminId())
			.append("RoleId",getRoleId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getAdminId())
			.append(getRoleId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof AdminRole == false) return false;
		if(this == obj) return true;
		AdminRole other = (AdminRole)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getAdminId(),other.getAdminId())
			.append(getRoleId(),other.getRoleId())
			.isEquals();
	}


	public java.lang.Long getId() {
		return id;
	}


	public void setId(java.lang.Long id) {
		this.id = id;
	}
}

