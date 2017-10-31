package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.ItemImgs;
import com.terrence.crm.dol.query.ItemImgsQuery;

public interface IItemImgsService {
	public ItemImgs getById(Long id) throws ServiceException;
	public void saveOrUpdate(ItemImgs entity) throws ServiceException;
	public Long save(ItemImgs entity) throws ServiceException;
	public Integer update(ItemImgs entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<ItemImgs> findPage(Page<ItemImgs> page, ItemImgsQuery query) throws ServiceException;
	public Page<ItemImgs> findPage(Page<ItemImgs> page,String statement, ItemImgsQuery query) throws ServiceException;
	public List<ItemImgs> findList(ItemImgsQuery query) throws ServiceException;
	public List<ItemImgs> findList(ItemImgsQuery query,Integer pageSize) throws ServiceException;
	public List<ItemImgs> findList(ItemImgsQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<ItemImgs> findAllList() throws ServiceException;
	public void updateIndexImg(ItemImgs itemImgs) throws ServiceException;
}
