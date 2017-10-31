package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.CourseDetail;
import com.terrence.crm.dol.dao.ICourseDetailDao;
@Repository
public class CourseDetailDao extends BaseIbatisDao<CourseDetail,java.lang.Long> implements ICourseDetailDao{
	public String getIbatisSqlMapNamespace() {
		return "CourseDetail"; 
	}
	public void saveOrUpdate(CourseDetail entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public CourseDetail getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (CourseDetail)this.getSqlMapClientTemplate().queryForObject("CourseDetail.getByProperty", map);
	}
}
