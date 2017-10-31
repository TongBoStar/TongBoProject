package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Usermark;
import com.terrence.crm.dol.query.UsermarkQuery;

public interface IUsermarkService {
	public Usermark getById(Long id) throws ServiceException;
	public void saveOrUpdate(Usermark entity) throws ServiceException;
	public Long save(Usermark entity) throws ServiceException;
	public Integer update(Usermark entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Usermark> findPage(Page<Usermark> page, UsermarkQuery query) throws ServiceException;
	public Page<Usermark> findPage(Page<Usermark> page,String statement, UsermarkQuery query) throws ServiceException;
	public List<Usermark> findList(UsermarkQuery query) throws ServiceException;
	public List<Usermark> findList(UsermarkQuery query,Integer pageSize) throws ServiceException;
	public List<Usermark> findList(UsermarkQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Usermark> findAllList() throws ServiceException;
	public List<Usermark> findList(String statement, UsermarkQuery usermarkQuery) throws ServiceException;
}
