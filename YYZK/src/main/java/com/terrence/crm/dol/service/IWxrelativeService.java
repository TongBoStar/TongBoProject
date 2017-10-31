package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Wxrelative;
import com.terrence.crm.dol.query.WxrelativeQuery;

public interface IWxrelativeService {
	public Wxrelative getById(Long id) throws ServiceException;
	public void saveOrUpdate(Wxrelative entity) throws ServiceException;
	public Long save(Wxrelative entity) throws ServiceException;
	public Integer update(Wxrelative entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Wxrelative> findPage(Page<Wxrelative> page, WxrelativeQuery query) throws ServiceException;
	public Page<Wxrelative> findPage(Page<Wxrelative> page,String statement, WxrelativeQuery query) throws ServiceException;
	public List<Wxrelative> findList(WxrelativeQuery query) throws ServiceException;
	public List<Wxrelative> findList(WxrelativeQuery query,Integer pageSize) throws ServiceException;
	public List<Wxrelative> findList(WxrelativeQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Wxrelative> findAllList() throws ServiceException;
}
