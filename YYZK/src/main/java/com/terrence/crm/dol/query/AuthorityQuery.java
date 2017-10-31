/*
 * 
 */
package com.terrence.crm.dol.query;




import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.terrence.crm.dol.base.BaseQuery;

/**
 * 权限查询类
 * @version 1.0
 */
public class AuthorityQuery extends BaseQuery implements Serializable {
    

	/** authorityId */
	private java.lang.Long authorityId;
	/** authorityKey */
	private java.lang.String authorityKey;
	/** authorityName */
	private java.lang.String authorityName;
	/** url */
	private java.lang.String url;
	
	private Integer position;
	
	private java.lang.Long parentid;
	private java.lang.String parentname;
	private java.lang.Integer flevel;
	
	private Long authorityIdGt;

	public java.lang.Long getAuthorityId() {
		return this.authorityId;
	}
	
	public void setAuthorityId(java.lang.Long value) {
		this.authorityId = value;
	}
	
	public java.lang.String getAuthorityKey() {
		return this.authorityKey;
	}
	
	public void setAuthorityKey(java.lang.String value) {
		this.authorityKey = value;
	}
	
	public java.lang.String getAuthorityName() {
		return this.authorityName;
	}
	
	public void setAuthorityName(java.lang.String value) {
		this.authorityName = value;
	}
	
	public java.lang.String getUrl() {
		return this.url;
	}
	
	public void setUrl(java.lang.String value) {
		this.url = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}

	public Long getAuthorityIdGt() {
		return authorityIdGt;
	}

	public void setAuthorityIdGt(Long authorityIdGt) {
		this.authorityIdGt = authorityIdGt;
	}

	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
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

