package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Yiyunupdate;
import com.terrence.crm.dol.dao.IYiyunupdateDao;
@Repository
public class YiyunupdateDao extends BaseIbatisDao<Yiyunupdate,java.lang.Long> implements IYiyunupdateDao{
	public String getIbatisSqlMapNamespace() {
		return "Yiyunupdate"; 
	}
	public void saveOrUpdate(Yiyunupdate entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Yiyunupdate getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Yiyunupdate)this.getSqlMapClientTemplate().queryForObject("Yiyunupdate.getByProperty", map);
	}
}
