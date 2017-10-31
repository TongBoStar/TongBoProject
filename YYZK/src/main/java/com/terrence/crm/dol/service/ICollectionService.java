package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Collection;
import com.terrence.crm.dol.query.CollectionQuery;

public interface ICollectionService {
	public Collection getById(Long id) throws ServiceException;
	public void saveOrUpdate(Collection entity) throws ServiceException;
	public Long save(Collection entity) throws ServiceException;
	public Integer update(Collection entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Collection> findPage(Page<Collection> page, CollectionQuery query) throws ServiceException;
	public Page<Collection> findPage(Page<Collection> page,String statement, CollectionQuery query) throws ServiceException;
	public List<Collection> findList(CollectionQuery query) throws ServiceException;
	public List<Collection> findList(CollectionQuery query,Integer pageSize) throws ServiceException;
	public List<Collection> findList(CollectionQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Collection> findAllList() throws ServiceException;
}
