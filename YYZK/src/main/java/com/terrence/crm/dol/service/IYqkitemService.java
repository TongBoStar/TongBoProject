package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Yqkitem;
import com.terrence.crm.dol.query.YqkitemQuery;

public interface IYqkitemService {
	public Yqkitem getById(Long id) throws ServiceException;
	public void saveOrUpdate(Yqkitem entity) throws ServiceException;
	public Long save(Yqkitem entity) throws ServiceException;
	public Integer update(Yqkitem entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Yqkitem> findPage(Page<Yqkitem> page, YqkitemQuery query) throws ServiceException;
	public Page<Yqkitem> findPage(Page<Yqkitem> page,String statement, YqkitemQuery query) throws ServiceException;
	public List<Yqkitem> findList(YqkitemQuery query) throws ServiceException;
	public List<Yqkitem> findList(YqkitemQuery query,Integer pageSize) throws ServiceException;
	public List<Yqkitem> findList(YqkitemQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Yqkitem> findAllList() throws ServiceException;
	public List<Yqkitem> findList(String statement, YqkitemQuery yqkitemQuery) throws ServiceException;
}
