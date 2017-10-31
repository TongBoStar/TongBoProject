package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Stuselog;

public interface IStuselogDao extends IBaseDao<Stuselog, java.lang.Long>{
	public Stuselog getByProperty(String propertyName,Object propertyValue);
	public void saveBatch(List<Stuselog> stuselogs) throws ServiceException;
	public void saveBatch(String statement, List<Stuselog> stuselogsall) throws ServiceException;
}
