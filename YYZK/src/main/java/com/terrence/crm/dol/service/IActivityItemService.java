package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.ActivityItem;
import com.terrence.crm.dol.query.ActivityItemQuery;

public interface IActivityItemService {
	public ActivityItem getById(Long id) throws ServiceException;
	public void saveOrUpdate(ActivityItem entity) throws ServiceException;
	public Long save(ActivityItem entity) throws ServiceException;
	public Integer update(ActivityItem entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<ActivityItem> findPage(Page<ActivityItem> page, ActivityItemQuery query) throws ServiceException;
	public Page<ActivityItem> findPage(Page<ActivityItem> page,String statement, ActivityItemQuery query) throws ServiceException;
	public List<ActivityItem> findList(ActivityItemQuery query) throws ServiceException;
	public List<ActivityItem> findList(ActivityItemQuery query,Integer pageSize) throws ServiceException;
	public List<ActivityItem> findList(ActivityItemQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<ActivityItem> findAllList() throws ServiceException;
}
