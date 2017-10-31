package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Wxinfo;

public interface IWxinfoDao extends IBaseDao<Wxinfo, java.lang.Long>{
	public Wxinfo getByProperty(String propertyName,Object propertyValue);
}
