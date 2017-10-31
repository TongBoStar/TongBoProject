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
import com.terrence.crm.dol.bean.Yybom;
import com.terrence.crm.dol.dao.IYybomDao;
import com.terrence.crm.dol.query.YybomQuery;
import com.terrence.crm.dol.service.IYybomService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class YybomService extends BaseService implements IYybomService {
	@Autowired
	@Qualifier("yybomDao")
	private IYybomDao yybomDao;
	@Override
	public Yybom getById(Long id) throws ServiceException {
		return yybomDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Yybom entity) throws ServiceException {
		entity.setCreateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
		entity.setCreateUserId(SpringSecurityUtils.getCurrentUserId());
		yybomDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Yybom entity) throws ServiceException {
		return yybomDao.save(entity);
	}
	@Override
	public Integer update(Yybom entity) throws ServiceException {
		return yybomDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return yybomDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = yybomDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Yybom> findPage(Page<Yybom> page, YybomQuery query) throws ServiceException{
		return yybomDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Yybom> findPage(Page<Yybom> page,String statement, YybomQuery query) throws ServiceException{
		return yybomDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Yybom> findList(YybomQuery query) throws ServiceException{
		return yybomDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Yybom> findList(YybomQuery query,Integer pageSize) throws ServiceException{
		return yybomDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yybom> findList(YybomQuery query,String statement,Integer pageSize) throws ServiceException{
		return yybomDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yybom> findAllList() throws ServiceException{
		return yybomDao.findAllList();
	}
	@Override
	public List<Yybom> findList(String statement, YybomQuery yybomQuery) {
		return yybomDao.findList(statement, yybomQuery);
	}
}
