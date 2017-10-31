package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.CourseContent;
import com.terrence.crm.dol.query.CourseContentQuery;

public interface ICourseContentService {
	public CourseContent getById(Long id) throws ServiceException;
	public void saveOrUpdate(CourseContent entity) throws ServiceException;
	public Long save(CourseContent entity) throws ServiceException;
	public Integer update(CourseContent entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<CourseContent> findPage(Page<CourseContent> page, CourseContentQuery query) throws ServiceException;
	public Page<CourseContent> findPage(Page<CourseContent> page,String statement, CourseContentQuery query) throws ServiceException;
	public List<CourseContent> findList(CourseContentQuery query) throws ServiceException;
	public List<CourseContent> findList(CourseContentQuery query,Integer pageSize) throws ServiceException;
	public List<CourseContent> findList(CourseContentQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<CourseContent> findAllList() throws ServiceException;
}
