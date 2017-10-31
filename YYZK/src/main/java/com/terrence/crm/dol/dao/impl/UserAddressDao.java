package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.UserAddress;
import com.terrence.crm.dol.dao.IUserAddressDao;
@Repository
public class UserAddressDao extends BaseIbatisDao<UserAddress,java.lang.Long> implements IUserAddressDao{
	public String getIbatisSqlMapNamespace() {
		return "UserAddress"; 
	}
	public void saveOrUpdate(UserAddress entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public UserAddress getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (UserAddress)this.getSqlMapClientTemplate().queryForObject("UserAddress.getByProperty", map);
	}
}
