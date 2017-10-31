package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Organization;
import com.terrence.crm.dol.dao.IOrganizationDao;
@Repository
public class OrganizationDao extends BaseIbatisDao<Organization,java.lang.Long> implements IOrganizationDao{
	public String getIbatisSqlMapNamespace() {
		return "Organization"; 
	}
	public void saveOrUpdate(Organization entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Organization getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Organization)this.getSqlMapClientTemplate().queryForObject("Organization.getByProperty", map);
	}
}
