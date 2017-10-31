package com.terrence.crm.dol.service;
import java.util.List;

import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.AdminRole;
import com.terrence.crm.dol.query.AdminRoleQuery;
public interface IAdminRoleService
{
	public AdminRole getById(java.lang.Long id) throws ServiceException;
	
	public void saveOrUpdate(AdminRole entity) throws ServiceException;
	
	public java.lang.Long save(AdminRole entity) throws ServiceException;
	
	public Integer update(AdminRole entity) throws ServiceException;
	
	public Integer deleteById(java.lang.Long id) throws ServiceException;
	
	public Integer deleteByMultipleId(List<java.lang.Long> idList) throws ServiceException;
	
	public boolean isUnique(String uniquePropertyNames, Object newValue, Object oldValue) throws ServiceException;
	
	public Page<AdminRole> findPage(Page<AdminRole> page, AdminRoleQuery query) throws ServiceException;
	
	public List<AdminRole> findList(AdminRoleQuery query) throws ServiceException;
	
	public List<AdminRole> findAllList() throws ServiceException;
	
	
}