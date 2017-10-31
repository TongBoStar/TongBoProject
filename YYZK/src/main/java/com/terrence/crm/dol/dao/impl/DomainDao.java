package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Domain;
import com.terrence.crm.dol.dao.IDomainDao;
@Repository
public class DomainDao extends BaseIbatisDao<Domain,java.lang.Long> implements IDomainDao{
	public String getIbatisSqlMapNamespace() {
		return "Domain"; 
	}
	public void saveOrUpdate(Domain entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Domain getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Domain)this.getSqlMapClientTemplate().queryForObject("Domain.getByProperty", map);
	}
}
