package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Yqt;
import com.terrence.crm.dol.dao.IYqtDao;
@Repository
public class YqtDao extends BaseIbatisDao<Yqt,java.lang.Long> implements IYqtDao{
	public String getIbatisSqlMapNamespace() {
		return "Yqt"; 
	}
	public void saveOrUpdate(Yqt entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Yqt getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Yqt)this.getSqlMapClientTemplate().queryForObject("Yqt.getByProperty", map);
	}
}
