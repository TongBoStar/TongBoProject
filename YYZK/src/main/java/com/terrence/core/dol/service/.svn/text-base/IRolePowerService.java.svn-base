package com.terrence.core.dol.service;

import java.util.List;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.RolePower;
import com.terrence.core.dol.query.RolePowerQuery;
import com.terrence.crm.dol.base.core.Page;

public interface IRolePowerService {

	public RolePower getById(java.lang.Long id) throws ServiceException;
	
	public void saveOrUpdate(RolePower entity) throws ServiceException;
	
	public java.lang.Long save(RolePower entity) throws ServiceException;
	
	public Integer update(RolePower entity) throws ServiceException;
	
	public Integer deleteById(java.lang.Long id) throws ServiceException;
	
	public Page<RolePower> findPage(Page<RolePower> page, RolePowerQuery query) throws ServiceException;
	
	public List<RolePower> findList(RolePowerQuery query) throws ServiceException;
	
	public void deleteByRoleId(Long roleId) throws ServiceException;

	public void save(RolePower rolePower,String[] rolePowerArray) throws Exception;
}
