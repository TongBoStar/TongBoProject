package com.base;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.util.Assert;

import com.terrence.crm.dol.base.core.Page;


public abstract class BaseIbatisDao<E, PK extends Serializable> extends
		SqlMapClientDaoSupport implements IBaseDao<E, PK> {
	/** The log. */
	protected final Log log = LogFactory.getLog(getClass());

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.disney.dol.base.IBaseDao#getById(java.io.Serializable)
	 */
	@SuppressWarnings("unchecked")
	public E getById(PK primaryKey) {
		E object = (E) getSqlMapClientTemplate().queryForObject(
				getFindByPrimaryKeyStatement(), primaryKey);
		return object;
	}

	@SuppressWarnings("unchecked")
	public E getById(String statement, PK primaryKey) {
		E object = (E) getSqlMapClientTemplate().queryForObject(statement,
				primaryKey);
		return object;
	}

	@SuppressWarnings("unchecked")
	public E getByColumn(String statement, String val) {
		E object = (E) getSqlMapClientTemplate().queryForObject(statement, val);
		return object;
	}

	@SuppressWarnings("unchecked")
	public E getByEntity(String statement, final BaseQuery query) {
		E object = (E) getSqlMapClientTemplate().queryForObject(statement,
				query);
		return object;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.disney.dol.base.IBaseDao#deleteById(java.io.Serializable)
	 */
	public Integer deleteById(PK id) {
		return getSqlMapClientTemplate().delete(getDeleteStatement(), id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.disney.dol.base.IBaseDao#deleteByMultipleId(java.lang.String)
	 */
	public Integer deleteByMultipleId(String ids) throws DataAccessException {
		return getSqlMapClientTemplate().delete(getDeleteMultipleStatement(),
				ids);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.terrence.productschedule.dol.base.IBaseDao#deleteByMultipleId(java
	 * .lang.String, java.lang.String)
	 */
	public Integer deleteByMultipleId(String statement, String ids)
			throws DataAccessException {
		return getSqlMapClientTemplate().delete(statement, ids);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.disney.dol.base.IBaseDao#save(java.lang.Object)
	 */
	@SuppressWarnings("unchecked")
	public PK save(E entity) {
		prepareObjectForSaveOrUpdate(entity);
		return (PK) getSqlMapClientTemplate().insert(getInsertStatement(),
				entity);
	}

	public PK save(E entity, final String statement) {
		prepareObjectForSaveOrUpdate(entity);
		return (PK) getSqlMapClientTemplate().insert(statement, entity);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.disney.dol.base.IBaseDao#update(java.lang.Object)
	 */
	public Integer update(E entity) {
		prepareObjectForSaveOrUpdate(entity);
		return getSqlMapClientTemplate().update(getUpdateStatement(), entity);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.terrence.productschedule.dol.base.IBaseDao#update(java.lang.String,
	 * java.lang.Object)
	 */
	public Integer update(String statement, E entity) {
		prepareObjectForSaveOrUpdate(entity);
		return getSqlMapClientTemplate().update(statement, entity);
	}

	/**
	 * 新建和修改前设置
	 *
	 * @param o
	 *            基础类
	 */
	protected void prepareObjectForSaveOrUpdate(E o) {
	}

	/**
	 * 获取根据主键取出基础类的SQL标识声明
	 *
	 * @return SQL标识声明
	 */
	public String getFindByPrimaryKeyStatement() {
		return getIbatisSqlMapNamespace() + ".getById";
	}

	/**
	 * 获取查询基础类列表的SQL标识声明
	 *
	 * @return SQL标识声明
	 */
	public String getFindListStatement() {
		return getIbatisSqlMapNamespace() + ".findList";
	}

	/**
	 * 获取基础类分页查询的SQL标识声明
	 *
	 * @return SQL标识声明
	 */
	public String getFindPageStatement() {
		return getIbatisSqlMapNamespace() + ".findPage";
	}

	/**
	 * 获取新建基础类的SQL标识声明
	 *
	 * @return SQL标识声明
	 */
	public String getInsertStatement() {
		return getIbatisSqlMapNamespace() + ".insert";
	}

	/**
	 * 获取修改基础类的SQL标识声明
	 *
	 * @return SQL标识声明
	 */
	public String getUpdateStatement() {
		return getIbatisSqlMapNamespace() + ".update";
	}

	/**
	 * 获取删除基础类的SQL标识声明
	 *
	 * @return SQL标识声明
	 */
	public String getDeleteStatement() {
		return getIbatisSqlMapNamespace() + ".delete";
	}

	/**
	 * 获取删除多个基础类的SQL标识声明.
	 *
	 * @return SQL标识声明
	 */
	public String getDeleteMultipleStatement() {
		return getIbatisSqlMapNamespace() + ".deleteMultiple";
	}

	/**
	 * 获取查询基础类数量的SQL标识声明.
	 *
	 * @param statementName
	 *            SQL标识声明
	 * @return the SQL标识声明
	 */
	public String getCountStatementForPaging(String statementName) {
		return statementName + ".count";
	}

	// /**
	// * Page query.
	// *
	// * @param statementName the statement name
	// * @param pageRequest the page request
	// * @return the page
	// */
	// @SuppressWarnings("unchecked")
	// protected Page pageQuery(String statementName, PageRequest pageRequest) {
	// return
	// pageQuery(getSqlMapClientTemplate(),statementName,getCountStatementForPaging(statementName),pageRequest);
	// }
	//
	// /**
	// * Page query.
	// *
	// * @param sqlMapClientTemplate the sql map client template
	// * @param statementName the statement name
	// * @param countStatementName the count statement name
	// * @param pageRequest the page request
	// * @return the page
	// */
	// @SuppressWarnings("unchecked")
	// public static Page pageQuery(SqlMapClientTemplate
	// sqlMapClientTemplate,String statementName,String countStatementName,
	// PageRequest pageRequest) {
	//
	// Number totalCount = (Number)
	// sqlMapClientTemplate.queryForObject(countStatementName,pageRequest);
	// if(totalCount == null || totalCount.longValue() <= 0) {
	// return new Page(pageRequest,0);
	// }
	//
	// Page page = new Page(pageRequest,totalCount.intValue());
	//
	// //其它分页参数,用于不喜欢或是因为兼容性而不使用方言(Dialect)的分页用户使用.
	// 与getSqlMapClientTemplate().queryForList(statementName,
	// parameterObject)配合使用
	// Map otherFilters = new HashMap();
	// otherFilters.put("offset", page.getFirstResult());
	// otherFilters.put("pageSize", page.getPageSize());
	// otherFilters.put("lastRows", page.getFirstResult() + page.getPageSize());
	// otherFilters.put("sortColumns", pageRequest.getSortColumns());
	//
	// //混合两个filters为一个filters,MapAndObject.get()方法将在两个对象取值,Map如果取值为null,则再在Bean中取值
	// Map parameterObject = new MapAndObject(otherFilters,pageRequest);
	// List list = sqlMapClientTemplate.queryForList(statementName,
	// parameterObject,page.getFirstResult(),page.getPageSize());
	// page.setResult(list);
	// return page;
	// }

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.disney.dol.base.IBaseDao#findPage(com.disney.dol.base.core.Page,
	 * java.lang.String, com.disney.dol.base.BaseQuery)
	 */
	@SuppressWarnings("unchecked")
	public Page<E> findPage(final Page<E> page, final BaseQuery query) {
		Assert.notNull(page, "page不能为空");

		if (page.isAutoCount()) {
			Number totalCount = (Number) getSqlMapClientTemplate()
					.queryForObject(
							getCountStatementForPaging(getFindPageStatement()),
							query);
			page.setTotalCount(totalCount.longValue());
		}

		Map otherFilters = new HashMap();
		otherFilters.put("offset", page.getCurrentFirst() - 1);
		otherFilters.put("pageSize", page.getPageSize());
		otherFilters.put("lastRows", page.getCurrentLast());
		if (page.getPageNo() != 1) {
			query.setNotTop("top " + page.getPageSize()
					* (page.getPageNo() - 1));
		}
		StringBuffer sortColumns = new StringBuffer();
		sortColumns.append(" ");
		if (page.isOrderBySetted()) {
			String[] orderByArray = StringUtils.split(page.getOrderBy(), ',');
			String[] orderArray = StringUtils.split(page.getOrder(), ',');
			// Assert.isTrue(orderByArray.length == orderArray.length,
			// "分页多重排序参数中,排序字段与排序方向的个数不相等");

			for (int i = 0; i < orderByArray.length; i++) {
				if (i > 0) {
					sortColumns.append(" , ");
				}
				String orderBy = orderByArray[i];
				if (orderByArray[i].endsWith("Name")) {
					orderBy = " CONVERT( " + orderBy + " using gbk)";
				}
				sortColumns.append(orderBy);
				if (Page.ASC.equals(orderArray[0])) {
					sortColumns.append(" ASC ");
				} else {
					sortColumns.append(" DESC ");
				}
			}
		}
		if (!" ".equals(sortColumns.toString())) {
			query.setSortColumns(sortColumns.toString());
		}

		query.setOffset(page.getCurrentFirst());
		query.setPageSize(page.getPageSize());
		query.setLastRows(page.getCurrentLast());
		// otherFilters.put("sortColumns", sortColumns);

		List result = getSqlMapClientTemplate().queryForList(
				getFindPageStatement(), query,
				(int) page.getCurrentFirst() - 1, page.getPageSize());
		page.setResult(result);
		return page;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.disney.dol.base.IBaseDao#findPage(com.disney.dol.base.core.Page,
	 * java.lang.String, com.disney.dol.base.BaseQuery)
	 */
	public Page<E> findPage(final Page<E> page, final String statement,
			final BaseQuery query) {
		Assert.notNull(page, "page不能为空");

		if (page.isAutoCount()) {
			Number totalCount = (Number) getSqlMapClientTemplate()
					.queryForObject(statement + ".count", query);
			page.setTotalCount(totalCount.longValue());
		}

		Map otherFilters = new HashMap();
		otherFilters.put("offset", page.getCurrentFirst() - 1);
		otherFilters.put("pageSize", page.getPageSize());
		otherFilters.put("lastRows", page.getCurrentLast());
		if (page.getPageNo() != 1) {
			query.setNotTop("top " + page.getPageSize()
					* (page.getPageNo() - 1));
		}
		StringBuffer sortColumns = new StringBuffer();
		sortColumns.append(" ");
		if (page.isOrderBySetted()) {
			String[] orderByArray = StringUtils.split(page.getOrderBy(), ',');
			String[] orderArray = StringUtils.split(page.getOrder(), ',');

			Assert.isTrue(orderByArray.length == orderArray.length,
					"分页多重排序参数中,排序字段与排序方向的个数不相等");

			for (int i = 0; i < orderByArray.length; i++) {
				if (i > 0) {
					sortColumns.append(" , ");
				}
				String orderBy = orderByArray[i];
				if (orderByArray[i].endsWith("Name")) {
					orderBy = " CONVERT( " + orderBy + " using gbk)";
				}
				sortColumns.append(orderBy);
				if (Page.ASC.equals(orderArray[i])) {
					sortColumns.append(" ASC ");
				} else {
					sortColumns.append(" DESC ");
				}
			}
		}
		if (!" ".equals(sortColumns.toString())) {
			query.setSortColumns(sortColumns.toString());
		}

		query.setOffset(page.getCurrentFirst());
		query.setPageSize(page.getPageSize());
		query.setLastRows(page.getCurrentLast());
		// otherFilters.put("sortColumns", sortColumns);

		List result = getSqlMapClientTemplate().queryForList(statement, query,
				(int) page.getCurrentFirst() - 1, page.getPageSize());
		page.setResult(result);
		return page;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.disney.dol.base.IBaseDao#findAllList()
	 */
	@SuppressWarnings("unchecked")
	public List<E> findAllList() throws DataAccessException {
		return getSqlMapClientTemplate().queryForList(getFindListStatement());

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.disney.dol.base.IBaseDao#findList(com.disney.dol.base.BaseQuery)
	 */
	@SuppressWarnings("unchecked")
	public List<E> findList(final BaseQuery query) throws DataAccessException {
		return getSqlMapClientTemplate().queryForList(getFindListStatement(),
				query);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.disney.dol.base.IBaseDao#findList(com.disney.dol.base.BaseQuery,
	 * java.lang.Integer)
	 */
	@SuppressWarnings("unchecked")
	public List<E> findList(final BaseQuery query, Integer pageSize)
			throws DataAccessException {
		return getSqlMapClientTemplate().queryForList(getFindListStatement(),
				query, 0, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<E> findList(final BaseQuery query, String statement,
			Integer pageSize) throws DataAccessException {
		return getSqlMapClientTemplate().queryForList(statement, query, 0,
				pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<E> findList(String statement, BaseQuery query) {
		return this.getSqlMapClientTemplate().queryForList(statement, query);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.disney.dol.base.IBaseDao#isUnique(com.disney.dol.base.BaseQuery,
	 * java.lang.String, java.lang.String, java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	public boolean isUnique(final BaseQuery query,
			final String uniquePropertyNames, final Object newValue,
			final Object oldValue) throws DataAccessException,
			IllegalAccessException, InvocationTargetException {
		if (newValue == null || newValue.equals(oldValue)) {
			return true;
		}
		BeanUtils.copyProperty(query, uniquePropertyNames, newValue);

		List<E> result = getSqlMapClientTemplate().queryForList(
				getFindListStatement(), query);

		return (result == null || result.size() == 0);
	}

	public void findCloumn(String sql) throws Exception {
		DataSource dataSource = this.getSqlMapClient().getDataSource();
		Connection con = dataSource.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			ResultSetMetaData rsMetaData = rs.getMetaData();
			int columnCount = rsMetaData.getColumnCount();
			for (int i = 1; i <= columnCount; i++) {
				logger.info("field Name:" + rsMetaData.getColumnName(i)
						+ " field Type:" + rsMetaData.getColumnTypeName(i)
						+ " size:" + rsMetaData.getColumnDisplaySize(i));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
			con.close();
		}
	}
}
