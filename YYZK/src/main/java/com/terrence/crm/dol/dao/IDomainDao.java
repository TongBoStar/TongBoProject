package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Domain;

public interface IDomainDao extends IBaseDao<Domain, java.lang.Long>{
	public Domain getByProperty(String propertyName,Object propertyValue);
}
