package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.ActivityInfo;
import com.terrence.crm.dol.dao.IActivityInfoDao;
@Repository
public class ActivityInfoDao extends BaseIbatisDao<ActivityInfo,java.lang.Long> implements IActivityInfoDao{
	public String getIbatisSqlMapNamespace() {
		return "ActivityInfo"; 
	}
	public void saveOrUpdate(ActivityInfo entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public ActivityInfo getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (ActivityInfo)this.getSqlMapClientTemplate().queryForObject("ActivityInfo.getByProperty", map);
	}
}
