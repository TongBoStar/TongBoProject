package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Order;

public interface IOrderDao extends IBaseDao<Order, java.lang.Long>{
	public Order getByProperty(String propertyName,Object propertyValue);

	public Order getLastTime() throws Exception;
}
