package com.terrence.crm.dol.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Yyagent;
import com.terrence.crm.dol.dao.IYyagentDao;
import com.terrence.crm.dol.query.YyagentQuery;
import com.terrence.crm.dol.service.IYyagentService;
@Service
@Transactional
public class YyagentService extends BaseService implements IYyagentService {
	@Autowired
	@Qualifier("yyagentDao")
	private IYyagentDao yyagentDao;
	@Override
	public Yyagent getById(Long id) throws ServiceException {
		return yyagentDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Yyagent entity) throws ServiceException {
		yyagentDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Yyagent entity) throws ServiceException {
		return yyagentDao.save(entity);
	}
	@Override
	public Integer update(Yyagent entity) throws ServiceException {
		return yyagentDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return yyagentDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = yyagentDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Yyagent> findPage(Page<Yyagent> page, YyagentQuery query) throws ServiceException{
		return yyagentDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Yyagent> findPage(Page<Yyagent> page,String statement, YyagentQuery query) throws ServiceException{
		return yyagentDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Yyagent> findList(YyagentQuery query) throws ServiceException{
		return yyagentDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Yyagent> findList(YyagentQuery query,Integer pageSize) throws ServiceException{
		return yyagentDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yyagent> findList(YyagentQuery query,String statement,Integer pageSize) throws ServiceException{
		return yyagentDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yyagent> findAllList() throws ServiceException{
		return yyagentDao.findAllList();
	}
}
