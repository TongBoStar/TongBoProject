package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.UserAddress;

public interface IUserAddressDao extends IBaseDao<UserAddress, java.lang.Long>{
	public UserAddress getByProperty(String propertyName,Object propertyValue);
}
