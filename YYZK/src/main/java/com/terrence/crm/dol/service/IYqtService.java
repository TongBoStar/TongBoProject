package com.terrence.crm.dol.service;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Yqt;
import com.terrence.crm.dol.query.YqtQuery;

public interface IYqtService {
	public Yqt getById(Long id) throws ServiceException;
	public void saveOrUpdate(Yqt entity) throws ServiceException;
	public Long save(Yqt entity) throws ServiceException;
	public Integer update(Yqt entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Yqt> findPage(Page<Yqt> page, YqtQuery query) throws ServiceException;
	public Page<Yqt> findPage(Page<Yqt> page,String statement, YqtQuery query) throws ServiceException;
	public List<Yqt> findList(YqtQuery query) throws ServiceException;
	public List<Yqt> findList(YqtQuery query,Integer pageSize) throws ServiceException;
	public List<Yqt> findList(YqtQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Yqt> findAllList() throws ServiceException;
	public List<Yqt> findList(String statement, YqtQuery yqtQuery) throws ServiceException;
	public void exportExcell2007(HttpServletResponse response) throws Exception;
}
