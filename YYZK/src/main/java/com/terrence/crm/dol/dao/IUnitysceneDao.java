package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Unityscene;

public interface IUnitysceneDao extends IBaseDao<Unityscene, java.lang.Long>{
	public Unityscene getByProperty(String propertyName,Object propertyValue);
}
