/*
 * 
 */
package com.terrence.crm.dol.base;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseQuery;






/**
 * 基础数据访问接口
 *
 * @param <E> 基础类
 * @param <PK> 基础类主键
 */
public interface IBaseDao <E,PK extends Serializable>{
	
	/**
	 * 获得基础类的命名空间
	 *
	 * @return the ibatis sql map namespace
	 */
	public String getIbatisSqlMapNamespace();

	/**
	 * 根据主键取出基础类
	 *
	 * @param id 主键
	 * @return 基础类
	 * @throws DataAccessException the data access exception
	 */
	public E getById(PK id) throws DataAccessException;
	/**
	 * 
	 * @param statement
	 * @param id
	 * @return
	 * @throws DataAccessException
	 */
	public E getById(String statement,PK id) throws DataAccessException;
	/**
	 * 按属性列查询
	 * @param statement
	 * @param val
	 * @return
	 * @throws DataAccessException
	 */
	public E getByColumn(String statement,String val) throws DataAccessException;
	/**
	 * 多参数查询
	 * @param statement
	 * @param query
	 * @return
	 * @throws DataAccessException
	 */
	public E getByEntity(String statement,final BaseQuery query)throws DataAccessException;
	/**
	 * 根据主键删除基础类
	 *
	 * @param id 主键
	 * @return 操作记录数
	 * @throws DataAccessException the data access exception
	 */
	public Integer deleteById(PK id) throws DataAccessException;
	/**
	 * 根据多参数删除
	 * @param statement
	 * @param query
	 * @return
	 * @throws DataAccessException
	 */
	public Integer deleteByWhere(String statement,final BaseQuery query) throws DataAccessException;

	/**
	 * 根据主键删除基础类
	 *
	 * @param ids 主键字符串以逗号分隔
	 * @return 操作记录数
	 * @throws DataAccessException the data access exception
	 */
	public Integer deleteByMultipleId(String ids) throws DataAccessException;
	/**
	 * 根据条件删除基础类
	 *
	 * @param ids 主键字符串以逗号分隔
	 * @return 操作记录数
	 * @throws DataAccessException the data access exception
	 */
	public Integer deleteByMultipleId(String statement,String ids) throws DataAccessException;
	/**
	 * 新建基础类
	 *
	 * @param entity 基础类
	 * @return 主键
	 * @throws DataAccessException the data access exception
	 */
	public PK save(final E entity) throws DataAccessException;
	
	/**
	 * 新建基础类
	 *
	 * @param entity 基础类
	 * @param statement
	 * @return 主键
	 * @throws DataAccessException the data access exception
	 */
	public PK save(final E entity,final String statement) throws DataAccessException;
	/**
	 * 修改基础类
	 *
	 * @param entity 基础类
	 * @return 操作记录数
	 * @throws DataAccessException the data access exception
	 */
	public Integer update(final E entity) throws DataAccessException;

	/**
	 * 修改基础类
	 * @param statement
	 * @param entity
	 * @return
	 * @throws DataAccessException
	 */
	public Integer update(final String statement,final E entity) throws DataAccessException;
	/**
	 * 添加或修改基础类
	 *
	 * @param entity 基础类
	 * @throws DataAccessException the data access exception
	 */
	public void saveOrUpdate(final E entity) throws DataAccessException;

	/**
	 * 查询所有基础类列表
	 *
	 * @return the list
	 * @throws DataAccessException the data access exception
	 */
	public List<E> findAllList() throws DataAccessException;
	
	
	
	
	/**
	 * 检测字段内容是否唯一
	 *
	 * @param query 查询类
	 * @param uniquePropertyNames 属性名
	 * @param newValue 新值
	 * @param oldValue 原值
	 * @return true：是唯一 ;false 不是唯一
	 * @throws DataAccessException the data access exception
	 * @throws IllegalAccessException the illegal access exception
	 * @throws InvocationTargetException the invocation target exception
	 */
	public boolean isUnique(final BaseQuery query, final String uniquePropertyNames, final Object newValue, final Object oldValue) throws DataAccessException, IllegalAccessException, InvocationTargetException;
	
	
	public Page<E> findPage(final Page<E> page, final BaseQuery query) throws DataAccessException;
	/**
	 * 分页查询
	 *
	 * @param page 分页器
	 * @param query 查询条件类
	 * @return 分页器
	 * @throws DataAccessException the data access exception
	 */
	public Page<E> findStatisticPage(final Page<E> page, final BaseQuery query) throws DataAccessException;
	/**
	 * 分页查询
	 * @param page
	 * @param statement
	 * @param query
	 * @return
	 * @throws DataAccessException
	 */
	public Page<E> findPage(final Page<E> page, final String statement,final BaseQuery query) throws DataAccessException;
	
	/**
	 * 查询列表
	 *
	 * @param query 查询条件类
	 * @return 基础类列表
	 * @throws DataAccessException the data access exception
	 */
	public List<E> findList(final BaseQuery query) throws DataAccessException;
	/**
	 * 查询列表
	 * @param query 查询条件类
	 * @param pageSize 总数
	 * @return
	 * @throws DataAccessException
	 */
	public List<E> findList(final BaseQuery query,Integer pageSize) throws DataAccessException;
	
	public List<E> findList(final BaseQuery query,String statement,Integer pageSize) throws DataAccessException;
	
	public List<E> findList(String statement,BaseQuery query)throws DataAccessException;
}
