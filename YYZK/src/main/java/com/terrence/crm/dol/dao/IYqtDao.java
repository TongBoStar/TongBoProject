package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Yqt;

public interface IYqtDao extends IBaseDao<Yqt, java.lang.Long>{
	public Yqt getByProperty(String propertyName,Object propertyValue);
}
