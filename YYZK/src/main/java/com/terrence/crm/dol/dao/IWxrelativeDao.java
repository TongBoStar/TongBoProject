package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Wxrelative;

public interface IWxrelativeDao extends IBaseDao<Wxrelative, java.lang.Long>{
	public Wxrelative getByProperty(String propertyName,Object propertyValue);
}
