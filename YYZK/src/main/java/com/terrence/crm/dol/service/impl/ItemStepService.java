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
import com.terrence.crm.dol.bean.ItemStep;
import com.terrence.crm.dol.dao.IItemStepDao;
import com.terrence.crm.dol.query.ItemStepQuery;
import com.terrence.crm.dol.service.IItemStepService;
@Service
@Transactional
public class ItemStepService extends BaseService implements IItemStepService {
	@Autowired
	@Qualifier("itemStepDao")
	private IItemStepDao itemStepDao;
	@Override
	public ItemStep getById(Long id) throws ServiceException {
		return itemStepDao.getById(id);
	}
	@Override
	public void saveOrUpdate(ItemStep entity) throws ServiceException {
		itemStepDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(ItemStep entity) throws ServiceException {
		return itemStepDao.save(entity);
	}
	@Override
	public Integer update(ItemStep entity) throws ServiceException {
		return itemStepDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return itemStepDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = itemStepDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<ItemStep> findPage(Page<ItemStep> page, ItemStepQuery query) throws ServiceException{
		return itemStepDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<ItemStep> findPage(Page<ItemStep> page,String statement, ItemStepQuery query) throws ServiceException{
		return itemStepDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<ItemStep> findList(ItemStepQuery query) throws ServiceException{
		return itemStepDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<ItemStep> findList(ItemStepQuery query,Integer pageSize) throws ServiceException{
		return itemStepDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<ItemStep> findList(ItemStepQuery query,String statement,Integer pageSize) throws ServiceException{
		return itemStepDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<ItemStep> findAllList() throws ServiceException{
		return itemStepDao.findAllList();
	}
}
