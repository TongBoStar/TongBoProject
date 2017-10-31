package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Collection;
import com.terrence.crm.dol.dao.ICollectionDao;
@Repository
public class CollectionDao extends BaseIbatisDao<Collection,java.lang.Long> implements ICollectionDao{
	public String getIbatisSqlMapNamespace() {
		return "Collection"; 
	}
	public void saveOrUpdate(Collection entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Collection getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Collection)this.getSqlMapClientTemplate().queryForObject("Collection.getByProperty", map);
	}
}
