package com.terrence.core.dol.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.Role;
import com.terrence.core.dol.dao.IRoleDao;
import com.terrence.core.dol.query.RoleQuery;
import com.terrence.core.dol.service.IRoleService;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.utils.ConfigTerrence;

@Service
@Transactional
public class RoleService extends BaseService implements IRoleService {
	@Autowired
	@Qualifier("roleDao")
	private IRoleDao roleDao;

	@Override
	public Page<Role> findPage(Page<Role> page, RoleQuery query)
			throws ServiceException {
		return roleDao.findPage(page, query);
	}

	@Override
	public List<Role> findList(RoleQuery query) throws ServiceException {
		return roleDao.findList(query);
	}

	@Override
	public Role getById(Long id) throws ServiceException {
		return roleDao.getById(id);
	}

	@Override
	public void saveOrUpdate(Role entity) throws ServiceException {
			Long id=null;
			if(entity.getId()!=null){
				id=entity.getId();
			}
		roleDao.saveOrUpdate(entity);
		if(id==null){	
			operationLogDao.save(ConfigTerrence.MODEL_ROLE_MANAGE,ConfigTerrence.OPT_ADD, "添加角色管理角色名称:"+entity.getName()+"");
		}else{
			operationLogDao.save(ConfigTerrence.MODEL_ROLE_MANAGE,ConfigTerrence.OPT_EDIT, "修改角色管理主键ID:"+id+"");
		}
	}

	@Override
	public Long save(Role entity) throws ServiceException {
		return roleDao.save(entity);
	}

	@Override
	public Integer update(Role entity) throws ServiceException {
		return roleDao.update(entity);
	}

	@Override
	public Integer deleteById(Long id) throws ServiceException {
		operationLogDao.save(ConfigTerrence.MODEL_ROLE_MANAGE,ConfigTerrence.OPT_DEL, "删除角色管理主键ID:"+id+"");
		return roleDao.deleteById(id);
	}

	@Override
	public List<Role> findAllByAdminId(Long adminId) throws ServiceException {
		return roleDao.findAllByAdminId(adminId);
	}

}
