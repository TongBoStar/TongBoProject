/*
 * 
 */
package com.terrence.crm.dol.dao.impl;


import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.AdminRole;
import com.terrence.crm.dol.dao.IAdminRoleDao;

/**
 * 管理员角色数据访问
 * 
 * @version 1.0
 */
@Repository
public class AdminRoleDao extends BaseIbatisDao<AdminRole, java.lang.Long> implements IAdminRoleDao {
	
	/* (non-Javadoc)
	 * @see com.disney.dol.base.BaseIbatisDao#getIbatisSqlMapNamespace()
	 */
	public String getIbatisSqlMapNamespace() {
		return "AdminRole";
	}
	
	/* (non-Javadoc)
	 * @see com.disney.dol.base.IBaseDao#saveOrUpdate(java.lang.Object)
	 */
	public void saveOrUpdate(AdminRole entity) throws DataAccessException {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.dao.IAdminRoleDao#deleteByAdminId(java.lang.Long)
	 */
	public Integer deleteByAdminId(Long adminId) throws DataAccessException {
		
		return getSqlMapClientTemplate().delete("AdminRole.deleteMultipleByAdminId", adminId);
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.dao.IAdminRoleDao#findeByAdminId(java.lang.Long)
	 */
	public List<AdminRole> findeByAdminId(Long adminId) throws DataAccessException {
		
		return null;
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.dao.IAdminRoleDao#findeByRoleId(java.lang.Long)
	 */
	public List<AdminRole> findeByRoleId(Long roleId) throws DataAccessException {
		
		return null;
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.dao.IAdminRoleDao#findByMultipleRoleId(java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	public List<AdminRole> findByMultipleRoleId(String roleIds)
			throws DataAccessException {
		return getSqlMapClientTemplate().queryForList("AdminRole.findByRoleId", roleIds);
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.dao.IAdminRoleDao#deleteByMultipleAdminId(java.lang.Long)
	 */
	public Integer deleteByMultipleAdminId(String adminIds)
			throws DataAccessException {
		return getSqlMapClientTemplate().delete("AdminRole.deleteMultipleByAdminId", adminIds);
	}

	
	
	

}
