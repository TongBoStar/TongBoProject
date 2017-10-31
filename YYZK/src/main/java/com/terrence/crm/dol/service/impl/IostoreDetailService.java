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
import com.terrence.crm.dol.bean.IostoreDetail;
import com.terrence.crm.dol.dao.IIostoreDetailDao;
import com.terrence.crm.dol.query.IostoreDetailQuery;
import com.terrence.crm.dol.service.IIostoreDetailService;
@Service
@Transactional
public class IostoreDetailService extends BaseService implements IIostoreDetailService {
	@Autowired
	@Qualifier("iostoreDetailDao")
	private IIostoreDetailDao iostoreDetailDao;
	@Override
	public IostoreDetail getById(Long id) throws ServiceException {
		return iostoreDetailDao.getById(id);
	}
	@Override
	public void saveOrUpdate(IostoreDetail entity) throws ServiceException {
		iostoreDetailDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(IostoreDetail entity) throws ServiceException {
		return iostoreDetailDao.save(entity);
	}
	@Override
	public Integer update(IostoreDetail entity) throws ServiceException {
		return iostoreDetailDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return iostoreDetailDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = iostoreDetailDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<IostoreDetail> findPage(Page<IostoreDetail> page, IostoreDetailQuery query) throws ServiceException{
		return iostoreDetailDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<IostoreDetail> findPage(Page<IostoreDetail> page,String statement, IostoreDetailQuery query) throws ServiceException{
		return iostoreDetailDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<IostoreDetail> findList(IostoreDetailQuery query) throws ServiceException{
		return iostoreDetailDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<IostoreDetail> findList(IostoreDetailQuery query,Integer pageSize) throws ServiceException{
		return iostoreDetailDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<IostoreDetail> findList(IostoreDetailQuery query,String statement,Integer pageSize) throws ServiceException{
		return iostoreDetailDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<IostoreDetail> findAllList() throws ServiceException{
		return iostoreDetailDao.findAllList();
	}
}
