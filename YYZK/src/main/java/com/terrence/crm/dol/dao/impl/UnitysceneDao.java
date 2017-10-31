package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Unityscene;
import com.terrence.crm.dol.dao.IUnitysceneDao;
@Repository
public class UnitysceneDao extends BaseIbatisDao<Unityscene,java.lang.Long> implements IUnitysceneDao{
	public String getIbatisSqlMapNamespace() {
		return "Unityscene"; 
	}
	public void saveOrUpdate(Unityscene entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Unityscene getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Unityscene)this.getSqlMapClientTemplate().queryForObject("Unityscene.getByProperty", map);
	}
}
