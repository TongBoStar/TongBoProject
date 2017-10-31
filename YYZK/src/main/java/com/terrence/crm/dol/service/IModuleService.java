package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Module;
import com.terrence.crm.dol.query.ModuleQuery;

public interface IModuleService {
	public Module getById(Long id) throws ServiceException;
	public void saveOrUpdate(Module entity) throws ServiceException;
	public Long save(Module entity) throws ServiceException;
	public Integer update(Module entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Module> findPage(Page<Module> page, ModuleQuery query) throws ServiceException;
	public Page<Module> findPage(Page<Module> page,String statement, ModuleQuery query) throws ServiceException;
	public List<Module> findList(ModuleQuery query) throws ServiceException;
	public List<Module> findList(ModuleQuery query,Integer pageSize) throws ServiceException;
	public List<Module> findList(ModuleQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Module> findAllList() throws ServiceException;
}
