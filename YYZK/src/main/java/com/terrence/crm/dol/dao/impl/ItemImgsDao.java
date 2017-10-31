package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.ItemImgs;
import com.terrence.crm.dol.dao.IItemImgsDao;
@Repository
public class ItemImgsDao extends BaseIbatisDao<ItemImgs,java.lang.Long> implements IItemImgsDao{
	public String getIbatisSqlMapNamespace() {
		return "ItemImgs"; 
	}
	public void saveOrUpdate(ItemImgs entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public ItemImgs getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (ItemImgs)this.getSqlMapClientTemplate().queryForObject("ItemImgs.getByProperty", map);
	}
	@Override
	public void deleteByItemId(Integer itemId) throws ServiceException {
		Map map=new HashMap();
		map.put("itemId", itemId);
		this.getSqlMapClientTemplate().delete("ItemImgs.deleteByItemId", map);
	}
}
