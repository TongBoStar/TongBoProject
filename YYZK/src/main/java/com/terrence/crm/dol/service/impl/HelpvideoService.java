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
import com.terrence.crm.dol.bean.Helpvideo;
import com.terrence.crm.dol.dao.IHelpvideoDao;
import com.terrence.crm.dol.query.HelpvideoQuery;
import com.terrence.crm.dol.service.IHelpvideoService;
@Service
@Transactional
public class HelpvideoService extends BaseService implements IHelpvideoService {
	@Autowired
	@Qualifier("helpvideoDao")
	private IHelpvideoDao helpvideoDao;
	@Override
	public Helpvideo getById(Long id) throws ServiceException {
		return helpvideoDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Helpvideo entity) throws ServiceException {
		helpvideoDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Helpvideo entity) throws ServiceException {
		return helpvideoDao.save(entity);
	}
	@Override
	public Integer update(Helpvideo entity) throws ServiceException {
		return helpvideoDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return helpvideoDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = helpvideoDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Helpvideo> findPage(Page<Helpvideo> page, HelpvideoQuery query) throws ServiceException{
		return helpvideoDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Helpvideo> findPage(Page<Helpvideo> page,String statement, HelpvideoQuery query) throws ServiceException{
		return helpvideoDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Helpvideo> findList(HelpvideoQuery query) throws ServiceException{
		return helpvideoDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Helpvideo> findList(HelpvideoQuery query,Integer pageSize) throws ServiceException{
		return helpvideoDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Helpvideo> findList(HelpvideoQuery query,String statement,Integer pageSize) throws ServiceException{
		return helpvideoDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Helpvideo> findAllList() throws ServiceException{
		return helpvideoDao.findAllList();
	}
}
