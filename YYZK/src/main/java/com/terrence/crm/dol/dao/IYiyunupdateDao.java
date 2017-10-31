package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Yiyunupdate;

public interface IYiyunupdateDao extends IBaseDao<Yiyunupdate, java.lang.Long>{
	public Yiyunupdate getByProperty(String propertyName,Object propertyValue);
}
