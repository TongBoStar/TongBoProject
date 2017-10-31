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
import com.terrence.crm.dol.bean.InteractGameentry;
import com.terrence.crm.dol.bean.Yiyunupdate;
import com.terrence.crm.dol.dao.IInteractGameentryDao;
import com.terrence.crm.dol.dao.IYiyunupdateDao;
import com.terrence.crm.dol.query.InteractGameentryQuery;
import com.terrence.crm.dol.service.IInteractGameentryService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class InteractGameentryService extends BaseService implements IInteractGameentryService {
	@Autowired
	@Qualifier("interactGameentryDao")
	private IInteractGameentryDao interactGameentryDao;
	@Autowired
	@Qualifier("yiyunupdateDao")
	private IYiyunupdateDao yiyunupdateDao;
	@Override
	public InteractGameentry getById(Long id) throws ServiceException {
		return interactGameentryDao.getById(id);
	}
	@Override
	public void saveOrUpdate(InteractGameentry entity) throws ServiceException {
		String time = DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss");
		if(null==entity.getId()){
			save(entity);
		}else{
			update(entity);
			Yiyunupdate yiyunupdate = new Yiyunupdate();
			yiyunupdate.setCreaterId(SpringSecurityUtils.getCurrentUserId());
			yiyunupdate.setCreateTime(time);
			yiyunupdate.setFid(entity.getId());
			yiyunupdate.setFtable("InteractGameEntryMark");
			yiyunupdateDao.save(yiyunupdate);
		}
	}
	@Override
	public Long save(InteractGameentry entity) throws ServiceException {
		return interactGameentryDao.save(entity);
	}
	@Override
	public Integer update(InteractGameentry entity) throws ServiceException {
		return interactGameentryDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return interactGameentryDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = interactGameentryDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<InteractGameentry> findPage(Page<InteractGameentry> page, InteractGameentryQuery query) throws ServiceException{
		return interactGameentryDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<InteractGameentry> findPage(Page<InteractGameentry> page,String statement, InteractGameentryQuery query) throws ServiceException{
		return interactGameentryDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<InteractGameentry> findList(InteractGameentryQuery query) throws ServiceException{
		return interactGameentryDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<InteractGameentry> findList(InteractGameentryQuery query,Integer pageSize) throws ServiceException{
		return interactGameentryDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<InteractGameentry> findList(InteractGameentryQuery query,String statement,Integer pageSize) throws ServiceException{
		return interactGameentryDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<InteractGameentry> findAllList() throws ServiceException{
		return interactGameentryDao.findAllList();
	}
	@Override
	public List<InteractGameentry> findList(String statement,InteractGameentryQuery interactGameentryQuery)throws ServiceException {
		return interactGameentryDao.findList(statement, interactGameentryQuery);
	}
}
