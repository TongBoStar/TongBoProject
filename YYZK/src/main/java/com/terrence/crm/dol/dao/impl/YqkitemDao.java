package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Yqkitem;
import com.terrence.crm.dol.dao.IYqkitemDao;
@Repository
public class YqkitemDao extends BaseIbatisDao<Yqkitem,java.lang.Long> implements IYqkitemDao{
	public String getIbatisSqlMapNamespace() {
		return "Yqkitem"; 
	}
	public void saveOrUpdate(Yqkitem entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Yqkitem getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Yqkitem)this.getSqlMapClientTemplate().queryForObject("Yqkitem.getByProperty", map);
	}
}
