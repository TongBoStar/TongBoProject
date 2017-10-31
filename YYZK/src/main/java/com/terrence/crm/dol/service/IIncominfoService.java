package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Incominfo;
import com.terrence.crm.dol.query.IncominfoQuery;

public interface IIncominfoService {
	public Incominfo getById(Long id) throws ServiceException;
	public void saveOrUpdate(Incominfo entity) throws ServiceException;
	public Long save(Incominfo entity) throws ServiceException;
	public Integer update(Incominfo entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Incominfo> findPage(Page<Incominfo> page, IncominfoQuery query) throws ServiceException;
	public Page<Incominfo> findPage(Page<Incominfo> page,String statement, IncominfoQuery query) throws ServiceException;
	public List<Incominfo> findList(IncominfoQuery query) throws ServiceException;
	public List<Incominfo> findList(IncominfoQuery query,Integer pageSize) throws ServiceException;
	public List<Incominfo> findList(IncominfoQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Incominfo> findAllList() throws ServiceException;
	public void gragOrderInfo() throws ServiceException;
}
