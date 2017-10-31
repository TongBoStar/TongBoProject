package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Item;
import com.terrence.crm.dol.dao.IItemDao;
@Repository
public class ItemDao extends BaseIbatisDao<Item,java.lang.Long> implements IItemDao{
	public String getIbatisSqlMapNamespace() {
		return "Item"; 
	}
	public void saveOrUpdate(Item entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Item getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Item)this.getSqlMapClientTemplate().queryForObject("Item.getByProperty", map);
	}
}
