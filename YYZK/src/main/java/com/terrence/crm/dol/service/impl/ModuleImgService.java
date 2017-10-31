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
import com.terrence.crm.dol.bean.ModuleImg;
import com.terrence.crm.dol.dao.IModuleImgDao;
import com.terrence.crm.dol.query.ModuleImgQuery;
import com.terrence.crm.dol.service.IModuleImgService;
@Service
@Transactional
public class ModuleImgService extends BaseService implements IModuleImgService {
	@Autowired
	@Qualifier("moduleImgDao")
	private IModuleImgDao moduleImgDao;
	@Override
	public ModuleImg getById(Long id) throws ServiceException {
		return moduleImgDao.getById(id);
	}
	@Override
	public void saveOrUpdate(ModuleImg entity) throws ServiceException {
		moduleImgDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(ModuleImg entity) throws ServiceException {
		return moduleImgDao.save(entity);
	}
	@Override
	public Integer update(ModuleImg entity) throws ServiceException {
		return moduleImgDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return moduleImgDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = moduleImgDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<ModuleImg> findPage(Page<ModuleImg> page, ModuleImgQuery query) throws ServiceException{
		return moduleImgDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<ModuleImg> findPage(Page<ModuleImg> page,String statement, ModuleImgQuery query) throws ServiceException{
		return moduleImgDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<ModuleImg> findList(ModuleImgQuery query) throws ServiceException{
		return moduleImgDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<ModuleImg> findList(ModuleImgQuery query,Integer pageSize) throws ServiceException{
		return moduleImgDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<ModuleImg> findList(ModuleImgQuery query,String statement,Integer pageSize) throws ServiceException{
		return moduleImgDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<ModuleImg> findAllList() throws ServiceException{
		return moduleImgDao.findAllList();
	}
}
