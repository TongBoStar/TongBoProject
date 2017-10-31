package com.terrence.core.dol.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.terrence.core.dol.bean.MenuOperate;
import com.terrence.core.dol.query.MenuOperateQuery;
import com.terrence.crm.dol.base.IBaseDao;

public interface IMenuOperateDao extends IBaseDao<MenuOperate, java.lang.Long> {

	public List<MenuOperate> findMenuOperateList(MenuOperateQuery menuOperateQuery);
	
	public List<MenuOperate> findByUserId(final Long userId) throws DataAccessException;

}