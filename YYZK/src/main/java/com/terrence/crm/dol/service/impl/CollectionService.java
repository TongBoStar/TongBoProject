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
import com.terrence.crm.dol.bean.Collection;
import com.terrence.crm.dol.dao.ICollectionDao;
import com.terrence.crm.dol.query.CollectionQuery;
import com.terrence.crm.dol.service.ICollectionService;
@Service
@Transactional
public class CollectionService extends BaseService implements ICollectionService {
	@Autowired
	@Qualifier("collectionDao")
	private ICollectionDao collectionDao;
	@Override
	public Collection getById(Long id) throws ServiceException {
		return collectionDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Collection entity) throws ServiceException {
		collectionDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Collection entity) throws ServiceException {
		return collectionDao.save(entity);
	}
	@Override
	public Integer update(Collection entity) throws ServiceException {
		return collectionDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return collectionDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = collectionDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Collection> findPage(Page<Collection> page, CollectionQuery query) throws ServiceException{
		return collectionDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Collection> findPage(Page<Collection> page,String statement, CollectionQuery query) throws ServiceException{
		return collectionDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Collection> findList(CollectionQuery query) throws ServiceException{
		return collectionDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Collection> findList(CollectionQuery query,Integer pageSize) throws ServiceException{
		return collectionDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Collection> findList(CollectionQuery query,String statement,Integer pageSize) throws ServiceException{
		return collectionDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Collection> findAllList() throws ServiceException{
		return collectionDao.findAllList();
	}
}
