package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Wxinfo;
import com.terrence.crm.dol.dao.IWxinfoDao;
@Repository
public class WxinfoDao extends BaseIbatisDao<Wxinfo,java.lang.Long> implements IWxinfoDao{
	public String getIbatisSqlMapNamespace() {
		return "Wxinfo"; 
	}
	public void saveOrUpdate(Wxinfo entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Wxinfo getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Wxinfo)this.getSqlMapClientTemplate().queryForObject("Wxinfo.getByProperty", map);
	}
}
