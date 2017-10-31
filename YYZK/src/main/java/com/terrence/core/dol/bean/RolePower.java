package com.terrence.core.dol.bean;

import javax.persistence.Id;
import com.terrence.crm.dol.base.BaseEntity;

public class RolePower extends BaseEntity implements java.io.Serializable{

   /**
	 * 
	 */
	private static final long serialVersionUID = -534227766066952166L;
	
	@Id
	private Long id;
	private Long roleId;
	private String code;
	private Long authorityId;	//操作和数据权限的时候 还需要另行记录菜单的id
	private Long menuId;		//菜单id

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Long getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(Long authorityId) {
		this.authorityId = authorityId;
	}
	public Long getMenuId() {
		return menuId;
	}
	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}
}
