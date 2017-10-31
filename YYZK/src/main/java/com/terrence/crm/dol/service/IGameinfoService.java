package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Gameinfo;
import com.terrence.crm.dol.query.GameinfoQuery;

public interface IGameinfoService {
	public Gameinfo getById(Long id) throws ServiceException;
	public void saveOrUpdate(Gameinfo entity) throws ServiceException;
	public Long save(Gameinfo entity) throws ServiceException;
	public Integer update(Gameinfo entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Gameinfo> findPage(Page<Gameinfo> page, GameinfoQuery query) throws ServiceException;
	public Page<Gameinfo> findPage(Page<Gameinfo> page,String statement, GameinfoQuery query) throws ServiceException;
	public List<Gameinfo> findList(GameinfoQuery query) throws ServiceException;
	public List<Gameinfo> findList(GameinfoQuery query,Integer pageSize) throws ServiceException;
	public List<Gameinfo> findList(GameinfoQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Gameinfo> findAllList() throws ServiceException;
}
