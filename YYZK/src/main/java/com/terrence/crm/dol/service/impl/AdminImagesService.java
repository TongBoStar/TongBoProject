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
import com.terrence.crm.dol.bean.AdminImages;
import com.terrence.crm.dol.dao.IAdminImagesDao;
import com.terrence.crm.dol.query.AdminImagesQuery;
import com.terrence.crm.dol.service.IAdminImagesService;
@Service
@Transactional
public class AdminImagesService extends BaseService implements IAdminImagesService {
	@Autowired
	@Qualifier("adminImagesDao")
	private IAdminImagesDao adminImagesDao;
	@Override
	public AdminImages getById(Long id) throws ServiceException {
		return adminImagesDao.getById(id);
	}
	@Override
	public void saveOrUpdate(AdminImages entity) throws ServiceException {
		adminImagesDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(AdminImages entity) throws ServiceException {
		return adminImagesDao.save(entity);
	}
	@Override
	public Integer update(AdminImages entity) throws ServiceException {
		return adminImagesDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return adminImagesDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = adminImagesDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<AdminImages> findPage(Page<AdminImages> page, AdminImagesQuery query) throws ServiceException{
		return adminImagesDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<AdminImages> findPage(Page<AdminImages> page,String statement, AdminImagesQuery query) throws ServiceException{
		return adminImagesDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<AdminImages> findList(AdminImagesQuery query) throws ServiceException{
		return adminImagesDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<AdminImages> findList(AdminImagesQuery query,Integer pageSize) throws ServiceException{
		return adminImagesDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<AdminImages> findList(AdminImagesQuery query,String statement,Integer pageSize) throws ServiceException{
		return adminImagesDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<AdminImages> findAllList() throws ServiceException{
		return adminImagesDao.findAllList();
	}
}
