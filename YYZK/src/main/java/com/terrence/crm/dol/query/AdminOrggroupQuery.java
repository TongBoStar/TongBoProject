package com.terrence.crm.dol.query;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.terrence.crm.dol.base.BaseQuery;


public class AdminOrggroupQuery extends BaseQuery implements Serializable {
	

	
	//columns START
	private java.lang.Long id;
	private java.lang.Long groupid;
	private java.lang.Long adminId;
	//columns END
	private String idlist;

		public void setId(java.lang.Long value) {
			this.id = value;
		}
		
		public java.lang.Long getId() {
			return this.id;
		}
		public void setGroupid(java.lang.Long value) {
			this.groupid = value;
		}
		
		public java.lang.Long getGroupid() {
			return this.groupid;
		}
		public void setAdminId(java.lang.Long value) {
			this.adminId = value;
		}
		
		public java.lang.Long getAdminId() {
			return this.adminId;
		}

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}

	public String getIdlist() {
		return idlist;
	}

	public void setIdlist(String idlist) {
		this.idlist = idlist;
	}
}

