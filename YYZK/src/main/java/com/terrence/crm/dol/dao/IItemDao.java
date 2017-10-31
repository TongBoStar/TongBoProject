package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Item;

public interface IItemDao extends IBaseDao<Item, java.lang.Long>{
	public Item getByProperty(String propertyName,Object propertyValue);
}
