package com.terrence.core.dol.dao.impl;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.RolePower;
import com.terrence.core.dol.dao.IRolePowerDao;
import com.terrence.crm.dol.base.BaseIbatisDao;

@Repository
public class RolePowerDao extends BaseIbatisDao<RolePower, java.lang.Long> implements IRolePowerDao {

   @Override
   public String getIbatisSqlMapNamespace() {
       return "RolePower";
   }

   @Override
   public void saveOrUpdate(RolePower entity) throws DataAccessException {
   
   }

   @Override
   public void deleteByRoleId(Long roleId) throws ServiceException {
	// TODO Auto-generated method stub
	   this.getSqlMapClientTemplate().delete(getIbatisSqlMapNamespace()+".deleteByRoleId", roleId);
   }
}
