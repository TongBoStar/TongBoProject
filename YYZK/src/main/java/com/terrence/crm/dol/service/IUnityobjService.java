package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Unityobj;
import com.terrence.crm.dol.query.UnityobjQuery;

public interface IUnityobjService {
	public Unityobj getById(Long id) throws ServiceException;
	public void saveOrUpdate(Unityobj entity) throws ServiceException;
	public Long save(Unityobj entity) throws ServiceException;
	public Integer update(Unityobj entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Unityobj> findPage(Page<Unityobj> page, UnityobjQuery query) throws ServiceException;
	public Page<Unityobj> findPage(Page<Unityobj> page,String statement, UnityobjQuery query) throws ServiceException;
	public List<Unityobj> findList(UnityobjQuery query) throws ServiceException;
	public List<Unityobj> findList(UnityobjQuery query,Integer pageSize) throws ServiceException;
	public List<Unityobj> findList(UnityobjQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Unityobj> findAllList() throws ServiceException;
}
