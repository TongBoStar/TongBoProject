package com.terrence.crm.dol.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.AdminRole;
import com.terrence.crm.dol.dao.IAdminRoleDao;
import com.terrence.crm.dol.query.AdminRoleQuery;
import com.terrence.crm.dol.service.IAdminRoleService;

@Service
@Transactional
public class AdminRoleService extends BaseService implements IAdminRoleService {
	protected static Logger logger = LoggerFactory.getLogger(AdminRoleService.class);
	@Autowired
	@Qualifier("adminRoleDao")
	private IAdminRoleDao adminRoleDao;
	
	public String getIbatisSqlMapNamespace() {
		return "AdminRole";
	}
	@Transactional(readOnly=true)
	public AdminRole getById(java.lang.Long id) throws ServiceException
	{
		return adminRoleDao.getById(id);
	}
	
	public void saveOrUpdate(AdminRole entity) throws ServiceException
	{
		adminRoleDao.saveOrUpdate(entity);
	}
	
	public java.lang.Long save(AdminRole entity) throws ServiceException
	{
		Long adId = adminRoleDao.save(entity);
		
		return adId;
	}
	
	public Integer update(AdminRole entity) throws ServiceException
	{
		Integer returnValue =  adminRoleDao.update(entity);
		
		return returnValue;
	}
	
	public Integer deleteById(java.lang.Long id) throws ServiceException
	{
		Integer returnValue = adminRoleDao.deleteById(id);		
		return returnValue;
	}
	
	public Integer deleteByMultipleId(List<java.lang.Long> idList) throws ServiceException
	{
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = adminRoleDao.deleteByMultipleId(delIds);
		
		return returnValue;
	}
	
	public boolean isUnique(String uniquePropertyNames, Object newValue, Object oldValue) throws ServiceException
	{
		AdminRoleQuery query = new AdminRoleQuery();
		try {
			return adminRoleDao.isUnique(query, uniquePropertyNames, newValue, oldValue);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new ServiceException(e.getMessage());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new ServiceException(e.getMessage());
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new ServiceException(e.getMessage());
		}
	}
	@Transactional(readOnly=true)
	public Page<AdminRole> findPage(Page<AdminRole> page, AdminRoleQuery query) throws ServiceException
	{
		return adminRoleDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public List<AdminRole> findList(AdminRoleQuery query) throws ServiceException
	{
		return adminRoleDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<AdminRole> findAllList() throws ServiceException
	{
		return adminRoleDao.findAllList();
	}

}