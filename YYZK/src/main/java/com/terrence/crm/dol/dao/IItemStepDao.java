package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.ItemStep;

public interface IItemStepDao extends IBaseDao<ItemStep, java.lang.Long>{
	public ItemStep getByProperty(String propertyName,Object propertyValue);
}
