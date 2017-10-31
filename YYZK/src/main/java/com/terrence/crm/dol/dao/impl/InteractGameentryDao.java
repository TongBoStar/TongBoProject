package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.InteractGameentry;
import com.terrence.crm.dol.dao.IInteractGameentryDao;
@Repository
public class InteractGameentryDao extends BaseIbatisDao<InteractGameentry,java.lang.Long> implements IInteractGameentryDao{
	public String getIbatisSqlMapNamespace() {
		return "InteractGameentry"; 
	}
	public void saveOrUpdate(InteractGameentry entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public InteractGameentry getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (InteractGameentry)this.getSqlMapClientTemplate().queryForObject("InteractGameentry.getByProperty", map);
	}
}
