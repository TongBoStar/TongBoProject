package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Gameinfo;

public interface IGameinfoDao extends IBaseDao<Gameinfo, java.lang.Long>{
	public Gameinfo getByProperty(String propertyName,Object propertyValue);
}
