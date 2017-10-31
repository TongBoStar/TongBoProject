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
import com.terrence.crm.dol.bean.Wxrelative;
import com.terrence.crm.dol.dao.IWxrelativeDao;
import com.terrence.crm.dol.query.WxrelativeQuery;
import com.terrence.crm.dol.service.IWxrelativeService;
@Service
@Transactional
public class WxrelativeService extends BaseService implements IWxrelativeService {
	@Autowired
	@Qualifier("wxrelativeDao")
	private IWxrelativeDao wxrelativeDao;
	@Override
	public Wxrelative getById(Long id) throws ServiceException {
		return wxrelativeDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Wxrelative entity) throws ServiceException {
		wxrelativeDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Wxrelative entity) throws ServiceException {
		return wxrelativeDao.save(entity);
	}
	@Override
	public Integer update(Wxrelative entity) throws ServiceException {
		return wxrelativeDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return wxrelativeDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = wxrelativeDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Wxrelative> findPage(Page<Wxrelative> page, WxrelativeQuery query) throws ServiceException{
		return wxrelativeDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Wxrelative> findPage(Page<Wxrelative> page,String statement, WxrelativeQuery query) throws ServiceException{
		return wxrelativeDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Wxrelative> findList(WxrelativeQuery query) throws ServiceException{
		return wxrelativeDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Wxrelative> findList(WxrelativeQuery query,Integer pageSize) throws ServiceException{
		return wxrelativeDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Wxrelative> findList(WxrelativeQuery query,String statement,Integer pageSize) throws ServiceException{
		return wxrelativeDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Wxrelative> findAllList() throws ServiceException{
		return wxrelativeDao.findAllList();
	}
}
