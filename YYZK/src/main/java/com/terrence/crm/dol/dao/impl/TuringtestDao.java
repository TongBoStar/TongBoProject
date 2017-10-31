package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Turingtest;
import com.terrence.crm.dol.dao.ITuringtestDao;
@Repository
public class TuringtestDao extends BaseIbatisDao<Turingtest,java.lang.Long> implements ITuringtestDao{
	public String getIbatisSqlMapNamespace() {
		return "Turingtest"; 
	}
	public void saveOrUpdate(Turingtest entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Turingtest getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Turingtest)this.getSqlMapClientTemplate().queryForObject("Turingtest.getByProperty", map);
	}
}
