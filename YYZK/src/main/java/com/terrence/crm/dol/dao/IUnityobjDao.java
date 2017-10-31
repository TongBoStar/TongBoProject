package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Unityobj;

public interface IUnityobjDao extends IBaseDao<Unityobj, java.lang.Long>{
	public Unityobj getByProperty(String propertyName,Object propertyValue);
}
