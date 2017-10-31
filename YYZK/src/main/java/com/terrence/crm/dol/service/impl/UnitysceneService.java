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
import com.terrence.crm.dol.bean.Unityscene;
import com.terrence.crm.dol.dao.IUnitysceneDao;
import com.terrence.crm.dol.query.UnitysceneQuery;
import com.terrence.crm.dol.service.IUnitysceneService;
@Service
@Transactional
public class UnitysceneService extends BaseService implements IUnitysceneService {
	@Autowired
	@Qualifier("unitysceneDao")
	private IUnitysceneDao unitysceneDao;
	@Override
	public Unityscene getById(Long id) throws ServiceException {
		return unitysceneDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Unityscene entity) throws ServiceException {
		unitysceneDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Unityscene entity) throws ServiceException {
		return unitysceneDao.save(entity);
	}
	@Override
	public Integer update(Unityscene entity) throws ServiceException {
		return unitysceneDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return unitysceneDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = unitysceneDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Unityscene> findPage(Page<Unityscene> page, UnitysceneQuery query) throws ServiceException{
		return unitysceneDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Unityscene> findPage(Page<Unityscene> page,String statement, UnitysceneQuery query) throws ServiceException{
		return unitysceneDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Unityscene> findList(UnitysceneQuery query) throws ServiceException{
		return unitysceneDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Unityscene> findList(UnitysceneQuery query,Integer pageSize) throws ServiceException{
		return unitysceneDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Unityscene> findList(UnitysceneQuery query,String statement,Integer pageSize) throws ServiceException{
		return unitysceneDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Unityscene> findAllList() throws ServiceException{
		return unitysceneDao.findAllList();
	}
}
