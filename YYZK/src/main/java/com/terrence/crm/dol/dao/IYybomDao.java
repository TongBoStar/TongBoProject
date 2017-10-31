package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Yybom;

public interface IYybomDao extends IBaseDao<Yybom, java.lang.Long>{
	public Yybom getByProperty(String propertyName,Object propertyValue);
}
