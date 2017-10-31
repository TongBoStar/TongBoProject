package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Arvoice;

public interface IArvoiceDao extends IBaseDao<Arvoice, java.lang.Long>{
	public Arvoice getByProperty(String propertyName,Object propertyValue);
}
