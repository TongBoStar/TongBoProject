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
import com.terrence.crm.dol.bean.Usermark;
import com.terrence.crm.dol.dao.IUsermarkDao;
import com.terrence.crm.dol.query.UsermarkQuery;
import com.terrence.crm.dol.service.IUsermarkService;
@Service
@Transactional
public class UsermarkService extends BaseService implements IUsermarkService {
	@Autowired
	@Qualifier("usermarkDao")
	private IUsermarkDao usermarkDao;
	@Override
	public Usermark getById(Long id) throws ServiceException {
		return usermarkDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Usermark entity) throws ServiceException {
		usermarkDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Usermark entity) throws ServiceException {
		return usermarkDao.save(entity);
	}
	@Override
	public Integer update(Usermark entity) throws ServiceException {
		return usermarkDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return usermarkDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = usermarkDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Usermark> findPage(Page<Usermark> page, UsermarkQuery query) throws ServiceException{
		return usermarkDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Usermark> findPage(Page<Usermark> page,String statement, UsermarkQuery query) throws ServiceException{
		return usermarkDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Usermark> findList(UsermarkQuery query) throws ServiceException{
		return usermarkDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Usermark> findList(UsermarkQuery query,Integer pageSize) throws ServiceException{
		return usermarkDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Usermark> findList(UsermarkQuery query,String statement,Integer pageSize) throws ServiceException{
		return usermarkDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Usermark> findAllList() throws ServiceException{
		return usermarkDao.findAllList();
	}
	@Override
	public List<Usermark> findList(String statement, UsermarkQuery usermarkQuery) throws ServiceException {
		return usermarkDao.findList(statement, usermarkQuery);
	}
}
