package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Wxuser;
import com.terrence.crm.dol.dao.IWxuserDao;
@Repository
public class WxuserDao extends BaseIbatisDao<Wxuser,java.lang.Long> implements IWxuserDao{
	public String getIbatisSqlMapNamespace() {
		return "Wxuser"; 
	}
	public void saveOrUpdate(Wxuser entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Wxuser getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Wxuser)this.getSqlMapClientTemplate().queryForObject("Wxuser.getByProperty", map);
	}
}
