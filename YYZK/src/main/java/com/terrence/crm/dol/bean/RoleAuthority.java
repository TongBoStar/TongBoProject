package com.terrence.crm.dol.bean;

import javax.persistence.Entity;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

import com.terrence.core.dol.bean.Role;
import com.terrence.crm.dol.base.BaseEntity;

@Entity
public class RoleAuthority extends BaseEntity implements java.io.Serializable {
	

	
	//columns START
	private java.lang.Long id;
	private java.lang.Long roleId;
	private java.lang.Long authorityId;
	//columns END


	public void setId(java.lang.Long value) {
		this.id = value;
	}
	
	public java.lang.Long getId() {
		return this.id;
	}
	public void setRoleId(java.lang.Long value) {
		this.roleId = value;
	}
	
	public java.lang.Long getRoleId() {
		return this.roleId;
	}
	public void setAuthorityId(java.lang.Long value) {
		this.authorityId = value;
	}
	
	public java.lang.Long getAuthorityId() {
		return this.authorityId;
	}
	
	private Authority authority;
	
	public void setAuthority(Authority authority){
		this.authority = authority;
	}
	
	public Authority getAuthority() {
		return authority;
	}
	
	private Role role;
	
	public void setRole(Role role){
		this.role = role;
	}
	
	public Role getRole() {
		return role;
	}

	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("RoleId",getRoleId())
			.append("AuthorityId",getAuthorityId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getRoleId())
			.append(getAuthorityId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof RoleAuthority == false) return false;
		if(this == obj) return true;
		RoleAuthority other = (RoleAuthority)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getRoleId(),other.getRoleId())
			.append(getAuthorityId(),other.getAuthorityId())
			.isEquals();
	}
}

