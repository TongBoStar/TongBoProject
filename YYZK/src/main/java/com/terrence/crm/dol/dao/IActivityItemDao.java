package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.ActivityItem;

public interface IActivityItemDao extends IBaseDao<ActivityItem, java.lang.Long>{
	public ActivityItem getByProperty(String propertyName,Object propertyValue);
}
