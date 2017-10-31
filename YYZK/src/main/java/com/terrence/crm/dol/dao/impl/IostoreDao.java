package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Iostore;
import com.terrence.crm.dol.dao.IIostoreDao;
@Repository
public class IostoreDao extends BaseIbatisDao<Iostore,java.lang.Long> implements IIostoreDao{
	public String getIbatisSqlMapNamespace() {
		return "Iostore"; 
	}
	public void saveOrUpdate(Iostore entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Iostore getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Iostore)this.getSqlMapClientTemplate().queryForObject("Iostore.getByProperty", map);
	}
}
