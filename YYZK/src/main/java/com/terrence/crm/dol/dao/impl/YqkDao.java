package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Yqk;
import com.terrence.crm.dol.dao.IYqkDao;
@Repository
public class YqkDao extends BaseIbatisDao<Yqk,java.lang.Long> implements IYqkDao{
	public String getIbatisSqlMapNamespace() {
		return "Yqk"; 
	}
	public void saveOrUpdate(Yqk entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Yqk getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Yqk)this.getSqlMapClientTemplate().queryForObject("Yqk.getByProperty", map);
	}
}
