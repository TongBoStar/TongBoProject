package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.InteractGame;
import com.terrence.crm.dol.query.InteractGameQuery;

public interface IInteractGameService {
	public InteractGame getById(Long id) throws ServiceException;
	public void saveOrUpdate(InteractGame entity) throws ServiceException;
	public Long save(InteractGame entity) throws ServiceException;
	public Integer update(InteractGame entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<InteractGame> findPage(Page<InteractGame> page, InteractGameQuery query) throws ServiceException;
	public Page<InteractGame> findPage(Page<InteractGame> page,String statement, InteractGameQuery query) throws ServiceException;
	public List<InteractGame> findList(InteractGameQuery query) throws ServiceException;
	public List<InteractGame> findList(InteractGameQuery query,Integer pageSize) throws ServiceException;
	public List<InteractGame> findList(InteractGameQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<InteractGame> findAllList() throws ServiceException;
	public List<InteractGame> findList(String statement,InteractGameQuery interactGameQuery) throws ServiceException;
}
