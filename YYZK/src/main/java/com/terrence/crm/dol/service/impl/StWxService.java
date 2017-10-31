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
import com.terrence.crm.dol.bean.StWx;
import com.terrence.crm.dol.dao.IStWxDao;
import com.terrence.crm.dol.query.StWxQuery;
import com.terrence.crm.dol.service.IStWxService;
@Service
@Transactional
public class StWxService extends BaseService implements IStWxService {
	@Autowired
	@Qualifier("stWxDao")
	private IStWxDao stWxDao;
	@Override
	public StWx getById(Long id) throws ServiceException {
		return stWxDao.getById(id);
	}
	@Override
	public void saveOrUpdate(StWx entity) throws ServiceException {
		stWxDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(StWx entity) throws ServiceException {
		return stWxDao.save(entity);
	}
	@Override
	public Integer update(StWx entity) throws ServiceException {
		return stWxDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return stWxDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = stWxDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<StWx> findPage(Page<StWx> page, StWxQuery query) throws ServiceException{
		return stWxDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<StWx> findPage(Page<StWx> page,String statement, StWxQuery query) throws ServiceException{
		return stWxDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<StWx> findList(StWxQuery query) throws ServiceException{
		return stWxDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<StWx> findList(StWxQuery query,Integer pageSize) throws ServiceException{
		return stWxDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<StWx> findList(StWxQuery query,String statement,Integer pageSize) throws ServiceException{
		return stWxDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<StWx> findAllList() throws ServiceException{
		return stWxDao.findAllList();
	}
	@Override
	public void deleteById(String statement, StWxQuery stWxQuery) {
		stWxDao.deleteByWxCode(statement, stWxQuery);
	}
}
