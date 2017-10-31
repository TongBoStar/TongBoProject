package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Yyinventory;

public interface IYyinventoryDao extends IBaseDao<Yyinventory, java.lang.Long>{
	public Yyinventory getByProperty(String propertyName,Object propertyValue);
}
