package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.StWx;
import com.terrence.crm.dol.dao.IStWxDao;
import com.terrence.crm.dol.query.StWxQuery;
@Repository
public class StWxDao extends BaseIbatisDao<StWx,java.lang.Long> implements IStWxDao{
	public String getIbatisSqlMapNamespace() {
		return "StWx"; 
	}
	public void saveOrUpdate(StWx entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public StWx getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (StWx)this.getSqlMapClientTemplate().queryForObject("StWx.getByProperty", map);
	}
	@Override
	public void deleteByWxCode(String statement, StWxQuery stWxQuery) {
		this.getSqlMapClientTemplate().delete(statement, stWxQuery);
	}
}
