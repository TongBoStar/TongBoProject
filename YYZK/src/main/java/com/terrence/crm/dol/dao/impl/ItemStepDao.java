package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.ItemStep;
import com.terrence.crm.dol.dao.IItemStepDao;
@Repository
public class ItemStepDao extends BaseIbatisDao<ItemStep,java.lang.Long> implements IItemStepDao{
	public String getIbatisSqlMapNamespace() {
		return "ItemStep"; 
	}
	public void saveOrUpdate(ItemStep entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public ItemStep getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (ItemStep)this.getSqlMapClientTemplate().queryForObject("ItemStep.getByProperty", map);
	}
}
