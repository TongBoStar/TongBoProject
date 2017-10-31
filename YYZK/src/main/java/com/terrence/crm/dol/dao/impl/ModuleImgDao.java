package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.ModuleImg;
import com.terrence.crm.dol.dao.IModuleImgDao;
@Repository
public class ModuleImgDao extends BaseIbatisDao<ModuleImg,java.lang.Long> implements IModuleImgDao{
	public String getIbatisSqlMapNamespace() {
		return "ModuleImg"; 
	}
	public void saveOrUpdate(ModuleImg entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public ModuleImg getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (ModuleImg)this.getSqlMapClientTemplate().queryForObject("ModuleImg.getByProperty", map);
	}
}
