package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Stinfo;

public interface IStinfoDao extends IBaseDao<Stinfo, java.lang.Long>{
	public Stinfo getByProperty(String propertyName,Object propertyValue);
}
