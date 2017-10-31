package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.CourseContent;

public interface ICourseContentDao extends IBaseDao<CourseContent, java.lang.Long>{
	public CourseContent getByProperty(String propertyName,Object propertyValue);
}
