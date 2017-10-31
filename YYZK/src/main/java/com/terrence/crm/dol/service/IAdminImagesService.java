package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.AdminImages;
import com.terrence.crm.dol.query.AdminImagesQuery;

public interface IAdminImagesService {
	public AdminImages getById(Long id) throws ServiceException;
	public void saveOrUpdate(AdminImages entity) throws ServiceException;
	public Long save(AdminImages entity) throws ServiceException;
	public Integer update(AdminImages entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<AdminImages> findPage(Page<AdminImages> page, AdminImagesQuery query) throws ServiceException;
	public Page<AdminImages> findPage(Page<AdminImages> page,String statement, AdminImagesQuery query) throws ServiceException;
	public List<AdminImages> findList(AdminImagesQuery query) throws ServiceException;
	public List<AdminImages> findList(AdminImagesQuery query,Integer pageSize) throws ServiceException;
	public List<AdminImages> findList(AdminImagesQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<AdminImages> findAllList() throws ServiceException;
}
