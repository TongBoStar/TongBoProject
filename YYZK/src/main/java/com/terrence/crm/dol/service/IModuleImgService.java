package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.ModuleImg;
import com.terrence.crm.dol.query.ModuleImgQuery;

public interface IModuleImgService {
	public ModuleImg getById(Long id) throws ServiceException;
	public void saveOrUpdate(ModuleImg entity) throws ServiceException;
	public Long save(ModuleImg entity) throws ServiceException;
	public Integer update(ModuleImg entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<ModuleImg> findPage(Page<ModuleImg> page, ModuleImgQuery query) throws ServiceException;
	public Page<ModuleImg> findPage(Page<ModuleImg> page,String statement, ModuleImgQuery query) throws ServiceException;
	public List<ModuleImg> findList(ModuleImgQuery query) throws ServiceException;
	public List<ModuleImg> findList(ModuleImgQuery query,Integer pageSize) throws ServiceException;
	public List<ModuleImg> findList(ModuleImgQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<ModuleImg> findAllList() throws ServiceException;
}
