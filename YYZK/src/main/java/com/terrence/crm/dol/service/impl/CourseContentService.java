package com.terrence.crm.dol.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.CourseContent;
import com.terrence.crm.dol.dao.ICourseContentDao;
import com.terrence.crm.dol.query.CourseContentQuery;
import com.terrence.crm.dol.service.ICourseContentService;
@Service
@Transactional
public class CourseContentService extends BaseService implements ICourseContentService {
	@Autowired
	@Qualifier("courseContentDao")
	private ICourseContentDao courseContentDao;
	@Override
	public CourseContent getById(Long id) throws ServiceException {
		return courseContentDao.getById(id);
	}
	@Override
	public void saveOrUpdate(CourseContent entity) throws ServiceException {
		courseContentDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(CourseContent entity) throws ServiceException {
		return courseContentDao.save(entity);
	}
	@Override
	public Integer update(CourseContent entity) throws ServiceException {
		return courseContentDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return courseContentDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = courseContentDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<CourseContent> findPage(Page<CourseContent> page, CourseContentQuery query) throws ServiceException{
		return courseContentDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<CourseContent> findPage(Page<CourseContent> page,String statement, CourseContentQuery query) throws ServiceException{
		return courseContentDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<CourseContent> findList(CourseContentQuery query) throws ServiceException{
		return courseContentDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<CourseContent> findList(CourseContentQuery query,Integer pageSize) throws ServiceException{
		return courseContentDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<CourseContent> findList(CourseContentQuery query,String statement,Integer pageSize) throws ServiceException{
		return courseContentDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<CourseContent> findAllList() throws ServiceException{
		return courseContentDao.findAllList();
	}
}
