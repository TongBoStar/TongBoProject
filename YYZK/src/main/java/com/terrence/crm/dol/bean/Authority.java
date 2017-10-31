package com.terrence.crm.dol.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

import com.terrence.crm.dol.base.BaseEntity;

@Entity
public class Authority extends BaseEntity implements java.io.Serializable {
	

	
	//columns START
	private java.lang.Long authorityId;
	private java.lang.String authorityKey;
	private java.lang.String authorityName;
	private java.lang.String url;
	private java.lang.Integer position;
	private java.lang.Long parentid;
	private java.lang.String parentname;
	private java.lang.Integer flevel;
	//columns END
	

	public void setAuthorityId(java.lang.Long value) {
		this.authorityId = value;
	}
	
	public java.lang.Long getAuthorityId() {
		return this.authorityId;
	}
	public void setAuthorityKey(java.lang.String value) {
		this.authorityKey = value;
	}
	
	public java.lang.String getAuthorityKey() {
		return this.authorityKey;
	}
	public void setAuthorityName(java.lang.String value) {
		this.authorityName = value;
	}
	
	public java.lang.String getAuthorityName() {
		return this.authorityName;
	}
	public void setUrl(java.lang.String value) {
		this.url = value;
	}
	
	public java.lang.String getUrl() {
		return this.url;
	}
	public void setPosition(java.lang.Integer value) {
		this.position = value;
	}
	
	public java.lang.Integer getPosition() {
		return this.position;
	}
	
	private Set roleAuthoritys = new HashSet(0);
	public void setRoleAuthoritys(Set<RoleAuthority> roleAuthority){
		this.roleAuthoritys = roleAuthority;
	}
	
	public Set<RoleAuthority> getRoleAuthoritys() {
		return roleAuthoritys;
	}

	public String toString() {
		return new ToStringBuilder(this)
			.append("AuthorityId",getAuthorityId())
			.append("AuthorityKey",getAuthorityKey())
			.append("AuthorityName",getAuthorityName())
			.append("Url",getUrl())
			.append("Position",getPosition())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getAuthorityId())
			.append(getAuthorityKey())
			.append(getAuthorityName())
			.append(getUrl())
			.append(getPosition())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Authority == false) return false;
		if(this == obj) return true;
		Authority other = (Authority)obj;
		return new EqualsBuilder()
			.append(getAuthorityId(),other.getAuthorityId())
			.append(getAuthorityKey(),other.getAuthorityKey())
			.append(getAuthorityName(),other.getAuthorityName())
			.append(getUrl(),other.getUrl())
			.append(getPosition(),other.getPosition())
			.isEquals();
	}

	public java.lang.Long getParentid() {
		return parentid;
	}

	public void setParentid(java.lang.Long parentid) {
		this.parentid = parentid;
	}

	public java.lang.String getParentname() {
		return parentname;
	}

	public void setParentname(java.lang.String parentname) {
		this.parentname = parentname;
	}

	public java.lang.Integer getFlevel() {
		return flevel;
	}

	public void setFlevel(java.lang.Integer flevel) {
		this.flevel = flevel;
	}
}

