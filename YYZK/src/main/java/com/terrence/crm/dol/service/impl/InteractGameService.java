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
import com.terrence.crm.dol.bean.InteractGame;
import com.terrence.crm.dol.bean.Yiyunupdate;
import com.terrence.crm.dol.dao.IInteractGameDao;
import com.terrence.crm.dol.dao.IYiyunupdateDao;
import com.terrence.crm.dol.query.InteractGameQuery;
import com.terrence.crm.dol.service.IInteractGameService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class InteractGameService extends BaseService implements IInteractGameService {
	@Autowired
	@Qualifier("interactGameDao")
	private IInteractGameDao interactGameDao;
	@Autowired
	@Qualifier("yiyunupdateDao")
	private IYiyunupdateDao yiyunupdateDao;
	@Override
	public InteractGame getById(Long id) throws ServiceException {
		return interactGameDao.getById(id);
	}
	@Override
	public void saveOrUpdate(InteractGame entity) throws ServiceException {
		String time = DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss");
		entity.setCreateDate(time);
		entity.setCreaterId(SpringSecurityUtils.getCurrentUserId());
		if(null==entity.getId()){
			interactGameDao.save(entity);
		}else{
			interactGameDao.update(entity);
			Yiyunupdate yiyunupdate = new Yiyunupdate();
			yiyunupdate.setCreaterId(SpringSecurityUtils.getCurrentUserId());
			yiyunupdate.setCreateTime(time);
			yiyunupdate.setFid(entity.getId());
			yiyunupdate.setFtable("InteractGameMark");
			yiyunupdateDao.save(yiyunupdate);
		}
	}
	@Override
	public Long save(InteractGame entity) throws ServiceException {
		return interactGameDao.save(entity);
	}
	@Override
	public Integer update(InteractGame entity) throws ServiceException {
		return interactGameDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return interactGameDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = interactGameDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<InteractGame> findPage(Page<InteractGame> page, InteractGameQuery query) throws ServiceException{
		return interactGameDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<InteractGame> findPage(Page<InteractGame> page,String statement, InteractGameQuery query) throws ServiceException{
		return interactGameDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<InteractGame> findList(InteractGameQuery query) throws ServiceException{
		return interactGameDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<InteractGame> findList(InteractGameQuery query,Integer pageSize) throws ServiceException{
		return interactGameDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<InteractGame> findList(InteractGameQuery query,String statement,Integer pageSize) throws ServiceException{
		return interactGameDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<InteractGame> findAllList() throws ServiceException{
		return interactGameDao.findAllList();
	}
	@Override
	public List<InteractGame> findList(String statement,InteractGameQuery interactGameQuery) throws ServiceException {
		return interactGameDao.findList(statement, interactGameQuery);
	}
}
