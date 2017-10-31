/*
 * 
 */
package com.terrence.crm.dol.dao;


import java.util.List;

import org.springframework.dao.DataAccessException;

import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.bean.Authority;


/**
 * 权限基本信息数据访问接口
 * 
 * @version 1.0
 */
public interface IAuthorityDao extends IBaseDao<Authority, java.lang.Long> {
	
	/**
	 * 根据角色编号查询权限列表
	 * @param ids 角色编号字符串以逗号分隔
	 * @return 权限列表
	 * @throws DataAccessException
	 */
	public List<Authority> findByMultipleRoleId(final String ids) throws DataAccessException;
	
	/**
	 * 根据管理员编号查询权限列表
	 * @param ids 管理员编号
	 * @return 权限列表
	 * @throws DataAccessException
	 */
	public List<Authority> findByAdminId(final Long adminId) throws DataAccessException;

	/**
	 * 根据角色编号查询所有权限列表
	 * @param roleId	角色编号
	 * @return	权限列表
	 * @throws DataAccessException
	 */
	public List<Authority> findAllByRoleId(final Long roleId) throws DataAccessException;

	public List<Admin> findAdminsByAuthority(Authority authority);
	
}
