package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Incominfo;
import com.terrence.crm.dol.dao.IIncominfoDao;
@Repository
public class IncominfoDao extends BaseIbatisDao<Incominfo,java.lang.Long> implements IIncominfoDao{
	public String getIbatisSqlMapNamespace() {
		return "Incominfo"; 
	}
	public void saveOrUpdate(Incominfo entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Incominfo getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Incominfo)this.getSqlMapClientTemplate().queryForObject("Incominfo.getByProperty", map);
	}
}
