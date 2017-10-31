/*
 * 
 */
package com.terrence.crm.dol.dao;


import java.util.List;

import org.springframework.dao.DataAccessException;

import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.AdminRole;


/**
 * 管理员角色基本信息数据访问接口
 * 
 * @version 1.0
 */
public interface IAdminRoleDao extends IBaseDao<AdminRole, java.lang.Long> {
	
	/**
	 * 根据管理员编号删除管理员角色关系
	 * 
	 * @param adminId 管理员编号
	 * @return 操作记录数
	 * @throws DataAccessException
	 */
	public Integer deleteByAdminId(Long adminId) throws DataAccessException;
	
	/**
	 * 根据管理员编号查询管理员角色关系
	 * 
	 * @param adminId 管理员编号
	 * @return 管理员角色关系列表
	 * @throws DataAccessException
	 */
	public List<AdminRole> findeByAdminId(Long adminId) throws DataAccessException;
	
	/**
	 * 根据角色编号查询管理员角色关系
	 * 
	 * @param roleId 角色编号
	 * @return 管理员角色关系列表
	 * @throws DataAccessException
	 */
	public List<AdminRole> findeByRoleId(Long roleId) throws DataAccessException;
	
	/**
	 * 根据角色编号查询管理员角色关系
	 *
	 * @param roleIds 角色编号字符串以逗号分隔
	 * @return 管理员角色关系列表
	 * @throws DataAccessException the data access exception
	 */
	public List<AdminRole> findByMultipleRoleId(String roleIds) throws DataAccessException;
	
	/**
	 * 根据管理员编号删除管理员角色关系
	 * 
	 * @param adminIds 管理员编号字符串以逗号分隔
	 * @return 操作记录数
	 * @throws DataAccessException
	 */
	public Integer deleteByMultipleAdminId(String adminIds) throws DataAccessException;


}
