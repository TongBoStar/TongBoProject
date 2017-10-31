package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Yyagent;
import com.terrence.crm.dol.dao.IYyagentDao;
@Repository
public class YyagentDao extends BaseIbatisDao<Yyagent,java.lang.Long> implements IYyagentDao{
	public String getIbatisSqlMapNamespace() {
		return "Yyagent"; 
	}
	public void saveOrUpdate(Yyagent entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Yyagent getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Yyagent)this.getSqlMapClientTemplate().queryForObject("Yyagent.getByProperty", map);
	}
}
