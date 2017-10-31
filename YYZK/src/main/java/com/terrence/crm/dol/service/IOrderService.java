package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Order;
import com.terrence.crm.dol.query.OrderQuery;

public interface IOrderService {
	public Order getById(Long id) throws ServiceException;
	public void saveOrUpdate(Order entity) throws ServiceException;
	public Long save(Order entity) throws ServiceException;
	public Integer update(Order entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Order> findPage(Page<Order> page, OrderQuery query) throws ServiceException;
	public Page<Order> findPage(Page<Order> page,String statement, OrderQuery query) throws ServiceException;
	public List<Order> findList(OrderQuery query) throws ServiceException;
	public List<Order> findList(OrderQuery query,Integer pageSize) throws ServiceException;
	public List<Order> findList(OrderQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Order> findAllList() throws ServiceException;
}
