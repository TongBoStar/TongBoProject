package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Yyitem;

public interface IYyitemDao extends IBaseDao<Yyitem, java.lang.Long>{
	public Yyitem getByProperty(String propertyName,Object propertyValue);
}
