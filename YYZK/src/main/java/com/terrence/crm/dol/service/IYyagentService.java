package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Yyagent;
import com.terrence.crm.dol.query.YyagentQuery;

public interface IYyagentService {
	public Yyagent getById(Long id) throws ServiceException;
	public void saveOrUpdate(Yyagent entity) throws ServiceException;
	public Long save(Yyagent entity) throws ServiceException;
	public Integer update(Yyagent entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Yyagent> findPage(Page<Yyagent> page, YyagentQuery query) throws ServiceException;
	public Page<Yyagent> findPage(Page<Yyagent> page,String statement, YyagentQuery query) throws ServiceException;
	public List<Yyagent> findList(YyagentQuery query) throws ServiceException;
	public List<Yyagent> findList(YyagentQuery query,Integer pageSize) throws ServiceException;
	public List<Yyagent> findList(YyagentQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Yyagent> findAllList() throws ServiceException;
}
