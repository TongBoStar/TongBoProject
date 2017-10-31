package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.InteractGameentry;

public interface IInteractGameentryDao extends IBaseDao<InteractGameentry, java.lang.Long>{
	public InteractGameentry getByProperty(String propertyName,Object propertyValue);
}
