package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.UserAddress;
import com.terrence.crm.dol.query.UserAddressQuery;

public interface IUserAddressService {
	public UserAddress getById(Long id) throws ServiceException;
	public void saveOrUpdate(UserAddress entity) throws ServiceException;
	public Long save(UserAddress entity) throws ServiceException;
	public Integer update(UserAddress entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<UserAddress> findPage(Page<UserAddress> page, UserAddressQuery query) throws ServiceException;
	public Page<UserAddress> findPage(Page<UserAddress> page,String statement, UserAddressQuery query) throws ServiceException;
	public List<UserAddress> findList(UserAddressQuery query) throws ServiceException;
	public List<UserAddress> findList(UserAddressQuery query,Integer pageSize) throws ServiceException;
	public List<UserAddress> findList(UserAddressQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<UserAddress> findAllList() throws ServiceException;
}
