package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Order;
import com.terrence.crm.dol.dao.IOrderDao;
@Repository
public class OrderDao extends BaseIbatisDao<Order,java.lang.Long> implements IOrderDao{
	public String getIbatisSqlMapNamespace() {
		return "Order"; 
	}
	public void saveOrUpdate(Order entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Order getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Order)this.getSqlMapClientTemplate().queryForObject("Order.getByProperty", map);
	}
	@Override
	public Order getLastTime() throws Exception {
		return (Order)this.getSqlMapClientTemplate().queryForObject("Order.getLastTime");
	}
}
