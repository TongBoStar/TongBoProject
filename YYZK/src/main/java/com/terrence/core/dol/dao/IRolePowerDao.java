package com.terrence.core.dol.dao;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.RolePower;
import com.terrence.crm.dol.base.IBaseDao;

public interface IRolePowerDao extends IBaseDao<RolePower, java.lang.Long> {

	public void deleteByRoleId(Long roleId) throws ServiceException;
}
