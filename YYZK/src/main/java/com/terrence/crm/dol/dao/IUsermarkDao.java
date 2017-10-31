package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Usermark;

public interface IUsermarkDao extends IBaseDao<Usermark, java.lang.Long>{
	public Usermark getByProperty(String propertyName,Object propertyValue);
}
