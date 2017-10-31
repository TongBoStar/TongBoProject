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
import com.terrence.crm.dol.bean.Yyinventory;
import com.terrence.crm.dol.dao.IYyinventoryDao;
import com.terrence.crm.dol.query.YyinventoryQuery;
import com.terrence.crm.dol.service.IYyinventoryService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class YyinventoryService extends BaseService implements IYyinventoryService {
	@Autowired
	@Qualifier("yyinventoryDao")
	private IYyinventoryDao yyinventoryDao;
	@Override
	public Yyinventory getById(Long id) throws ServiceException {
		return yyinventoryDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Yyinventory entity) throws ServiceException {
		entity.setCreateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
		entity.setCreateUserId(SpringSecurityUtils.getCurrentUserId());
		yyinventoryDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Yyinventory entity) throws ServiceException {
		return yyinventoryDao.save(entity);
	}
	@Override
	public Integer update(Yyinventory entity) throws ServiceException {
		return yyinventoryDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return yyinventoryDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = yyinventoryDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Yyinventory> findPage(Page<Yyinventory> page, YyinventoryQuery query) throws ServiceException{
		return yyinventoryDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Yyinventory> findPage(Page<Yyinventory> page,String statement, YyinventoryQuery query) throws ServiceException{
		return yyinventoryDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Yyinventory> findList(YyinventoryQuery query) throws ServiceException{
		return yyinventoryDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Yyinventory> findList(YyinventoryQuery query,Integer pageSize) throws ServiceException{
		return yyinventoryDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yyinventory> findList(YyinventoryQuery query,String statement,Integer pageSize) throws ServiceException{
		return yyinventoryDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yyinventory> findAllList() throws ServiceException{
		return yyinventoryDao.findAllList();
	}
}
