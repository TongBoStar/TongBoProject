/*
 * 
 */
package com.terrence.crm.dol.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.dao.IAdminDao;
import com.terrence.crm.dol.query.AdminQuery;

/**
 * 管理员数据访问
 * 
 * @version 1.0
 */
@Repository
public class AdminDao extends BaseIbatisDao<Admin, java.lang.Long> implements IAdminDao {
	
	/* (non-Javadoc)
	 * @see com.disney.dol.base.BaseIbatisDao#getIbatisSqlMapNamespace()
	 */
	public String getIbatisSqlMapNamespace() {
		return "Admin";
	}
	
	/* (non-Javadoc)
	 * @see com.disney.dol.base.IBaseDao#saveOrUpdate(java.lang.Object)
	 */
	public void saveOrUpdate(Admin entity) throws DataAccessException {
		if(entity.getAdminId() == null) 
			save(entity);
		else 
			update(entity);
	}
	
	
	
	/* (non-Javadoc)
	 * @see com.disney.dol.dao.IAdminDao#getByLoginName(java.lang.String)
	 */
	public Admin getByLoginName(java.lang.String loginName) throws DataAccessException {
		return (Admin)getSqlMapClientTemplate().queryForObject("Admin.getByLoginName", loginName);
	}

	public List<HashMap> getallUser(){
	
		return this.getSqlMapClientTemplate().queryForList("getAllUsers");
	}

	@Override
	public List<Admin> findAdminId(AdminQuery adminQuery) {
		return this.getSqlMapClientTemplate().queryForList("Admin.findAdminId",adminQuery);
		
	}
	/**
	 * 通过部门查找用户
	 * @param adminQuery
	 * @return
	 */
	@Override
	public List<Admin> findListByDepart(AdminQuery adminQuery) {
		return (List<Admin>)this.getSqlMapClientTemplate().queryForList("Admin.findListByDepart",adminQuery);
		
	}
	@Override
	public List<Admin> listfindAdmin(AdminQuery adminQuery) {
		return (List<Admin>)this.getSqlMapClientTemplate().queryForList("Admin.listfindAdmin.find",adminQuery);
		
	}
	
	
	
	@Override
	public Integer updateByMultipleId(String delIds) {
		
		return getSqlMapClientTemplate().update("Admin.updateByMultipleId", delIds);
	}

	@Override
	public void findAdminErp() {
		this.getSqlMapClientTemplate().queryForObject("Admin.find.ERP.data.tongbu");
		
	}

	@Override
	public Admin findById(Admin minad) {
		return (Admin) this.getSqlMapClientTemplate().queryForObject("Admin.find.only.entity.data", minad);
	}

	@Override
	public List<Admin> findListAdmin(AdminQuery aq) {
		return this.getSqlMapClientTemplate().queryForList("Admin.find.adList.data.select", aq);
	}

	@Override
	public List<Admin> findAdminSel(AdminQuery adminQuery) {
		return this.getSqlMapClientTemplate().queryForList("Admin.find.admin.select.data", adminQuery);
	}

	@Override
	public List<Admin> findAdminProcurement(AdminQuery adminQuery) {
		return this.getSqlMapClientTemplate().queryForList("Admin.find.procurement.getlist.data", adminQuery);
	}

	@Override
	public Admin findAdminByWxCode(AdminQuery adminQuery) throws ServiceException {
		Map map = new HashMap();
		map.put("wxCode", adminQuery.getWxCode());
		return (Admin)this.getSqlMapClientTemplate().queryForObject("Admin.findByWxCode", map);
	}

	@Override
	public Admin findAdminByAdminCode(AdminQuery adminQuery)
			throws ServiceException {
		Map map = new HashMap();
		map.put("adminCode", adminQuery.getAdminCode());
		return (Admin)this.getSqlMapClientTemplate().queryForObject("Admin.getByAdminCode", map);
	}
}
