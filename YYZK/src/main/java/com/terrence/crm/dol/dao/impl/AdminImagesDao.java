package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.AdminImages;
import com.terrence.crm.dol.dao.IAdminImagesDao;
@Repository
public class AdminImagesDao extends BaseIbatisDao<AdminImages,java.lang.Long> implements IAdminImagesDao{
	public String getIbatisSqlMapNamespace() {
		return "AdminImages"; 
	}
	public void saveOrUpdate(AdminImages entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public AdminImages getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (AdminImages)this.getSqlMapClientTemplate().queryForObject("AdminImages.getByProperty", map);
	}
}
