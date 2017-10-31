package com.terrence.core.dol.query;

import java.io.Serializable;

import com.terrence.crm.dol.base.BaseQuery;

public class MenuDataQuery extends BaseQuery implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6127059869668932400L;
	private Long id;
	private Long menuId;
	private String name;
	private String sql;
	private String remark;
	private Integer grade;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}
}
