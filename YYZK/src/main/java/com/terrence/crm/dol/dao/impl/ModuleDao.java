package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Module;
import com.terrence.crm.dol.dao.IModuleDao;
@Repository
public class ModuleDao extends BaseIbatisDao<Module,java.lang.Long> implements IModuleDao{
	public String getIbatisSqlMapNamespace() {
		return "Module"; 
	}
	public void saveOrUpdate(Module entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Module getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Module)this.getSqlMapClientTemplate().queryForObject("Module.getByProperty", map);
	}
}
