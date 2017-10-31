package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.ItemStep;
import com.terrence.crm.dol.query.ItemStepQuery;

public interface IItemStepService {
	public ItemStep getById(Long id) throws ServiceException;
	public void saveOrUpdate(ItemStep entity) throws ServiceException;
	public Long save(ItemStep entity) throws ServiceException;
	public Integer update(ItemStep entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<ItemStep> findPage(Page<ItemStep> page, ItemStepQuery query) throws ServiceException;
	public Page<ItemStep> findPage(Page<ItemStep> page,String statement, ItemStepQuery query) throws ServiceException;
	public List<ItemStep> findList(ItemStepQuery query) throws ServiceException;
	public List<ItemStep> findList(ItemStepQuery query,Integer pageSize) throws ServiceException;
	public List<ItemStep> findList(ItemStepQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<ItemStep> findAllList() throws ServiceException;
}
