package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Yyzkhttp;
import com.terrence.crm.dol.dao.IYyzkhttpDao;
@Repository
public class YyzkhttpDao extends BaseIbatisDao<Yyzkhttp,java.lang.Long> implements IYyzkhttpDao{
	public String getIbatisSqlMapNamespace() {
		return "Yyzkhttp"; 
	}
	public void saveOrUpdate(Yyzkhttp entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Yyzkhttp getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Yyzkhttp)this.getSqlMapClientTemplate().queryForObject("Yyzkhttp.getByProperty", map);
	}
}
