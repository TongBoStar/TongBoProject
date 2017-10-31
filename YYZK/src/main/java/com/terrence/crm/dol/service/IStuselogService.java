package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Stuselog;
import com.terrence.crm.dol.query.StuselogQuery;

public interface IStuselogService {
	public Stuselog getById(Long id) throws ServiceException;
	public void saveOrUpdate(Stuselog entity) throws ServiceException;
	public Long save(Stuselog entity) throws ServiceException;
	public Integer update(Stuselog entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Stuselog> findPage(Page<Stuselog> page, StuselogQuery query) throws ServiceException;
	public Page<Stuselog> findPage(Page<Stuselog> page,String statement, StuselogQuery query) throws ServiceException;
	public List<Stuselog> findList(StuselogQuery query) throws ServiceException;
	public List<Stuselog> findList(String statement, StuselogQuery query) throws ServiceException;
	public List<Stuselog> findList(StuselogQuery query,Integer pageSize) throws ServiceException;
	public List<Stuselog> findList(StuselogQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Stuselog> findAllList() throws ServiceException;
	public List<Stuselog> parseUserLog(StuselogQuery stuselogQuery) throws ServiceException;
	public Stuselog getByEntity(String statement, StuselogQuery query) throws ServiceException;
}
