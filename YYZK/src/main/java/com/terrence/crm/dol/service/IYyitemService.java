package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Yyitem;
import com.terrence.crm.dol.query.YyitemQuery;

public interface IYyitemService {
	public Yyitem getById(Long id) throws ServiceException;
	public void saveOrUpdate(Yyitem entity) throws ServiceException;
	public Long save(Yyitem entity) throws ServiceException;
	public Integer update(Yyitem entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Yyitem> findPage(Page<Yyitem> page, YyitemQuery query) throws ServiceException;
	public Page<Yyitem> findPage(Page<Yyitem> page,String statement, YyitemQuery query) throws ServiceException;
	public List<Yyitem> findList(YyitemQuery query) throws ServiceException;
	public List<Yyitem> findList(YyitemQuery query,Integer pageSize) throws ServiceException;
	public List<Yyitem> findList(YyitemQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Yyitem> findAllList() throws ServiceException;
}
