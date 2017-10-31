package com.terrence.crm.dol.service.impl;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Gameinfo;
import com.terrence.crm.dol.dao.IGameinfoDao;
import com.terrence.crm.dol.query.GameinfoQuery;
import com.terrence.crm.dol.service.IGameinfoService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class GameinfoService extends BaseService implements IGameinfoService {
	@Autowired
	@Qualifier("gameinfoDao")
	private IGameinfoDao gameinfoDao;
	@Override
	public Gameinfo getById(Long id) throws ServiceException {
		return gameinfoDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Gameinfo entity) throws ServiceException {
		entity.setCreateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
		entity.setCreateUserId(SpringSecurityUtils.getCurrentUserId());
		gameinfoDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Gameinfo entity) throws ServiceException {
		return gameinfoDao.save(entity);
	}
	@Override
	public Integer update(Gameinfo entity) throws ServiceException {
		return gameinfoDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return gameinfoDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = gameinfoDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Gameinfo> findPage(Page<Gameinfo> page, GameinfoQuery query) throws ServiceException{
		return gameinfoDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Gameinfo> findPage(Page<Gameinfo> page,String statement, GameinfoQuery query) throws ServiceException{
		return gameinfoDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Gameinfo> findList(GameinfoQuery query) throws ServiceException{
		return gameinfoDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Gameinfo> findList(GameinfoQuery query,Integer pageSize) throws ServiceException{
		return gameinfoDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Gameinfo> findList(GameinfoQuery query,String statement,Integer pageSize) throws ServiceException{
		return gameinfoDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Gameinfo> findAllList() throws ServiceException{
		return gameinfoDao.findAllList();
	}
}
