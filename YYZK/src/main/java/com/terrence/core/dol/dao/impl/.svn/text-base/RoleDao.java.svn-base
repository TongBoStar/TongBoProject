package com.terrence.core.dol.dao.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.terrence.core.dol.bean.Role;
import com.terrence.core.dol.dao.IRoleDao;
import com.terrence.crm.dol.base.BaseIbatisDao;

@Repository
public class RoleDao extends BaseIbatisDao<Role, java.lang.Long> implements
		IRoleDao {

	@Override
	public String getIbatisSqlMapNamespace() {
		return "Role";
	}

	@Override
	public void saveOrUpdate(Role entity) throws DataAccessException {
		if(entity.getId() == null){
			save(entity);
		}else{
			update(entity);
		}
	}

	@Override
	public List<Role> findListByAdminId(Long adminId) throws DataAccessException {
		return getSqlMapClientTemplate().queryForList(getIbatisSqlMapNamespace()+".findByAdminId", adminId);
	}

	@Override
	public List<Role> findAllByAdminId(Long adminId) throws DataAccessException {
		// TODO Auto-generated method stub
		return getSqlMapClientTemplate().queryForList(getIbatisSqlMapNamespace()+".findAllByAdminId", adminId);
	}

}
