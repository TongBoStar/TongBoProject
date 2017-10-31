package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.AdminImages;

public interface IAdminImagesDao extends IBaseDao<AdminImages, java.lang.Long>{
	public AdminImages getByProperty(String propertyName,Object propertyValue);
}
