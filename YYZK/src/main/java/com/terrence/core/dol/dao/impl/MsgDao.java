package com.terrence.core.dol.dao.impl;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.Msg;
import com.terrence.core.dol.dao.IMsgDao;
import com.terrence.core.dol.query.MsgQuery;
import com.terrence.crm.dol.base.BaseIbatisDao;

@Repository
public class MsgDao extends BaseIbatisDao<Msg, java.lang.Long> implements IMsgDao {

   @Override
   public String getIbatisSqlMapNamespace() {
       return "Msg";
   }

   @Override
   public void saveOrUpdate(Msg entity) throws DataAccessException {
   
   }

   @Override
   public Long getCount(MsgQuery msgQuery) throws ServiceException {
	   // TODO Auto-generated method stub
	   return (Long) this.getSqlMapClientTemplate().queryForObject("Msg.findPage.count",msgQuery);
   }
}
