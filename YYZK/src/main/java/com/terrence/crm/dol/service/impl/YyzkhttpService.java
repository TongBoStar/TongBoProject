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
import com.terrence.crm.dol.bean.Yyzkhttp;
import com.terrence.crm.dol.dao.IYyzkhttpDao;
import com.terrence.crm.dol.query.YyzkhttpQuery;
import com.terrence.crm.dol.service.IYyzkhttpService;
@Service
@Transactional
public class YyzkhttpService extends BaseService implements IYyzkhttpService {
	@Autowired
	@Qualifier("yyzkhttpDao")
	private IYyzkhttpDao yyzkhttpDao;
	@Override
	public Yyzkhttp getById(Long id) throws ServiceException {
		return yyzkhttpDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Yyzkhttp entity) throws ServiceException {
		yyzkhttpDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Yyzkhttp entity) throws ServiceException {
		return yyzkhttpDao.save(entity);
	}
	@Override
	public Integer update(Yyzkhttp entity) throws ServiceException {
		return yyzkhttpDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return yyzkhttpDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = yyzkhttpDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Yyzkhttp> findPage(Page<Yyzkhttp> page, YyzkhttpQuery query) throws ServiceException{
		return yyzkhttpDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Yyzkhttp> findPage(Page<Yyzkhttp> page,String statement, YyzkhttpQuery query) throws ServiceException{
		return yyzkhttpDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Yyzkhttp> findList(YyzkhttpQuery query) throws ServiceException{
		return yyzkhttpDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Yyzkhttp> findList(YyzkhttpQuery query,Integer pageSize) throws ServiceException{
		return yyzkhttpDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yyzkhttp> findList(YyzkhttpQuery query,String statement,Integer pageSize) throws ServiceException{
		return yyzkhttpDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yyzkhttp> findAllList() throws ServiceException{
		return yyzkhttpDao.findAllList();
	}
}
