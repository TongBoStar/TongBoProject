package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Organization;
import com.terrence.crm.dol.query.OrganizationQuery;

public interface IOrganizationService {
	public Organization getById(Long id) throws ServiceException;
	public void saveOrUpdate(Organization entity) throws ServiceException;
	public Long save(Organization entity) throws ServiceException;
	public Integer update(Organization entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Organization> findPage(Page<Organization> page, OrganizationQuery query) throws ServiceException;
	public Page<Organization> findPage(Page<Organization> page,String statement, OrganizationQuery query) throws ServiceException;
	public List<Organization> findList(OrganizationQuery query) throws ServiceException;
	public List<Organization> findList(OrganizationQuery query,Integer pageSize) throws ServiceException;
	public List<Organization> findList(OrganizationQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Organization> findAllList() throws ServiceException;
}
