package com.terrence.crm.dol.dao.impl;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Stuselog;
import com.terrence.crm.dol.dao.IStuselogDao;
@Repository
public class StuselogDao extends BaseIbatisDao<Stuselog,java.lang.Long> implements IStuselogDao{
	public String getIbatisSqlMapNamespace() {
		return "Stuselog"; 
	}
	public void saveOrUpdate(Stuselog entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Stuselog getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Stuselog)this.getSqlMapClientTemplate().queryForObject("Stuselog.getByProperty", map);
	}
	@Override
	public void saveBatch(List<Stuselog> stuselogs) throws ServiceException {
		Map map=new HashMap();
		map.put("list", stuselogs);
		this.getSqlMapClientTemplate().insert("Stuselog.batchInsertGroupShoup", map);
	}
	@Override
	public void saveBatch(String statement ,List<Stuselog> stuselogsall) throws ServiceException {
		Map map=new HashMap();
		map.put("list", stuselogsall);
		this.getSqlMapClientTemplate().insert(statement, map);
	}
}
