package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Stcode;
import com.terrence.crm.dol.query.StcodeQuery;

public interface IStcodeService {
	public Stcode getById(Long id) throws ServiceException;
	public void saveOrUpdate(Stcode entity) throws ServiceException;
	public Long save(Stcode entity) throws ServiceException;
	public Integer update(Stcode entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Stcode> findPage(Page<Stcode> page, StcodeQuery query) throws ServiceException;
	public Page<Stcode> findPage(Page<Stcode> page,String statement, StcodeQuery query) throws ServiceException;
	public List<Stcode> findList(StcodeQuery query) throws ServiceException;
	public List<Stcode> findList(StcodeQuery query,Integer pageSize) throws ServiceException;
	public List<Stcode> findList(StcodeQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Stcode> findAllList() throws ServiceException;
	public Stcode findStCode(StcodeQuery stcodeQuery) throws ServiceException;
	public List<Stcode> findList(String string, StcodeQuery stcodeQuery) throws ServiceException;
	public Integer update(String statement, Stcode entity);
}
