package com.terrence.core.dol.dao.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.terrence.core.dol.bean.MenuOperate;
import com.terrence.core.dol.dao.IMenuOperateDao;
import com.terrence.core.dol.query.MenuOperateQuery;
import com.terrence.crm.dol.base.BaseIbatisDao;

@Repository
public class MenuOperateDao extends BaseIbatisDao<MenuOperate, java.lang.Long>
		implements IMenuOperateDao {

	@Override
	public String getIbatisSqlMapNamespace() {
		return "MenuOperate";
	}

	@Override
	public void saveOrUpdate(MenuOperate entity) throws DataAccessException {

	}
	
	@Override
	public List<MenuOperate> findMenuOperateList(
			MenuOperateQuery menuOperateQuery) {
		return this.getSqlMapClientTemplate().queryForList(getIbatisSqlMapNamespace()+".getMenuOperateList",menuOperateQuery);
	}

	@Override
	public List<MenuOperate> findByUserId(Long userId)
			throws DataAccessException {
		return getSqlMapClientTemplate().queryForList(getIbatisSqlMapNamespace()+".findByUserId", userId);
	}
	
}