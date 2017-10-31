package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Unityobj;
import com.terrence.crm.dol.dao.IUnityobjDao;
@Repository
public class UnityobjDao extends BaseIbatisDao<Unityobj,java.lang.Long> implements IUnityobjDao{
	public String getIbatisSqlMapNamespace() {
		return "Unityobj"; 
	}
	public void saveOrUpdate(Unityobj entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Unityobj getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Unityobj)this.getSqlMapClientTemplate().queryForObject("Unityobj.getByProperty", map);
	}
}
