package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.IostoreDetail;
import com.terrence.crm.dol.dao.IIostoreDetailDao;
@Repository
public class IostoreDetailDao extends BaseIbatisDao<IostoreDetail,java.lang.Long> implements IIostoreDetailDao{
	public String getIbatisSqlMapNamespace() {
		return "IostoreDetail"; 
	}
	public void saveOrUpdate(IostoreDetail entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public IostoreDetail getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (IostoreDetail)this.getSqlMapClientTemplate().queryForObject("IostoreDetail.getByProperty", map);
	}
}
