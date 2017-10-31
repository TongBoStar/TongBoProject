package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.InteractGameentry;
import com.terrence.crm.dol.query.InteractGameentryQuery;

public interface IInteractGameentryService {
	public InteractGameentry getById(Long id) throws ServiceException;
	public void saveOrUpdate(InteractGameentry entity) throws ServiceException;
	public Long save(InteractGameentry entity) throws ServiceException;
	public Integer update(InteractGameentry entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<InteractGameentry> findPage(Page<InteractGameentry> page, InteractGameentryQuery query) throws ServiceException;
	public Page<InteractGameentry> findPage(Page<InteractGameentry> page,String statement, InteractGameentryQuery query) throws ServiceException;
	public List<InteractGameentry> findList(InteractGameentryQuery query) throws ServiceException;
	public List<InteractGameentry> findList(InteractGameentryQuery query,Integer pageSize) throws ServiceException;
	public List<InteractGameentry> findList(InteractGameentryQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<InteractGameentry> findAllList() throws ServiceException;
	public List<InteractGameentry> findList(String statement,InteractGameentryQuery interactGameentryQuery) throws ServiceException;
}
