package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.CourseDetail;
import com.terrence.crm.dol.query.CourseDetailQuery;

public interface ICourseDetailService {
	public CourseDetail getById(Long id) throws ServiceException;
	public void saveOrUpdate(CourseDetail entity) throws ServiceException;
	public Long save(CourseDetail entity) throws ServiceException;
	public Integer update(CourseDetail entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<CourseDetail> findPage(Page<CourseDetail> page, CourseDetailQuery query) throws ServiceException;
	public Page<CourseDetail> findPage(Page<CourseDetail> page,String statement, CourseDetailQuery query) throws ServiceException;
	public List<CourseDetail> findList(CourseDetailQuery query) throws ServiceException;
	public List<CourseDetail> findList(CourseDetailQuery query,Integer pageSize) throws ServiceException;
	public List<CourseDetail> findList(CourseDetailQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<CourseDetail> findAllList() throws ServiceException;
	public List<CourseDetail> findList(String statement,CourseDetailQuery courseDetailQuery) throws ServiceException;
}
