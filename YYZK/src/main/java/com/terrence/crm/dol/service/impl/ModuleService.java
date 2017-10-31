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
import com.terrence.crm.dol.bean.Module;
import com.terrence.crm.dol.dao.IModuleDao;
import com.terrence.crm.dol.query.ModuleQuery;
import com.terrence.crm.dol.service.IModuleService;
@Service
@Transactional
public class ModuleService extends BaseService implements IModuleService {
	@Autowired
	@Qualifier("moduleDao")
	private IModuleDao moduleDao;
	@Override
	public Module getById(Long id) throws ServiceException {
		return moduleDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Module entity) throws ServiceException {
		moduleDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Module entity) throws ServiceException {
		return moduleDao.save(entity);
	}
	@Override
	public Integer update(Module entity) throws ServiceException {
		return moduleDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return moduleDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = moduleDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Module> findPage(Page<Module> page, ModuleQuery query) throws ServiceException{
		return moduleDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Module> findPage(Page<Module> page,String statement, ModuleQuery query) throws ServiceException{
		return moduleDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Module> findList(ModuleQuery query) throws ServiceException{
		return moduleDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Module> findList(ModuleQuery query,Integer pageSize) throws ServiceException{
		return moduleDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Module> findList(ModuleQuery query,String statement,Integer pageSize) throws ServiceException{
		return moduleDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Module> findAllList() throws ServiceException{
		return moduleDao.findAllList();
	}
}
