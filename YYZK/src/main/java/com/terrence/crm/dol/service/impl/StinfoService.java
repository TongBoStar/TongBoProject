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
import com.terrence.crm.dol.bean.Stinfo;
import com.terrence.crm.dol.dao.IStinfoDao;
import com.terrence.crm.dol.query.StinfoQuery;
import com.terrence.crm.dol.service.IStinfoService;
@Service
@Transactional
public class StinfoService extends BaseService implements IStinfoService {
	@Autowired
	@Qualifier("stinfoDao")
	private IStinfoDao stinfoDao;
	@Override
	public Stinfo getById(Long id) throws ServiceException {
		return stinfoDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Stinfo entity) throws ServiceException {
		synchronized (StinfoService.class) {
			Stinfo stinfo = stinfoDao.getByProperty("serialNumber", entity.getSerialNumber());
			if(null!=stinfo){
				entity.setId(stinfo.getId());
				update(entity);
			}else{
				save(entity);
			}
		}
	}
	@Override
	public Long save(Stinfo entity) throws ServiceException {
		return stinfoDao.save(entity);
	}
	@Override
	public Integer update(Stinfo entity) throws ServiceException {
		return stinfoDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return stinfoDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = stinfoDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Stinfo> findPage(Page<Stinfo> page, StinfoQuery query) throws ServiceException{
		return stinfoDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Stinfo> findPage(Page<Stinfo> page,String statement, StinfoQuery query) throws ServiceException{
		return stinfoDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Stinfo> findList(StinfoQuery query) throws ServiceException{
		return stinfoDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Stinfo> findList(StinfoQuery query,Integer pageSize) throws ServiceException{
		return stinfoDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Stinfo> findList(StinfoQuery query,String statement,Integer pageSize) throws ServiceException{
		return stinfoDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Stinfo> findAllList() throws ServiceException{
		return stinfoDao.findAllList();
	}
}
