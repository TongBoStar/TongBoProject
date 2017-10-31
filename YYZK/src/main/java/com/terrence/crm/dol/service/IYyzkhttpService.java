package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Yyzkhttp;
import com.terrence.crm.dol.query.YyzkhttpQuery;

public interface IYyzkhttpService {
	public Yyzkhttp getById(Long id) throws ServiceException;
	public void saveOrUpdate(Yyzkhttp entity) throws ServiceException;
	public Long save(Yyzkhttp entity) throws ServiceException;
	public Integer update(Yyzkhttp entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Yyzkhttp> findPage(Page<Yyzkhttp> page, YyzkhttpQuery query) throws ServiceException;
	public Page<Yyzkhttp> findPage(Page<Yyzkhttp> page,String statement, YyzkhttpQuery query) throws ServiceException;
	public List<Yyzkhttp> findList(YyzkhttpQuery query) throws ServiceException;
	public List<Yyzkhttp> findList(YyzkhttpQuery query,Integer pageSize) throws ServiceException;
	public List<Yyzkhttp> findList(YyzkhttpQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Yyzkhttp> findAllList() throws ServiceException;
}
