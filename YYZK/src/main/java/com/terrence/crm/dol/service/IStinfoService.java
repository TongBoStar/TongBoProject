package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Stinfo;
import com.terrence.crm.dol.query.StinfoQuery;

public interface IStinfoService {
	public Stinfo getById(Long id) throws ServiceException;
	public void saveOrUpdate(Stinfo entity) throws ServiceException;
	public Long save(Stinfo entity) throws ServiceException;
	public Integer update(Stinfo entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Stinfo> findPage(Page<Stinfo> page, StinfoQuery query) throws ServiceException;
	public Page<Stinfo> findPage(Page<Stinfo> page,String statement, StinfoQuery query) throws ServiceException;
	public List<Stinfo> findList(StinfoQuery query) throws ServiceException;
	public List<Stinfo> findList(StinfoQuery query,Integer pageSize) throws ServiceException;
	public List<Stinfo> findList(StinfoQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Stinfo> findAllList() throws ServiceException;
}
