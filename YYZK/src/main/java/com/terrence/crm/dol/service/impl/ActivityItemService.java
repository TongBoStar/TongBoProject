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
import com.terrence.crm.dol.bean.ActivityItem;
import com.terrence.crm.dol.dao.IActivityItemDao;
import com.terrence.crm.dol.query.ActivityItemQuery;
import com.terrence.crm.dol.service.IActivityItemService;
@Service
@Transactional
public class ActivityItemService extends BaseService implements IActivityItemService {
	@Autowired
	@Qualifier("activityItemDao")
	private IActivityItemDao activityItemDao;
	@Override
	public ActivityItem getById(Long id) throws ServiceException {
		return activityItemDao.getById(id);
	}
	@Override
	public void saveOrUpdate(ActivityItem entity) throws ServiceException {
		activityItemDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(ActivityItem entity) throws ServiceException {
		return activityItemDao.save(entity);
	}
	@Override
	public Integer update(ActivityItem entity) throws ServiceException {
		return activityItemDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return activityItemDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = activityItemDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<ActivityItem> findPage(Page<ActivityItem> page, ActivityItemQuery query) throws ServiceException{
		return activityItemDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<ActivityItem> findPage(Page<ActivityItem> page,String statement, ActivityItemQuery query) throws ServiceException{
		return activityItemDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<ActivityItem> findList(ActivityItemQuery query) throws ServiceException{
		return activityItemDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<ActivityItem> findList(ActivityItemQuery query,Integer pageSize) throws ServiceException{
		return activityItemDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<ActivityItem> findList(ActivityItemQuery query,String statement,Integer pageSize) throws ServiceException{
		return activityItemDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<ActivityItem> findAllList() throws ServiceException{
		return activityItemDao.findAllList();
	}
}
