package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Turingtest;

public interface ITuringtestDao extends IBaseDao<Turingtest, java.lang.Long>{
	public Turingtest getByProperty(String propertyName,Object propertyValue);
}
