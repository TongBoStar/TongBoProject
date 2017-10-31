package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.CourseDetail;

public interface ICourseDetailDao extends IBaseDao<CourseDetail, java.lang.Long>{
	public CourseDetail getByProperty(String propertyName,Object propertyValue);
}
