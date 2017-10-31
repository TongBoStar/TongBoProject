package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.StWx;
import com.terrence.crm.dol.query.StWxQuery;

public interface IStWxService {
	public StWx getById(Long id) throws ServiceException;
	public void saveOrUpdate(StWx entity) throws ServiceException;
	public Long save(StWx entity) throws ServiceException;
	public Integer update(StWx entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<StWx> findPage(Page<StWx> page, StWxQuery query) throws ServiceException;
	public Page<StWx> findPage(Page<StWx> page,String statement, StWxQuery query) throws ServiceException;
	public List<StWx> findList(StWxQuery query) throws ServiceException;
	public List<StWx> findList(StWxQuery query,Integer pageSize) throws ServiceException;
	public List<StWx> findList(StWxQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<StWx> findAllList() throws ServiceException;
	public void deleteById(String statement, StWxQuery stWxQuery);
}
