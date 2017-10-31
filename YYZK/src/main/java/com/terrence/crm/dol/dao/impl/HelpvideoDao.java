package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Helpvideo;
import com.terrence.crm.dol.dao.IHelpvideoDao;
@Repository
public class HelpvideoDao extends BaseIbatisDao<Helpvideo,java.lang.Long> implements IHelpvideoDao{
	public String getIbatisSqlMapNamespace() {
		return "Helpvideo"; 
	}
	public void saveOrUpdate(Helpvideo entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Helpvideo getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Helpvideo)this.getSqlMapClientTemplate().queryForObject("Helpvideo.getByProperty", map);
	}
}
