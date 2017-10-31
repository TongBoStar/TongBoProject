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
import com.terrence.crm.dol.bean.Order;
import com.terrence.crm.dol.dao.IOrderDao;
import com.terrence.crm.dol.query.OrderQuery;
import com.terrence.crm.dol.service.IOrderService;
@Service
@Transactional
public class OrderService extends BaseService implements IOrderService {
	@Autowired
	@Qualifier("orderDao")
	private IOrderDao orderDao;
	@Override
	public Order getById(Long id) throws ServiceException {
		return orderDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Order entity) throws ServiceException {
		orderDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Order entity) throws ServiceException {
		return orderDao.save(entity);
	}
	@Override
	public Integer update(Order entity) throws ServiceException {
		return orderDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return orderDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = orderDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Order> findPage(Page<Order> page, OrderQuery query) throws ServiceException{
		return orderDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Order> findPage(Page<Order> page,String statement, OrderQuery query) throws ServiceException{
		return orderDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Order> findList(OrderQuery query) throws ServiceException{
		return orderDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Order> findList(OrderQuery query,Integer pageSize) throws ServiceException{
		return orderDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Order> findList(OrderQuery query,String statement,Integer pageSize) throws ServiceException{
		return orderDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Order> findAllList() throws ServiceException{
		return orderDao.findAllList();
	}
}
