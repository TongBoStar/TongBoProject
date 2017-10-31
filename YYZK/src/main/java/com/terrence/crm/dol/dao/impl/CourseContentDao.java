package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.CourseContent;
import com.terrence.crm.dol.dao.ICourseContentDao;
@Repository
public class CourseContentDao extends BaseIbatisDao<CourseContent,java.lang.Long> implements ICourseContentDao{
	public String getIbatisSqlMapNamespace() {
		return "CourseContent"; 
	}
	public void saveOrUpdate(CourseContent entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public CourseContent getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (CourseContent)this.getSqlMapClientTemplate().queryForObject("CourseContent.getByProperty", map);
	}
}
