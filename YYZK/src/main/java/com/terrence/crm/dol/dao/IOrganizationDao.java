package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Organization;

public interface IOrganizationDao extends IBaseDao<Organization, java.lang.Long>{
	public Organization getByProperty(String propertyName,Object propertyValue);
}
