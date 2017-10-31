package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Stinfo;
import com.terrence.crm.dol.dao.IStinfoDao;
@Repository
public class StinfoDao extends BaseIbatisDao<Stinfo,java.lang.Long> implements IStinfoDao{
	public String getIbatisSqlMapNamespace() {
		return "Stinfo"; 
	}
	public void saveOrUpdate(Stinfo entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Stinfo getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Stinfo)this.getSqlMapClientTemplate().queryForObject("Stinfo.getByProperty", map);
	}
}
