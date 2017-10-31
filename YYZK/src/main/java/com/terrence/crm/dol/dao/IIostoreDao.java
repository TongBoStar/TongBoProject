package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Iostore;

public interface IIostoreDao extends IBaseDao<Iostore, java.lang.Long>{
	public Iostore getByProperty(String propertyName,Object propertyValue);
}
