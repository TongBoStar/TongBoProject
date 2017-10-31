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
import com.terrence.crm.dol.bean.Arvoice;
import com.terrence.crm.dol.bean.Yiyunupdate;
import com.terrence.crm.dol.dao.IArvoiceDao;
import com.terrence.crm.dol.dao.IYiyunupdateDao;
import com.terrence.crm.dol.query.ArvoiceQuery;
import com.terrence.crm.dol.service.IArvoiceService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class ArvoiceService extends BaseService implements IArvoiceService {
	@Autowired
	@Qualifier("arvoiceDao")
	private IArvoiceDao arvoiceDao;
	@Autowired
	@Qualifier("yiyunupdateDao")
	private IYiyunupdateDao yiyunupdateDao;
	@Override
	public Arvoice getById(Long id) throws ServiceException {
		return arvoiceDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Arvoice entity) throws ServiceException {
		//arvoiceDao.saveOrUpdate(entity);
		if(null!=entity.getId()){
			update(entity);
			Yiyunupdate yiyunupdate = new Yiyunupdate();
			yiyunupdate.setCreaterId(SpringSecurityUtils.getCurrentUserId());
			yiyunupdate.setCreateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
			yiyunupdate.setFid(entity.getId());
			yiyunupdate.setFtable("ArvoiceMark");
			yiyunupdateDao.save(yiyunupdate);
		}else{
			save(entity);
		}
	}
	@Override
	public Long save(Arvoice entity) throws ServiceException {
		return arvoiceDao.save(entity);
	}
	@Override
	public Integer update(Arvoice entity) throws ServiceException {
		return arvoiceDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return arvoiceDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = arvoiceDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Arvoice> findPage(Page<Arvoice> page, ArvoiceQuery query) throws ServiceException{
		return arvoiceDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Arvoice> findPage(Page<Arvoice> page,String statement, ArvoiceQuery query) throws ServiceException{
		return arvoiceDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Arvoice> findList(ArvoiceQuery query) throws ServiceException{
		return arvoiceDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Arvoice> findList(ArvoiceQuery query,Integer pageSize) throws ServiceException{
		return arvoiceDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Arvoice> findList(ArvoiceQuery query,String statement,Integer pageSize) throws ServiceException{
		return arvoiceDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Arvoice> findAllList() throws ServiceException{
		return arvoiceDao.findAllList();
	}
	@Override
	public List<Arvoice> findList(String statement, ArvoiceQuery arvoiceQuery)
			throws ServiceException {
		return arvoiceDao.findList(statement, arvoiceQuery);
	}
}
