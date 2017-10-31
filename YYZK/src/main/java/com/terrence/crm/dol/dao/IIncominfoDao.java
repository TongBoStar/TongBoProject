package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Incominfo;

public interface IIncominfoDao extends IBaseDao<Incominfo, java.lang.Long>{
	public Incominfo getByProperty(String propertyName,Object propertyValue);
}
