package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Turingtest;
import com.terrence.crm.dol.query.TuringtestQuery;

public interface ITuringtestService {
	public Turingtest getById(Long id) throws ServiceException;
	public void saveOrUpdate(Turingtest entity) throws ServiceException;
	public Long save(Turingtest entity) throws ServiceException;
	public Integer update(Turingtest entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Turingtest> findPage(Page<Turingtest> page, TuringtestQuery query) throws ServiceException;
	public Page<Turingtest> findPage(Page<Turingtest> page,String statement, TuringtestQuery query) throws ServiceException;
	public List<Turingtest> findList(TuringtestQuery query) throws ServiceException;
	public List<Turingtest> findList(TuringtestQuery query,Integer pageSize) throws ServiceException;
	public List<Turingtest> findList(TuringtestQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Turingtest> findAllList() throws ServiceException;
	public void testTuring() throws ServiceException;
}
