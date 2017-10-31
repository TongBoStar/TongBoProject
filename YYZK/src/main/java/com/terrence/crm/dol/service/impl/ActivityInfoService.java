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
import com.terrence.crm.dol.bean.ActivityInfo;
import com.terrence.crm.dol.dao.IActivityInfoDao;
import com.terrence.crm.dol.query.ActivityInfoQuery;
import com.terrence.crm.dol.service.IActivityInfoService;
@Service
@Transactional
public class ActivityInfoService extends BaseService implements IActivityInfoService {
	@Autowired
	@Qualifier("activityInfoDao")
	private IActivityInfoDao activityInfoDao;
	@Override
	public ActivityInfo getById(Long id) throws ServiceException {
		return activityInfoDao.getById(id);
	}
	@Override
	public void saveOrUpdate(ActivityInfo entity) throws ServiceException {
		activityInfoDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(ActivityInfo entity) throws ServiceException {
		return activityInfoDao.save(entity);
	}
	@Override
	public Integer update(ActivityInfo entity) throws ServiceException {
		return activityInfoDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return activityInfoDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = activityInfoDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<ActivityInfo> findPage(Page<ActivityInfo> page, ActivityInfoQuery query) throws ServiceException{
		return activityInfoDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<ActivityInfo> findPage(Page<ActivityInfo> page,String statement, ActivityInfoQuery query) throws ServiceException{
		return activityInfoDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<ActivityInfo> findList(ActivityInfoQuery query) throws ServiceException{
		return activityInfoDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<ActivityInfo> findList(ActivityInfoQuery query,Integer pageSize) throws ServiceException{
		return activityInfoDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<ActivityInfo> findList(ActivityInfoQuery query,String statement,Integer pageSize) throws ServiceException{
		return activityInfoDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<ActivityInfo> findAllList() throws ServiceException{
		return activityInfoDao.findAllList();
	}
}
