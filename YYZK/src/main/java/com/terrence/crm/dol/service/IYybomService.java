package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Yybom;
import com.terrence.crm.dol.query.YybomQuery;

public interface IYybomService {
	public Yybom getById(Long id) throws ServiceException;
	public void saveOrUpdate(Yybom entity) throws ServiceException;
	public Long save(Yybom entity) throws ServiceException;
	public Integer update(Yybom entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Yybom> findPage(Page<Yybom> page, YybomQuery query) throws ServiceException;
	public Page<Yybom> findPage(Page<Yybom> page,String statement, YybomQuery query) throws ServiceException;
	public List<Yybom> findList(YybomQuery query) throws ServiceException;
	public List<Yybom> findList(YybomQuery query,Integer pageSize) throws ServiceException;
	public List<Yybom> findList(YybomQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Yybom> findAllList() throws ServiceException;
	public List<Yybom> findList(String statement, YybomQuery yybomQuery);
}
