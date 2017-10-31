package com.terrence.core.dol.dao.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.terrence.core.dol.bean.Menu;
import com.terrence.core.dol.dao.IMenuDao;
import com.terrence.core.dol.query.MenuQuery;
import com.terrence.crm.dol.base.BaseIbatisDao;

@Repository
public class MenuDao extends BaseIbatisDao<Menu, java.lang.Long> implements IMenuDao {

	@Override
	public String getIbatisSqlMapNamespace() {
		// TODO Auto-generated method stub
		return "Menu";
	}

	@Override
	public void saveOrUpdate(Menu entity) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Menu> findShowList(MenuQuery menuQuery) {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList(getIbatisSqlMapNamespace()+".getShowList",menuQuery);
	}

	@Override
	public List<Menu> findByUserId(Long userId) throws DataAccessException {
		// TODO Auto-generated method stub
		return getSqlMapClientTemplate().queryForList(getIbatisSqlMapNamespace()+".findByUserId", userId);
	}

	@Override
	public List<Menu> findmenuList(MenuQuery query) {
		// TODO Auto-generated method stub
		 return getSqlMapClientTemplate().queryForList(getIbatisSqlMapNamespace()+".findmenuList",query);
	}

}
