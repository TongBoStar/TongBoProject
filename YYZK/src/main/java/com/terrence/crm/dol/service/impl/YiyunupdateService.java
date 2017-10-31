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
import com.terrence.crm.dol.bean.Yiyunupdate;
import com.terrence.crm.dol.dao.IYiyunupdateDao;
import com.terrence.crm.dol.query.YiyunupdateQuery;
import com.terrence.crm.dol.service.IYiyunupdateService;
@Service
@Transactional
public class YiyunupdateService extends BaseService implements IYiyunupdateService {
	@Autowired
	@Qualifier("yiyunupdateDao")
	private IYiyunupdateDao yiyunupdateDao;
	@Override
	public Yiyunupdate getById(Long id) throws ServiceException {
		return yiyunupdateDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Yiyunupdate entity) throws ServiceException {
		yiyunupdateDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Yiyunupdate entity) throws ServiceException {
		return yiyunupdateDao.save(entity);
	}
	@Override
	public Integer update(Yiyunupdate entity) throws ServiceException {
		return yiyunupdateDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return yiyunupdateDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = yiyunupdateDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Yiyunupdate> findPage(Page<Yiyunupdate> page, YiyunupdateQuery query) throws ServiceException{
		return yiyunupdateDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Yiyunupdate> findPage(Page<Yiyunupdate> page,String statement, YiyunupdateQuery query) throws ServiceException{
		return yiyunupdateDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Yiyunupdate> findList(YiyunupdateQuery query) throws ServiceException{
		return yiyunupdateDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Yiyunupdate> findList(YiyunupdateQuery query,Integer pageSize) throws ServiceException{
		return yiyunupdateDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yiyunupdate> findList(YiyunupdateQuery query,String statement,Integer pageSize) throws ServiceException{
		return yiyunupdateDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yiyunupdate> findAllList() throws ServiceException{
		return yiyunupdateDao.findAllList();
	}
	@Override
	public List<Yiyunupdate> findList(String statement,YiyunupdateQuery yiyunupdateQuery) throws ServiceException {
		return yiyunupdateDao.findList(statement, yiyunupdateQuery);
	}
}
