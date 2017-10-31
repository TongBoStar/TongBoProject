package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.StWx;
import com.terrence.crm.dol.query.StWxQuery;

public interface IStWxDao extends IBaseDao<StWx, java.lang.Long>{
	public StWx getByProperty(String propertyName,Object propertyValue);

	public void deleteByWxCode(String statement, StWxQuery stWxQuery);
}
