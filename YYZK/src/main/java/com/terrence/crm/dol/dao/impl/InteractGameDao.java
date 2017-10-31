package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.InteractGame;
import com.terrence.crm.dol.dao.IInteractGameDao;
@Repository
public class InteractGameDao extends BaseIbatisDao<InteractGame,java.lang.Long> implements IInteractGameDao{
	public String getIbatisSqlMapNamespace() {
		return "InteractGame"; 
	}
	public void saveOrUpdate(InteractGame entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public InteractGame getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (InteractGame)this.getSqlMapClientTemplate().queryForObject("InteractGame.getByProperty", map);
	}
}
