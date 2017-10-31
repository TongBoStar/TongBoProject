package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Helpvideo;
import com.terrence.crm.dol.query.HelpvideoQuery;

public interface IHelpvideoService {
	public Helpvideo getById(Long id) throws ServiceException;
	public void saveOrUpdate(Helpvideo entity) throws ServiceException;
	public Long save(Helpvideo entity) throws ServiceException;
	public Integer update(Helpvideo entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Helpvideo> findPage(Page<Helpvideo> page, HelpvideoQuery query) throws ServiceException;
	public Page<Helpvideo> findPage(Page<Helpvideo> page,String statement, HelpvideoQuery query) throws ServiceException;
	public List<Helpvideo> findList(HelpvideoQuery query) throws ServiceException;
	public List<Helpvideo> findList(HelpvideoQuery query,Integer pageSize) throws ServiceException;
	public List<Helpvideo> findList(HelpvideoQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Helpvideo> findAllList() throws ServiceException;
}
