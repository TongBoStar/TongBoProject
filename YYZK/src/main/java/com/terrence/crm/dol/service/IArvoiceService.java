package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Arvoice;
import com.terrence.crm.dol.query.ArvoiceQuery;

public interface IArvoiceService {
	public Arvoice getById(Long id) throws ServiceException;
	public void saveOrUpdate(Arvoice entity) throws ServiceException;
	public Long save(Arvoice entity) throws ServiceException;
	public Integer update(Arvoice entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Arvoice> findPage(Page<Arvoice> page, ArvoiceQuery query) throws ServiceException;
	public Page<Arvoice> findPage(Page<Arvoice> page,String statement, ArvoiceQuery query) throws ServiceException;
	public List<Arvoice> findList(ArvoiceQuery query) throws ServiceException;
	public List<Arvoice> findList(ArvoiceQuery query,Integer pageSize) throws ServiceException;
	public List<Arvoice> findList(ArvoiceQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Arvoice> findAllList() throws ServiceException;
	public List<Arvoice> findList(String statement, ArvoiceQuery arvoiceQuery) throws ServiceException;
}
