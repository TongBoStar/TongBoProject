package com.terrence.crm.dol.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Organization;
import com.terrence.crm.dol.dao.IOrganizationDao;
import com.terrence.crm.dol.query.OrganizationQuery;
import com.terrence.crm.dol.service.IOrganizationService;
@Service
@Transactional
public class OrganizationService extends BaseService implements IOrganizationService {
	@Autowired
	@Qualifier("organizationDao")
	private IOrganizationDao organizationDao;
	@Override
	public Organization getById(Long id) throws ServiceException {
		return organizationDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Organization entity) throws ServiceException {
		organizationDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Organization entity) throws ServiceException {
		return organizationDao.save(entity);
	}
	@Override
	public Integer update(Organization entity) throws ServiceException {
		return organizationDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return organizationDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = organizationDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Organization> findPage(Page<Organization> page, OrganizationQuery query) throws ServiceException{
		return organizationDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Organization> findPage(Page<Organization> page,String statement, OrganizationQuery query) throws ServiceException{
		return organizationDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Organization> findList(OrganizationQuery query) throws ServiceException{
		return organizationDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Organization> findList(OrganizationQuery query,Integer pageSize) throws ServiceException{
		return organizationDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Organization> findList(OrganizationQuery query,String statement,Integer pageSize) throws ServiceException{
		return organizationDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Organization> findAllList() throws ServiceException{
		return organizationDao.findAllList();
	}
}
