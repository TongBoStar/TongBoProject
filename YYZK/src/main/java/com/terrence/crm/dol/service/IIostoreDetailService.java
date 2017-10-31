package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.IostoreDetail;
import com.terrence.crm.dol.query.IostoreDetailQuery;

public interface IIostoreDetailService {
	public IostoreDetail getById(Long id) throws ServiceException;
	public void saveOrUpdate(IostoreDetail entity) throws ServiceException;
	public Long save(IostoreDetail entity) throws ServiceException;
	public Integer update(IostoreDetail entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<IostoreDetail> findPage(Page<IostoreDetail> page, IostoreDetailQuery query) throws ServiceException;
	public Page<IostoreDetail> findPage(Page<IostoreDetail> page,String statement, IostoreDetailQuery query) throws ServiceException;
	public List<IostoreDetail> findList(IostoreDetailQuery query) throws ServiceException;
	public List<IostoreDetail> findList(IostoreDetailQuery query,Integer pageSize) throws ServiceException;
	public List<IostoreDetail> findList(IostoreDetailQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<IostoreDetail> findAllList() throws ServiceException;
}
