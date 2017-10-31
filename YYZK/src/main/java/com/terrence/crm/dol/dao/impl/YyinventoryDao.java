package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Yyinventory;
import com.terrence.crm.dol.dao.IYyinventoryDao;
@Repository
public class YyinventoryDao extends BaseIbatisDao<Yyinventory,java.lang.Long> implements IYyinventoryDao{
	public String getIbatisSqlMapNamespace() {
		return "Yyinventory"; 
	}
	public void saveOrUpdate(Yyinventory entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Yyinventory getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Yyinventory)this.getSqlMapClientTemplate().queryForObject("Yyinventory.getByProperty", map);
	}
}
