package com.terrence.crm.dol.service.impl;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Course;
import com.terrence.crm.dol.bean.Yiyunupdate;
import com.terrence.crm.dol.dao.ICourseDao;
import com.terrence.crm.dol.dao.IYiyunupdateDao;
import com.terrence.crm.dol.dao.impl.CourseDetailDao;
import com.terrence.crm.dol.query.CourseQuery;
import com.terrence.crm.dol.service.ICourseService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class CourseService extends BaseService implements ICourseService {
	@Autowired
	@Qualifier("courseDao")
	private ICourseDao courseDao;
	@Autowired
	@Qualifier("courseDetailDao")
	private CourseDetailDao courseDetailDao;
	@Autowired
	@Qualifier("yiyunupdateDao")
	private IYiyunupdateDao yiyunupdateDao;
	@Override
	public Course getById(Long id) throws ServiceException {
		return courseDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Course entity) throws ServiceException {
		String time = DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss");
		entity.setCreateTime(time);
		entity.setCreateUserId(SpringSecurityUtils.getCurrentUserId());
		if(null!=entity.getId()){
			update(entity);
			Yiyunupdate yiyunupdate = new Yiyunupdate();
			yiyunupdate.setCreaterId(SpringSecurityUtils.getCurrentUserId());
			yiyunupdate.setCreateTime(time);
			yiyunupdate.setFid(entity.getId());
			yiyunupdate.setFtable("CourseMark");
			yiyunupdateDao.save(yiyunupdate);
		}else{
			save(entity);
		}
	}
	@Override
	public Long save(Course entity) throws ServiceException {
		return courseDao.save(entity);
	}
	@Override
	public Integer update(Course entity) throws ServiceException {
		return courseDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return courseDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = courseDao.deleteByMultipleId(delIds);
		courseDetailDao.deleteByMultipleId("Course.CourseDetail.deleteMultiple", delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Course> findPage(Page<Course> page, CourseQuery query) throws ServiceException{
		return courseDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Course> findPage(Page<Course> page,String statement, CourseQuery query) throws ServiceException{
		return courseDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Course> findList(CourseQuery query) throws ServiceException{
		return courseDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Course> findList(CourseQuery query,Integer pageSize) throws ServiceException{
		return courseDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Course> findList(CourseQuery query,String statement,Integer pageSize) throws ServiceException{
		return courseDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Course> findAllList() throws ServiceException{
		return courseDao.findAllList();
	}
	@Override
	public List<Course> findList(String statement, CourseQuery courseQuery)throws ServiceException {
		return courseDao.findList(statement, courseQuery);
	}
}
