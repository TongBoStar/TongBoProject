package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Iostore;
import com.terrence.crm.dol.query.IostoreQuery;

public interface IIostoreService {
	public Iostore getById(Long id) throws ServiceException;
	public void saveOrUpdate(Iostore entity) throws ServiceException;
	public Long save(Iostore entity) throws ServiceException;
	public Integer update(Iostore entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Iostore> findPage(Page<Iostore> page, IostoreQuery query) throws ServiceException;
	public Page<Iostore> findPage(Page<Iostore> page,String statement, IostoreQuery query) throws ServiceException;
	public List<Iostore> findList(IostoreQuery query) throws ServiceException;
	public List<Iostore> findList(IostoreQuery query,Integer pageSize) throws ServiceException;
	public List<Iostore> findList(IostoreQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Iostore> findAllList() throws ServiceException;
}
