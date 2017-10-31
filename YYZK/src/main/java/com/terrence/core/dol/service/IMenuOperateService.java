package com.terrence.core.dol.service;

import java.util.List;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.MenuOperate;
import com.terrence.core.dol.query.MenuOperateQuery;
import com.terrence.crm.dol.base.core.Page;

public interface IMenuOperateService {

	public MenuOperate getById(java.lang.Long id) throws ServiceException;

	public void saveOrUpdate(MenuOperate entity) throws ServiceException;

	public java.lang.Long save(MenuOperate entity) throws ServiceException;

	public Integer update(MenuOperate entity) throws ServiceException;

	public Integer deleteById(java.lang.Long id) throws ServiceException;

	public Page<MenuOperate> findPage(Page<MenuOperate> page,
			MenuOperateQuery query) throws ServiceException;

	public List<MenuOperate> findList(MenuOperateQuery query)
			throws ServiceException;

	public List<MenuOperate> findMenuOperateList(
			MenuOperateQuery menuOperateQuery) throws ServiceException;
}
