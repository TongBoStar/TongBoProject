package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.ModuleImg;

public interface IModuleImgDao extends IBaseDao<ModuleImg, java.lang.Long>{
	public ModuleImg getByProperty(String propertyName,Object propertyValue);
}
