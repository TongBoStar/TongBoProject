package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Domain;
import com.terrence.crm.dol.query.DomainQuery;

public interface IDomainService {
	public Domain getById(Long id) throws ServiceException;
	public void saveOrUpdate(Domain entity) throws ServiceException;
	public Long save(Domain entity) throws ServiceException;
	public Integer update(Domain entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Domain> findPage(Page<Domain> page, DomainQuery query) throws ServiceException;
	public Page<Domain> findPage(Page<Domain> page,String statement, DomainQuery query) throws ServiceException;
	public List<Domain> findList(DomainQuery query) throws ServiceException;
	public List<Domain> findList(DomainQuery query,Integer pageSize) throws ServiceException;
	public List<Domain> findList(DomainQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Domain> findAllList() throws ServiceException;
}
