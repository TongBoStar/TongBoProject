package com.terrence.core.dol.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.MenuData;
import com.terrence.core.dol.dao.IMenuDataDao;
import com.terrence.core.dol.query.MenuDataQuery;
import com.terrence.core.dol.service.IMenuDataService;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.core.Page;

@Service
@Transactional
public class MenuDataService extends BaseService implements IMenuDataService {
   @Autowired
   @Qualifier("menuDataDao")
   private IMenuDataDao menuDataDao;

   @Override
   public Page<MenuData> findPage(Page<MenuData> page,MenuDataQuery query) throws ServiceException {
       return menuDataDao.findPage(page, query);
   }

   @Override
   public List<MenuData> findList(MenuDataQuery query) throws ServiceException {
	    return menuDataDao.findAllList();
   }

   @Override
   public MenuData getById(Long id) throws ServiceException {
	    return menuDataDao.getById(id);
   }

   @Override
   public void saveOrUpdate(MenuData entity) throws ServiceException {
	    menuDataDao.saveOrUpdate(entity);
   }

   @Override
   public Long save(MenuData entity) throws ServiceException {
	    return menuDataDao.save(entity);
   }

   @Override
   public Integer update(MenuData entity) throws ServiceException {
	    return menuDataDao.update(entity);
   }

   @Override
   public Integer deleteById(Long id) throws ServiceException {
	    return menuDataDao.deleteById(id);
   }

}
