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
import com.terrence.crm.dol.bean.Yqcode;
import com.terrence.crm.dol.dao.IYqcodeDao;
import com.terrence.crm.dol.query.YqcodeQuery;
import com.terrence.crm.dol.service.IYqcodeService;
@Service
@Transactional
public class YqcodeService extends BaseService implements IYqcodeService {
	@Autowired
	@Qualifier("yqcodeDao")
	private IYqcodeDao yqcodeDao;
	@Override
	public Yqcode getById(Long id) throws ServiceException {
		return yqcodeDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Yqcode entity) throws ServiceException {
		yqcodeDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Yqcode entity) throws ServiceException {
		return yqcodeDao.save(entity);
	}
	@Override
	public Integer update(Yqcode entity) throws ServiceException {
		return yqcodeDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return yqcodeDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = yqcodeDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Yqcode> findPage(Page<Yqcode> page, YqcodeQuery query) throws ServiceException{
		return yqcodeDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Yqcode> findPage(Page<Yqcode> page,String statement, YqcodeQuery query) throws ServiceException{
		return yqcodeDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Yqcode> findList(YqcodeQuery query) throws ServiceException{
		return yqcodeDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Yqcode> findList(YqcodeQuery query,Integer pageSize) throws ServiceException{
		return yqcodeDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yqcode> findList(YqcodeQuery query,String statement,Integer pageSize) throws ServiceException{
		return yqcodeDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yqcode> findAllList() throws ServiceException{
		return yqcodeDao.findAllList();
	}
}
