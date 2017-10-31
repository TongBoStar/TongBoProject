package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Yyitem;
import com.terrence.crm.dol.dao.IYyitemDao;
@Repository
public class YyitemDao extends BaseIbatisDao<Yyitem,java.lang.Long> implements IYyitemDao{
	public String getIbatisSqlMapNamespace() {
		return "Yyitem"; 
	}
	public void saveOrUpdate(Yyitem entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Yyitem getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Yyitem)this.getSqlMapClientTemplate().queryForObject("Yyitem.getByProperty", map);
	}
}
