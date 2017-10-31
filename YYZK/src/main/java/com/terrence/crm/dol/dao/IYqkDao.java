package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Yqk;

public interface IYqkDao extends IBaseDao<Yqk, java.lang.Long>{
	public Yqk getByProperty(String propertyName,Object propertyValue);
}
