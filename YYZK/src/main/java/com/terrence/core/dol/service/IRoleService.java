package com.terrence.core.dol.service;

import java.util.List;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.Role;
import com.terrence.core.dol.query.RoleQuery;
import com.terrence.crm.dol.base.core.Page;

public interface IRoleService {

	public Role getById(java.lang.Long id) throws ServiceException;

	public void saveOrUpdate(Role entity) throws ServiceException;

	public java.lang.Long save(Role entity) throws ServiceException;

	public Integer update(Role entity) throws ServiceException;

	public Integer deleteById(java.lang.Long id) throws ServiceException;

	public Page<Role> findPage(Page<Role> page, RoleQuery query)
			throws ServiceException;

	public List<Role> findList(RoleQuery query) throws ServiceException;

	/**
	 * 根据管理员编号查询所有角色和管理员所属角色
	 * 
	 * @param adminId
	 * @return
	 * @throws ServiceException
	 */
	public List<Role> findAllByAdminId(Long adminId) throws ServiceException;
}
