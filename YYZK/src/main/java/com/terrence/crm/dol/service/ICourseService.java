package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Course;
import com.terrence.crm.dol.query.CourseQuery;

public interface ICourseService {
	public Course getById(Long id) throws ServiceException;
	public void saveOrUpdate(Course entity) throws ServiceException;
	public Long save(Course entity) throws ServiceException;
	public Integer update(Course entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Course> findPage(Page<Course> page, CourseQuery query) throws ServiceException;
	public Page<Course> findPage(Page<Course> page,String statement, CourseQuery query) throws ServiceException;
	public List<Course> findList(CourseQuery query) throws ServiceException;
	public List<Course> findList(CourseQuery query,Integer pageSize) throws ServiceException;
	public List<Course> findList(CourseQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Course> findAllList() throws ServiceException;
	public List<Course> findList(String statement, CourseQuery courseQuery) throws ServiceException;
}
