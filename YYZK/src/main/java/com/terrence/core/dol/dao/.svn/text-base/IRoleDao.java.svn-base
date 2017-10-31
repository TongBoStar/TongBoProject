package com.terrence.core.dol.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.terrence.core.dol.bean.Role;
import com.terrence.crm.dol.base.IBaseDao;

public interface IRoleDao extends IBaseDao<Role, java.lang.Long> {

	/**
	 * 根据管理员编号查询管理员角色
	 * @param adminId 管理员编号
	 * @return	角色列表
	 * @throws DataAccessException
	 */
	public List<Role> findListByAdminId(final Long adminId) throws DataAccessException;
	
	/**
	 * 根据管理员编号查询所有角色
	 * @param adminId
	 * @return
	 * @throws ServiceException
	 */
	public List<Role> findAllByAdminId(final Long adminId) throws DataAccessException;
}
