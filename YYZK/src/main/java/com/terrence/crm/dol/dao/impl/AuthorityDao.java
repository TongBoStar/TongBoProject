/*
 * 
 */
package com.terrence.crm.dol.dao.impl;


import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.bean.Authority;
import com.terrence.crm.dol.dao.IAuthorityDao;

/**
 * 权限数据访问
 * 
 * @version 1.0
 */
@Repository
public class AuthorityDao extends BaseIbatisDao<Authority, java.lang.Long> implements IAuthorityDao {
	
	/* (non-Javadoc)
	 * @see com.disney.dol.base.BaseIbatisDao#getIbatisSqlMapNamespace()
	 */
	public String getIbatisSqlMapNamespace() {
		return "Authority";
	}
	
	/* (non-Javadoc)
	 * @see com.disney.dol.base.IBaseDao#saveOrUpdate(java.lang.Object)
	 */
	public void saveOrUpdate(Authority entity) throws DataAccessException {
		if(entity.getAuthorityId() == null) 
			save(entity);
		else 
			update(entity);
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.dao.IAuthorityDao#findByMultipleRoleId(java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	public List<Authority> findByMultipleRoleId(String ids)
			throws DataAccessException {
		return getSqlMapClientTemplate().queryForList("Authority.findByMultipleRoleId", ids);
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.dao.IAuthorityDao#findByAdminId(java.lang.Long)
	 */
	@SuppressWarnings("unchecked")
	public List<Authority> findByAdminId(Long adminId)
			throws DataAccessException {
		return getSqlMapClientTemplate().queryForList("Authority.findByAdminId", adminId);
	}

	@Override
	public List<Authority> findAllByRoleId(Long roleId) throws DataAccessException {
		return getSqlMapClientTemplate().queryForList("Authority.findAllByRoleId", roleId);
	}

	@Override
	public List<Admin> findAdminsByAuthority(Authority authority) {
		return getSqlMapClientTemplate().queryForList("Authority.findAdminsByAuthority", authority);
	}
	
	
	

}
