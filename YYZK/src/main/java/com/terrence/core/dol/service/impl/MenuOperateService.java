package com.terrence.core.dol.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.MenuOperate;
import com.terrence.core.dol.dao.IMenuOperateDao;
import com.terrence.core.dol.query.MenuOperateQuery;
import com.terrence.core.dol.service.IMenuOperateService;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.core.Page;

@Service
@Transactional
public class MenuOperateService extends BaseService implements
		IMenuOperateService {
	@Autowired
	@Qualifier("menuOperateDao")
	private IMenuOperateDao menuOperateDao;

	@Override
	public Page<MenuOperate> findPage(Page<MenuOperate> page,
			MenuOperateQuery query) throws ServiceException {
		return menuOperateDao.findPage(page, query);
	}

	@Override
	public List<MenuOperate> findList(MenuOperateQuery query)
			throws ServiceException {
		return menuOperateDao.findList(query);
	}

	@Override
	public MenuOperate getById(Long id) throws ServiceException {
		return menuOperateDao.getById(id);
	}

	@Override
	public void saveOrUpdate(MenuOperate entity) throws ServiceException {
		menuOperateDao.saveOrUpdate(entity);
	}

	@Override
	public Long save(MenuOperate entity) throws ServiceException {
		return menuOperateDao.save(entity);
	}

	@Override
	public Integer update(MenuOperate entity) throws ServiceException {
		return menuOperateDao.update(entity);
	}

	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return menuOperateDao.deleteById(id);
	}

	@Override
	public List<MenuOperate> findMenuOperateList(
			MenuOperateQuery menuOperateQuery) throws ServiceException {
		return menuOperateDao.findMenuOperateList(menuOperateQuery);
	}

}
