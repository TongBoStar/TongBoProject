package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Gameinfo;
import com.terrence.crm.dol.dao.IGameinfoDao;
@Repository
public class GameinfoDao extends BaseIbatisDao<Gameinfo,java.lang.Long> implements IGameinfoDao{
	public String getIbatisSqlMapNamespace() {
		return "Gameinfo"; 
	}
	public void saveOrUpdate(Gameinfo entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Gameinfo getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Gameinfo)this.getSqlMapClientTemplate().queryForObject("Gameinfo.getByProperty", map);
	}
}
