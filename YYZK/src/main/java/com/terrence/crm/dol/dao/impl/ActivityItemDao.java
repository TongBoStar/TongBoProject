package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.ActivityItem;
import com.terrence.crm.dol.dao.IActivityItemDao;
@Repository
public class ActivityItemDao extends BaseIbatisDao<ActivityItem,java.lang.Long> implements IActivityItemDao{
	public String getIbatisSqlMapNamespace() {
		return "ActivityItem"; 
	}
	public void saveOrUpdate(ActivityItem entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public ActivityItem getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (ActivityItem)this.getSqlMapClientTemplate().queryForObject("ActivityItem.getByProperty", map);
	}
}
