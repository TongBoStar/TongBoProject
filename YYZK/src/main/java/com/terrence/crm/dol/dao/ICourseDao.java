package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Course;

public interface ICourseDao extends IBaseDao<Course, java.lang.Long>{
	public Course getByProperty(String propertyName,Object propertyValue);
}
