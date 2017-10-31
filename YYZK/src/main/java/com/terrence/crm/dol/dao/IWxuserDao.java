package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Wxuser;

public interface IWxuserDao extends IBaseDao<Wxuser, java.lang.Long>{
	public Wxuser getByProperty(String propertyName,Object propertyValue);
}
