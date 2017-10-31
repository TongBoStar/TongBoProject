package com.terrence.core.dol.dao.impl;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.terrence.core.dol.bean.MenuData;
import com.terrence.core.dol.dao.IMenuDataDao;
import com.terrence.crm.dol.base.BaseIbatisDao;

@Repository
public class MenuDataDao extends BaseIbatisDao<MenuData, java.lang.Long> implements IMenuDataDao {

   @Override
   public String getIbatisSqlMapNamespace() {
       return "MenuData";
   }

   @Override
   public void saveOrUpdate(MenuData entity) throws DataAccessException {
   
   }
   
}
