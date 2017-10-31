package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Collection;

public interface ICollectionDao extends IBaseDao<Collection, java.lang.Long>{
	public Collection getByProperty(String propertyName,Object propertyValue);
}
