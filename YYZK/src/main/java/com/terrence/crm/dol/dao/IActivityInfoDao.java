package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.ActivityInfo;

public interface IActivityInfoDao extends IBaseDao<ActivityInfo, java.lang.Long>{
	public ActivityInfo getByProperty(String propertyName,Object propertyValue);
}
