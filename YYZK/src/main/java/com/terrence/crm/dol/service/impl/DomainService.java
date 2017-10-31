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
import com.terrence.crm.dol.bean.Domain;
import com.terrence.crm.dol.dao.IDomainDao;
import com.terrence.crm.dol.query.DomainQuery;
import com.terrence.crm.dol.service.IDomainService;
@Service
@Transactional
public class DomainService extends BaseService implements IDomainService {
	@Autowired
	@Qualifier("domainDao")
	private IDomainDao domainDao;
	@Override
	public Domain getById(Long id) throws ServiceException {
		return domainDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Domain entity) throws ServiceException {
		domainDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Domain entity) throws ServiceException {
		return domainDao.save(entity);
	}
	@Override
	public Integer update(Domain entity) throws ServiceException {
		return domainDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return domainDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = domainDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Domain> findPage(Page<Domain> page, DomainQuery query) throws ServiceException{
		return domainDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Domain> findPage(Page<Domain> page,String statement, DomainQuery query) throws ServiceException{
		return domainDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Domain> findList(DomainQuery query) throws ServiceException{
		return domainDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Domain> findList(DomainQuery query,Integer pageSize) throws ServiceException{
		return domainDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Domain> findList(DomainQuery query,String statement,Integer pageSize) throws ServiceException{
		return domainDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Domain> findAllList() throws ServiceException{
		return domainDao.findAllList();
	}
}
