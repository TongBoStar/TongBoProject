package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Yyagent;

public interface IYyagentDao extends IBaseDao<Yyagent, java.lang.Long>{
	public Yyagent getByProperty(String propertyName,Object propertyValue);
}
