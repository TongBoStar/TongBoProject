package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Stcode;
import com.terrence.crm.dol.dao.IStcodeDao;
@Repository
public class StcodeDao extends BaseIbatisDao<Stcode,java.lang.Long> implements IStcodeDao{
	public String getIbatisSqlMapNamespace() {
		return "Stcode"; 
	}
	public void saveOrUpdate(Stcode entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Stcode getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Stcode)this.getSqlMapClientTemplate().queryForObject("Stcode.getByProperty", map);
	}
}
