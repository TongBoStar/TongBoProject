package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.InteractGame;

public interface IInteractGameDao extends IBaseDao<InteractGame, java.lang.Long>{
	public InteractGame getByProperty(String propertyName,Object propertyValue);
}
