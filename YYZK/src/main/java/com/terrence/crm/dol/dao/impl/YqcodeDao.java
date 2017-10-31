package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Yqcode;
import com.terrence.crm.dol.dao.IYqcodeDao;
@Repository
public class YqcodeDao extends BaseIbatisDao<Yqcode,java.lang.Long> implements IYqcodeDao{
	public String getIbatisSqlMapNamespace() {
		return "Yqcode"; 
	}
	public void saveOrUpdate(Yqcode entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Yqcode getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Yqcode)this.getSqlMapClientTemplate().queryForObject("Yqcode.getByProperty", map);
	}
}
