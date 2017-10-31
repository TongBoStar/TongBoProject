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
import com.terrence.crm.dol.bean.Yiyunupdate;
import com.terrence.crm.dol.bean.Yqkitem;
import com.terrence.crm.dol.dao.IYiyunupdateDao;
import com.terrence.crm.dol.dao.IYqkitemDao;
import com.terrence.crm.dol.query.YqkitemQuery;
import com.terrence.crm.dol.service.IYqkitemService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class YqkitemService extends BaseService implements IYqkitemService {
	@Autowired
	@Qualifier("yqkitemDao")
	private IYqkitemDao yqkitemDao;
	@Autowired
	@Qualifier("yiyunupdateDao")
	private IYiyunupdateDao yiyunupdateDao;
	@Override
	public Yqkitem getById(Long id) throws ServiceException {
		return yqkitemDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Yqkitem entity) throws ServiceException {
		String time = DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss");
		entity.setCreateTime(time);
		entity.setCreateUserId(SpringSecurityUtils.getCurrentUserId());
		if(null!=entity.getId()){
			update(entity);
			Yiyunupdate yiyunupdate = new Yiyunupdate();
			yiyunupdate.setCreaterId(SpringSecurityUtils.getCurrentUserId());
			yiyunupdate.setCreateTime(time);
			yiyunupdate.setFid(entity.getId());
			yiyunupdate.setFtable("YqkItemMark");
			yiyunupdateDao.save(yiyunupdate);
		}else{
			save(entity);
		}
	}
	@Override
	public Long save(Yqkitem entity) throws ServiceException {
		return yqkitemDao.save(entity);
	}
	@Override
	public Integer update(Yqkitem entity) throws ServiceException {
		return yqkitemDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return yqkitemDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = yqkitemDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Yqkitem> findPage(Page<Yqkitem> page, YqkitemQuery query) throws ServiceException{
		return yqkitemDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Yqkitem> findPage(Page<Yqkitem> page,String statement, YqkitemQuery query) throws ServiceException{
		return yqkitemDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Yqkitem> findList(YqkitemQuery query) throws ServiceException{
		return yqkitemDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Yqkitem> findList(YqkitemQuery query,Integer pageSize) throws ServiceException{
		return yqkitemDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yqkitem> findList(YqkitemQuery query,String statement,Integer pageSize) throws ServiceException{
		return yqkitemDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yqkitem> findAllList() throws ServiceException{
		return yqkitemDao.findAllList();
	}
	@Override
	public List<Yqkitem> findList(String statement, YqkitemQuery yqkitemQuery) {
		return yqkitemDao.findList(statement, yqkitemQuery);
	}
}
