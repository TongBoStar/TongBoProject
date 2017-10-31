/*
 * 
 */
package com.terrence.crm.dol.service;




import java.util.LinkedHashMap;
import java.util.List;

import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.bean.Authority;
import com.terrence.crm.dol.query.AuthorityQuery;

/**
 * 权限服务访问接口
 * 
 * @version 1.0
 */
public interface IAuthorityService {

	public static String PK = "AUTHORITY_PK_";
	/**
	 * 根据权限编号取出权限
	 *
	 * @param id 权限编号
	 * @return 权限
	 * @throws ServiceException the service exception
	 */
	public Authority getById(java.lang.Long id) throws ServiceException;
	
	/**
	 * 新建或修改权限
	 *
	 * @param entity 权限实体
	 * @throws ServiceException the service exception
	 */
	public void saveOrUpdate(Authority entity) throws ServiceException;
	
	/**
	 * 新建权限
	 *
	 * @param entity 权限实体
	 * @return 权限编号
	 * @throws ServiceException the service exception
	 */
	public java.lang.Long save(Authority entity) throws ServiceException;
	
	/**
	 * 修改权限
	 *
	 * @param entity 权限实体
	 * @return 操作记录数
	 * @throws ServiceException the service exception
	 */
	public Integer update(Authority entity) throws ServiceException;
	
	/**
	 * 根据权限编号删除权限
	 *
	 * @param id 权限编号
	 * @return 操作记录数
	 * @throws ServiceException the service exception
	 */
	public Integer deleteById(java.lang.Long id) throws ServiceException;

	/**
	 * 根据权限编号删除权限
	 *
	 * @param idList 权限编号列表
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
	 * 权限分页查询
	 *
	 * @param page 分页器
	 * @param query 查询条件类
	 * @return 分页器
	 * @throws ServiceException the service exception
	 */
	public Page<Authority> findPage(Page<Authority> page, AuthorityQuery query) throws ServiceException;
	
	/**
	 * 查询权限列表
	 *
	 * @param query 查询条件类
	 * @return 权限列表
	 * @throws ServiceException the service exception
	 */
	public List<Authority> findList(AuthorityQuery query) throws ServiceException;
	
	/**
	 * 查询所有权限列表
	 *
	 * @return 权限列表
	 * @throws ServiceException the service exception
	 */
	public List<Authority> findAllList() throws ServiceException;
	
	/**
	 * 查询所有权限
	 * @return 权限Map，key：权限URL，value：权限标识
	 * @throws ServiceException
	 */
	public LinkedHashMap<String, String> findAllToMap() throws ServiceException;
	
	/**
	 * 根据角色编号查询所有权限和角色所属权限
	 * @param roleId	角色编号
	 * @return
	 * @throws ServiceException
	 */
	public List<Authority> findAllByRoleId(Long roleId) throws ServiceException;

	/**
	 * 权限分页查询
	 *
	 * @param page 分页器
	 * @param query 查询条件类
	 * @return 分页器
	 * @throws ServiceException the service exception
	 */
	public Page<Authority> findPage(String statement, Page<Authority> page,
			AuthorityQuery authorityQuery)throws ServiceException;

	public List<Authority> findlistAll(AuthorityQuery authorityQuery)throws ServiceException;

	public void updateData(Authority entity)throws ServiceException;

	public void saveData(Authority entity)throws ServiceException;

	public List<Admin> findAdminsByAuthority(Authority authority);
	
}
