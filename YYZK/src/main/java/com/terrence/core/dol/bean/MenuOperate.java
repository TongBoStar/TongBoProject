package com.terrence.core.dol.bean;

import javax.persistence.Id;

import com.base.BaseEntity;

public class MenuOperate extends BaseEntity implements java.io.Serializable {

	private static final long serialVersionUID = 6793197638523570806L;
	
	@Id
	private Long id;
	private Long menuId;
	private String name;
	private String functionName;
	private String iconCls;
	private String remark;
	private String keywords;

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

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
}
