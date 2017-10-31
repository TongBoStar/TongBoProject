package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Yiyunupdate;
import com.terrence.crm.dol.query.YiyunupdateQuery;

public interface IYiyunupdateService {
	public Yiyunupdate getById(Long id) throws ServiceException;
	public void saveOrUpdate(Yiyunupdate entity) throws ServiceException;
	public Long save(Yiyunupdate entity) throws ServiceException;
	public Integer update(Yiyunupdate entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Yiyunupdate> findPage(Page<Yiyunupdate> page, YiyunupdateQuery query) throws ServiceException;
	public Page<Yiyunupdate> findPage(Page<Yiyunupdate> page,String statement, YiyunupdateQuery query) throws ServiceException;
	public List<Yiyunupdate> findList(YiyunupdateQuery query) throws ServiceException;
	public List<Yiyunupdate> findList(YiyunupdateQuery query,Integer pageSize) throws ServiceException;
	public List<Yiyunupdate> findList(YiyunupdateQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Yiyunupdate> findAllList() throws ServiceException;
	public List<Yiyunupdate> findList(String statement,YiyunupdateQuery yiyunupdateQuery) throws ServiceException;
}
