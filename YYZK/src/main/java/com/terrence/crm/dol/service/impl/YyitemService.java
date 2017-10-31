package com.terrence.crm.dol.service.impl;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Yyitem;
import com.terrence.crm.dol.dao.IYyitemDao;
import com.terrence.crm.dol.query.YyitemQuery;
import com.terrence.crm.dol.service.IYyitemService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class YyitemService extends BaseService implements IYyitemService {
	@Autowired
	@Qualifier("yyitemDao")
	private IYyitemDao yyitemDao;
	@Override
	public Yyitem getById(Long id) throws ServiceException {
		return yyitemDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Yyitem entity) throws ServiceException {
		entity.setCreateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
		entity.setCreateUserId(SpringSecurityUtils.getCurrentUserId());
		yyitemDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Yyitem entity) throws ServiceException {
		return yyitemDao.save(entity);
	}
	@Override
	public Integer update(Yyitem entity) throws ServiceException {
		return yyitemDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return yyitemDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = yyitemDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Yyitem> findPage(Page<Yyitem> page, YyitemQuery query) throws ServiceException{
		return yyitemDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Yyitem> findPage(Page<Yyitem> page,String statement, YyitemQuery query) throws ServiceException{
		return yyitemDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Yyitem> findList(YyitemQuery query) throws ServiceException{
		return yyitemDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Yyitem> findList(YyitemQuery query,Integer pageSize) throws ServiceException{
		return yyitemDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yyitem> findList(YyitemQuery query,String statement,Integer pageSize) throws ServiceException{
		return yyitemDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yyitem> findAllList() throws ServiceException{
		return yyitemDao.findAllList();
	}
}
