package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Module;

public interface IModuleDao extends IBaseDao<Module, java.lang.Long>{
	public Module getByProperty(String propertyName,Object propertyValue);
}
