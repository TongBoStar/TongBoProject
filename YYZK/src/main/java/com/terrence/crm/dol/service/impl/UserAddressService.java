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
import com.terrence.crm.dol.bean.UserAddress;
import com.terrence.crm.dol.dao.IUserAddressDao;
import com.terrence.crm.dol.query.UserAddressQuery;
import com.terrence.crm.dol.service.IUserAddressService;
@Service
@Transactional
public class UserAddressService extends BaseService implements IUserAddressService {
	@Autowired
	@Qualifier("userAddressDao")
	private IUserAddressDao userAddressDao;
	@Override
	public UserAddress getById(Long id) throws ServiceException {
		return userAddressDao.getById(id);
	}
	@Override
	public void saveOrUpdate(UserAddress entity) throws ServiceException {
		userAddressDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(UserAddress entity) throws ServiceException {
		return userAddressDao.save(entity);
	}
	@Override
	public Integer update(UserAddress entity) throws ServiceException {
		return userAddressDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return userAddressDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = userAddressDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<UserAddress> findPage(Page<UserAddress> page, UserAddressQuery query) throws ServiceException{
		return userAddressDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<UserAddress> findPage(Page<UserAddress> page,String statement, UserAddressQuery query) throws ServiceException{
		return userAddressDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<UserAddress> findList(UserAddressQuery query) throws ServiceException{
		return userAddressDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<UserAddress> findList(UserAddressQuery query,Integer pageSize) throws ServiceException{
		return userAddressDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<UserAddress> findList(UserAddressQuery query,String statement,Integer pageSize) throws ServiceException{
		return userAddressDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<UserAddress> findAllList() throws ServiceException{
		return userAddressDao.findAllList();
	}
}
