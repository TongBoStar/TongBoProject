package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.ActivityInfo;
import com.terrence.crm.dol.query.ActivityInfoQuery;

public interface IActivityInfoService {
	public ActivityInfo getById(Long id) throws ServiceException;
	public void saveOrUpdate(ActivityInfo entity) throws ServiceException;
	public Long save(ActivityInfo entity) throws ServiceException;
	public Integer update(ActivityInfo entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<ActivityInfo> findPage(Page<ActivityInfo> page, ActivityInfoQuery query) throws ServiceException;
	public Page<ActivityInfo> findPage(Page<ActivityInfo> page,String statement, ActivityInfoQuery query) throws ServiceException;
	public List<ActivityInfo> findList(ActivityInfoQuery query) throws ServiceException;
	public List<ActivityInfo> findList(ActivityInfoQuery query,Integer pageSize) throws ServiceException;
	public List<ActivityInfo> findList(ActivityInfoQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<ActivityInfo> findAllList() throws ServiceException;
}
