package com.terrence.core.dol.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.exception.ServiceException;
import com.base.util.StringUtil;
import com.terrence.core.dol.bean.RolePower;
import com.terrence.core.dol.dao.IRolePowerDao;
import com.terrence.core.dol.query.RolePowerQuery;
import com.terrence.core.dol.service.IRolePowerService;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.utils.ConfigTerrence;

@Service
@Transactional
public class RolePowerService extends BaseService implements IRolePowerService {
   @Autowired
   @Qualifier("rolePowerDao")
   private IRolePowerDao rolePowerDao;

   @Override
   public Page<RolePower> findPage(Page<RolePower> page,RolePowerQuery query) throws ServiceException {
       return rolePowerDao.findPage(page, query);
   }

   @Override
   public List<RolePower> findList(RolePowerQuery query) throws ServiceException {
	    return rolePowerDao.findList(query);
   }

   @Override
   public RolePower getById(Long id) throws ServiceException {
	    return rolePowerDao.getById(id);
   }

   @Override
   public void saveOrUpdate(RolePower entity) throws ServiceException {
	    rolePowerDao.saveOrUpdate(entity);
   }

   @Override
   public Long save(RolePower entity) throws ServiceException {
	    return rolePowerDao.save(entity);
   }

   	@Override
   	public Integer update(RolePower entity) throws ServiceException {
   		return rolePowerDao.update(entity);
   	}

   	@Override
   	public Integer deleteById(Long id) throws ServiceException {
   		return rolePowerDao.deleteById(id);
   	}

	@Override
	public void deleteByRoleId(Long roleId) throws ServiceException {
		// TODO Auto-generated method stub
		rolePowerDao.deleteByRoleId(roleId);
	}

	@Override
	public void save(RolePower rolePower,String[] rolePowerArray) throws Exception {
		deleteByRoleId(rolePower.getRoleId());
		for(String array:rolePowerArray){
			if(!StringUtil.isNull(array)){
				String[] str = array.split("\\_");
				if(str.length>=2){
					if(str[0].equals("show")){
						RolePower bean = new RolePower();
						bean.setCode("show");
						bean.setRoleId(rolePower.getRoleId());
						bean.setMenuId(Long.parseLong(str[1]));
						save(bean);
					}else if(str[0].equals("operate")){
						RolePower bean = new RolePower();
						bean.setCode("operate");
						bean.setRoleId(rolePower.getRoleId());
						bean.setAuthorityId(Long.parseLong(str[2]));
						bean.setMenuId(Long.parseLong(str[1]));
						save(bean);
					}
				}
			}
		}
		operationLogDao.save(ConfigTerrence.MODEL_ROLE_MANAGE, ConfigTerrence.OPT_AUTOHERITY, "授权成功["+rolePowerArray+"]");
	}
}
