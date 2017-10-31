package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.IostoreDetail;

public interface IIostoreDetailDao extends IBaseDao<IostoreDetail, java.lang.Long>{
	public IostoreDetail getByProperty(String propertyName,Object propertyValue);
}
