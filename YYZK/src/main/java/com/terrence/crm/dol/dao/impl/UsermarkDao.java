package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Usermark;
import com.terrence.crm.dol.dao.IUsermarkDao;
@Repository
public class UsermarkDao extends BaseIbatisDao<Usermark,java.lang.Long> implements IUsermarkDao{
	public String getIbatisSqlMapNamespace() {
		return "Usermark"; 
	}
	public void saveOrUpdate(Usermark entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Usermark getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Usermark)this.getSqlMapClientTemplate().queryForObject("Usermark.getByProperty", map);
	}
}
