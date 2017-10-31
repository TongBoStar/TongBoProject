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
import com.terrence.crm.dol.bean.Unityobj;
import com.terrence.crm.dol.dao.IUnityobjDao;
import com.terrence.crm.dol.query.UnityobjQuery;
import com.terrence.crm.dol.service.IUnityobjService;
@Service
@Transactional
public class UnityobjService extends BaseService implements IUnityobjService {
	@Autowired
	@Qualifier("unityobjDao")
	private IUnityobjDao unityobjDao;
	@Override
	public Unityobj getById(Long id) throws ServiceException {
		return unityobjDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Unityobj entity) throws ServiceException {
		unityobjDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Unityobj entity) throws ServiceException {
		return unityobjDao.save(entity);
	}
	@Override
	public Integer update(Unityobj entity) throws ServiceException {
		return unityobjDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return unityobjDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = unityobjDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Unityobj> findPage(Page<Unityobj> page, UnityobjQuery query) throws ServiceException{
		return unityobjDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Unityobj> findPage(Page<Unityobj> page,String statement, UnityobjQuery query) throws ServiceException{
		return unityobjDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Unityobj> findList(UnityobjQuery query) throws ServiceException{
		return unityobjDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Unityobj> findList(UnityobjQuery query,Integer pageSize) throws ServiceException{
		return unityobjDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Unityobj> findList(UnityobjQuery query,String statement,Integer pageSize) throws ServiceException{
		return unityobjDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Unityobj> findAllList() throws ServiceException{
		return unityobjDao.findAllList();
	}
}
