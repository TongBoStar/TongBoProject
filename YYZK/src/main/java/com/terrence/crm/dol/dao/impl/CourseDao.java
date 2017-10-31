package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Course;
import com.terrence.crm.dol.dao.ICourseDao;
@Repository
public class CourseDao extends BaseIbatisDao<Course,java.lang.Long> implements ICourseDao{
	public String getIbatisSqlMapNamespace() {
		return "Course"; 
	}
	public void saveOrUpdate(Course entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Course getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Course)this.getSqlMapClientTemplate().queryForObject("Course.getByProperty", map);
	}
}
