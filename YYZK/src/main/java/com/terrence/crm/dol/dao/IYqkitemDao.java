package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Yqkitem;

public interface IYqkitemDao extends IBaseDao<Yqkitem, java.lang.Long>{
	public Yqkitem getByProperty(String propertyName,Object propertyValue);
}
