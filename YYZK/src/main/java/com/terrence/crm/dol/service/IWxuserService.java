package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Wxuser;
import com.terrence.crm.dol.query.WxuserQuery;

public interface IWxuserService {
	public Wxuser getById(Long id) throws ServiceException;
	public void saveOrUpdate(Wxuser entity) throws ServiceException;
	public Long save(Wxuser entity) throws ServiceException;
	public Integer update(Wxuser entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Wxuser> findPage(Page<Wxuser> page, WxuserQuery query) throws ServiceException;
	public Page<Wxuser> findPage(Page<Wxuser> page,String statement, WxuserQuery query) throws ServiceException;
	public List<Wxuser> findList(WxuserQuery query) throws ServiceException;
	public List<Wxuser> findList(WxuserQuery query,Integer pageSize) throws ServiceException;
	public List<Wxuser> findList(WxuserQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Wxuser> findAllList() throws ServiceException;
	public List<Wxuser> findList(String statement,WxuserQuery wxuserQuery) throws ServiceException;
}
