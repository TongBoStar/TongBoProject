package com.terrence.core.dol.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.terrence.core.dol.bean.Menu;
import com.terrence.core.dol.query.MenuQuery;
import com.terrence.crm.dol.base.IBaseDao;

public interface IMenuDao extends IBaseDao<Menu, java.lang.Long> {

	public List<Menu> findShowList(MenuQuery menuQuery);
	
	public List<Menu> findByUserId(final Long userId) throws DataAccessException;
	public List<Menu> findmenuList(MenuQuery query);
}
