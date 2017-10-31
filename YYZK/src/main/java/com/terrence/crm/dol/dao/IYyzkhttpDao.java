package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Yyzkhttp;

public interface IYyzkhttpDao extends IBaseDao<Yyzkhttp, java.lang.Long>{
	public Yyzkhttp getByProperty(String propertyName,Object propertyValue);
}
