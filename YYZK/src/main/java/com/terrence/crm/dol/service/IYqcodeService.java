package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Yqcode;
import com.terrence.crm.dol.query.YqcodeQuery;

public interface IYqcodeService {
	public Yqcode getById(Long id) throws ServiceException;
	public void saveOrUpdate(Yqcode entity) throws ServiceException;
	public Long save(Yqcode entity) throws ServiceException;
	public Integer update(Yqcode entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Yqcode> findPage(Page<Yqcode> page, YqcodeQuery query) throws ServiceException;
	public Page<Yqcode> findPage(Page<Yqcode> page,String statement, YqcodeQuery query) throws ServiceException;
	public List<Yqcode> findList(YqcodeQuery query) throws ServiceException;
	public List<Yqcode> findList(YqcodeQuery query,Integer pageSize) throws ServiceException;
	public List<Yqcode> findList(YqcodeQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Yqcode> findAllList() throws ServiceException;
}
