package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Stcode;

public interface IStcodeDao extends IBaseDao<Stcode, java.lang.Long>{
	public Stcode getByProperty(String propertyName,Object propertyValue);
}
