package com.terrence.crm.dol.query;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.terrence.crm.dol.base.BaseQuery;


public class AdminProcessQuery extends BaseQuery implements Serializable {
	

	
	//columns START
	private java.lang.Long id;
	private java.lang.Long processid;
	private java.lang.Long adminId;
	//columns END
	private java.lang.String adminidlist;
	
	
	

		public java.lang.String getAdminidlist() {
		return adminidlist;
	}

	public void setAdminidlist(java.lang.String adminidlist) {
		this.adminidlist = adminidlist;
	}

		public void setId(java.lang.Long value) {
			this.id = value;
		}
		
		public java.lang.Long getId() {
			return this.id;
		}
		public void setProcessid(java.lang.Long value) {
			this.processid = value;
		}
		
		public java.lang.Long getProcessid() {
			return this.processid;
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
}

