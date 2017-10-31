package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Wxrelative;
import com.terrence.crm.dol.dao.IWxrelativeDao;
@Repository
public class WxrelativeDao extends BaseIbatisDao<Wxrelative,java.lang.Long> implements IWxrelativeDao{
	public String getIbatisSqlMapNamespace() {
		return "Wxrelative"; 
	}
	public void saveOrUpdate(Wxrelative entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Wxrelative getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Wxrelative)this.getSqlMapClientTemplate().queryForObject("Wxrelative.getByProperty", map);
	}
}
