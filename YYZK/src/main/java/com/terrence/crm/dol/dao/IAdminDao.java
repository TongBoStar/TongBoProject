/*
 * 
 */
package com.terrence.crm.dol.dao;


import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.query.AdminQuery;


/**
 * 管理员基本信息数据访问接口
 * 
 * @version 1.0
 */
public interface IAdminDao extends IBaseDao<Admin, java.lang.Long> {
	public List<Admin> listfindAdmin(AdminQuery adminQuery);
	/**
	 * 通过部门查找用户
	 * @param adminQuery
	 * @return
	 */
	public List<Admin> findListByDepart(AdminQuery adminQuery);
	/**
	 * 根据登录名获得管理员基本信息.
	 *
	 * @param loginName 登录名
	 * @return 管理员基本信息
	 * @throws DataAccessException the data access exception
	 */
	public Admin getByLoginName(final java.lang.String loginName) throws DataAccessException;
	
	/**查询所有用户
	 * */
	public List<HashMap> getallUser();
	/**物料管理，修改中的模糊查询***/
	public List<Admin> findAdminId(AdminQuery adminQuery);

	public Integer updateByMultipleId(String delIds);

	public void findAdminErp();

	public Admin findById(Admin minad);
	public List<Admin> findListAdmin(AdminQuery aq);
	public List<Admin> findAdminSel(AdminQuery adminQuery);
	public List<Admin> findAdminProcurement(AdminQuery adminQuery);
	public Admin findAdminByWxCode(AdminQuery adminQuery) throws ServiceException;
	public Admin findAdminByAdminCode(AdminQuery adminQuery) throws ServiceException;

}
