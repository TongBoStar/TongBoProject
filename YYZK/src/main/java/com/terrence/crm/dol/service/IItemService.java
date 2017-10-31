package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Item;
import com.terrence.crm.dol.query.ItemQuery;

public interface IItemService {
	public Item getById(Long id) throws ServiceException;
	public void saveOrUpdate(Item entity) throws ServiceException;
	public Long save(Item entity) throws ServiceException;
	public Integer update(Item entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Item> findPage(Page<Item> page, ItemQuery query) throws ServiceException;
	public Page<Item> findPage(Page<Item> page,String statement, ItemQuery query) throws ServiceException;
	public List<Item> findList(ItemQuery query) throws ServiceException;
	public List<Item> findList(ItemQuery query,Integer pageSize) throws ServiceException;
	public List<Item> findList(ItemQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Item> findAllList() throws ServiceException;
}
