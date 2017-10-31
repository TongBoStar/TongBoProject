package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Arvoice;
import com.terrence.crm.dol.dao.IArvoiceDao;
@Repository
public class ArvoiceDao extends BaseIbatisDao<Arvoice,java.lang.Long> implements IArvoiceDao{
	public String getIbatisSqlMapNamespace() {
		return "Arvoice"; 
	}
	public void saveOrUpdate(Arvoice entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Arvoice getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Arvoice)this.getSqlMapClientTemplate().queryForObject("Arvoice.getByProperty", map);
	}
}
