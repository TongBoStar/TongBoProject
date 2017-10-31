/*
 * 
 */
package com.terrence.crm.dol.service;




import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.query.AdminQuery;

/**
 * 管理员服务访问接口
 * 
 * @version 1.0
 */
public interface IAdminService {
	public List<Admin> listfindAdmin(AdminQuery adminQuery) ;
	/**
	 * 通过部门查找用户
	 * @param adminQuery
	 * @return
	 */
	public List<Admin> findListByDepart(AdminQuery query) throws ServiceException ;
	/**
	 * 根据管理员编号取出管理员
	 *
	 * @param id 管理员编号
	 * @return 管理员
	 * @throws ServiceException the service exception
	 */
	public Admin getById(java.lang.Long id) throws ServiceException;
	
	/**
	 * 新建或修改管理员
	 *
	 * @param entity 管理员实体
	 * @throws ServiceException the service exception
	 */
	public void saveOrUpdate(Admin entity) throws ServiceException;
	
	/**
	 * 新建管理员
	 *
	 * @param entity 管理员实体
	 * @return 管理员编号
	 * @throws ServiceException the service exception
	 */
	public java.lang.Long save(Admin entity) throws ServiceException;
	
	/**
	 * 修改管理员
	 *
	 * @param entity 管理员实体
	 * @return 操作记录数
	 * @throws ServiceException the service exception
	 */
	public Integer update(Admin entity) throws ServiceException;
	
	/**
	 * 根据管理员编号删除管理员
	 *
	 * @param id 管理员编号
	 * @return 操作记录数
	 * @throws ServiceException the service exception
	 */
	public Integer deleteById(java.lang.Long id) throws ServiceException;

	/**
	 * 根据管理员编号删除管理员
	 *
	 * @param idList 管理员编号列表
	 * @return 操作记录数
	 * @throws ServiceException the service exception
	 */
	public Integer deleteByMultipleId(List<java.lang.Long> idList) throws ServiceException;

	
	/**
	 * 检测字段内容是否唯一
	 *
	 * @param uniquePropertyNames 唯一的属性名
	 * @param newValue 新值
	 * @param oldValue 原值
	 * @return true：是唯一 ;false 不是唯一
	 * @throws ServiceException the service exception
	 */
	public boolean isUnique(String uniquePropertyNames, Object newValue, Object oldValue) throws ServiceException;
	
	/**
	 * 管理员分页查询
	 *
	 * @param page 分页器
	 * @param query 查询条件类
	 * @return 分页器
	 * @throws ServiceException the service exception
	 */
	public Page<Admin> findPage(Page<Admin> page, AdminQuery query) throws ServiceException;
	
	/**
	 * 查询管理员列表
	 *
	 * @param query 查询条件类
	 * @return 管理员列表
	 * @throws ServiceException the service exception
	 */
	public List<Admin> findList(AdminQuery query) throws ServiceException;
	/**
	 * 
	 * @param query
	 * @param statement
	 * @return
	 * @throws ServiceException
	 */
	public List<Admin> findList(AdminQuery query,String statement) throws ServiceException;
	/**
	 * 查询所有管理员列表
	 *
	 * @return 管理员列表
	 * @throws ServiceException the service exception
	 */
	public List<Admin> findAllList() throws ServiceException;
	//========================================================
	/**
	 * 查询所有管理员列表获得班组名
	 *
	 * @return 管理员列表
	 * @throws ServiceException the service exception
	 */
	public List<HashMap> findAllUser() throws ServiceException;
	//========================================================
	
	/**
	 * 根据登录名获得管理员
	 *
	 * @param loginName 登录名
	 * @return 管理员
	 * @throws ServiceException the service exception
	 */
	public Admin getByLoginName(java.lang.String loginName) throws ServiceException;
	
	/**
	 * 根据登录名获得管理员的信息和该管理员的角色和权限信息
	 * @param loginName 登录名
	 * @return 管理员
	 * @throws ServiceException
	 */
	public Admin getAdminRolesAndAuthorityByLoginName(java.lang.String loginName) throws ServiceException;
	
	/**
	 * 更新管理员登录时间
	 * @param entity 管理员
	 * @return 操作记录数
	 * @throws ServiceException
	 */
	public Integer updateLastTime(Admin entity) throws ServiceException;

	public Integer comparePwd(Admin entity,String pwd)throws ServiceException;
	
	public void updatePwd(Admin entity) throws ServiceException ;
	
	/**物料管理，修改中的模糊查询***/
	public List<Admin> findAdminId(AdminQuery adminQuery);

	public void syncAdminERPData() throws ServiceException;

	public Admin findById(Admin minad)  throws ServiceException;
	public List<Admin> findAdminSel(AdminQuery adminQuery)  throws ServiceException;
	public List<Admin> findAdminProcurement(AdminQuery adminQuery) throws ServiceException;
	public Admin checkAdminByWxCode(AdminQuery adminQuery,HttpServletRequest request) throws Exception;
	public void saveAdmin(Admin entity) throws ServiceException;
	public void examineYunQuUser(Admin entity) throws ServiceException;
	public void wxlogin(AdminQuery adminQuery,HttpServletRequest request) throws ServiceException;
	public Admin findAdminByWxCode(AdminQuery adminQuery) throws ServiceException;
	public void updateAdminByWxcode(Admin entity) throws ServiceException;
	public void updateAgreeByWxcode(AdminQuery adminQuery) throws ServiceException;
	
	
}
