package com.terrence.crm.dol.service;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Yqk;
import com.terrence.crm.dol.query.YqkQuery;

public interface IYqkService {
	public Yqk getById(Long id) throws ServiceException;
	public void saveOrUpdate(Yqk entity) throws ServiceException;
	public Long save(Yqk entity) throws ServiceException;
	public Integer update(Yqk entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Yqk> findPage(Page<Yqk> page, YqkQuery query) throws ServiceException;
	public Page<Yqk> findPage(Page<Yqk> page,String statement, YqkQuery query) throws ServiceException;
	public List<Yqk> findList(YqkQuery query) throws ServiceException;
	public List<Yqk> findList(YqkQuery query,Integer pageSize) throws ServiceException;
	public List<Yqk> findList(YqkQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Yqk> findAllList() throws ServiceException;
	public List<Yqk> listToJs(YqkQuery yqkQuery) throws ServiceException;
	public List<Yqk> findList(String statement, YqkQuery yqkQuery) throws ServiceException;
	public void exportExcell2007(HttpServletResponse response) throws Exception;
}
