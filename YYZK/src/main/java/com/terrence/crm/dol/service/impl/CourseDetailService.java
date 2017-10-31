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
import com.terrence.crm.dol.bean.CourseDetail;
import com.terrence.crm.dol.bean.InteractGame;
import com.terrence.crm.dol.bean.Yiyunupdate;
import com.terrence.crm.dol.dao.ICourseDetailDao;
import com.terrence.crm.dol.dao.IInteractGameDao;
import com.terrence.crm.dol.dao.IYiyunupdateDao;
import com.terrence.crm.dol.query.CourseDetailQuery;
import com.terrence.crm.dol.service.ICourseDetailService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class CourseDetailService extends BaseService implements ICourseDetailService {
	@Autowired
	@Qualifier("courseDetailDao")
	private ICourseDetailDao courseDetailDao;
	@Autowired
	@Qualifier("interactGameDao")
	private IInteractGameDao interactGameDao;
	@Autowired
	@Qualifier("yiyunupdateDao")
	private IYiyunupdateDao yiyunupdateDao;
	@Override
	public CourseDetail getById(Long id) throws ServiceException {
		CourseDetail c = courseDetailDao.getById(id);
		if(null!=c.getInteractId()){
			InteractGame ig = interactGameDao.getById(c.getInteractId());
			c.setInteractGame(ig);
		}
		return c;
	}
	@Override
	public void saveOrUpdate(CourseDetail entity) throws ServiceException {
		String time = DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss");
		entity.setCreateTime(time);
		entity.setCreateUserId(SpringSecurityUtils.getCurrentUserId());
		if(null!=entity.getId()){
			update(entity);
			Yiyunupdate yiyunupdate = new Yiyunupdate();
			yiyunupdate.setCreaterId(SpringSecurityUtils.getCurrentUserId());
			yiyunupdate.setCreateTime(time);
			yiyunupdate.setFid(entity.getId());
			yiyunupdate.setFtable("CourseDetailMark");
			yiyunupdateDao.save(yiyunupdate);
		}else{
			save(entity);
		}
	}
	@Override
	public Long save(CourseDetail entity) throws ServiceException {
		return courseDetailDao.save(entity);
	}
	@Override
	public Integer update(CourseDetail entity) throws ServiceException {
		return courseDetailDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return courseDetailDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = courseDetailDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<CourseDetail> findPage(Page<CourseDetail> page, CourseDetailQuery query) throws ServiceException{
		return courseDetailDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<CourseDetail> findPage(Page<CourseDetail> page,String statement, CourseDetailQuery query) throws ServiceException{
		return courseDetailDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<CourseDetail> findList(CourseDetailQuery query) throws ServiceException{
		return courseDetailDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<CourseDetail> findList(CourseDetailQuery query,Integer pageSize) throws ServiceException{
		return courseDetailDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<CourseDetail> findList(CourseDetailQuery query,String statement,Integer pageSize) throws ServiceException{
		return courseDetailDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<CourseDetail> findAllList() throws ServiceException{
		return courseDetailDao.findAllList();
	}
	@Override
	public List<CourseDetail> findList(String statement,CourseDetailQuery courseDetailQuery) {
		return courseDetailDao.findList(statement, courseDetailQuery);
	}
}
