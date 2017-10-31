package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Yybom;
import com.terrence.crm.dol.dao.IYybomDao;
@Repository
public class YybomDao extends BaseIbatisDao<Yybom,java.lang.Long> implements IYybomDao{
	public String getIbatisSqlMapNamespace() {
		return "Yybom"; 
	}
	public void saveOrUpdate(Yybom entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Yybom getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Yybom)this.getSqlMapClientTemplate().queryForObject("Yybom.getByProperty", map);
	}
}
