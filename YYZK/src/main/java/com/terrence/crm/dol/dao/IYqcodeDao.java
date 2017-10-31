package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Yqcode;

public interface IYqcodeDao extends IBaseDao<Yqcode, java.lang.Long>{
	public Yqcode getByProperty(String propertyName,Object propertyValue);
}
