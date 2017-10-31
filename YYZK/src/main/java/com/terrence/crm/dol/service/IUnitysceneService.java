package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Unityscene;
import com.terrence.crm.dol.query.UnitysceneQuery;

public interface IUnitysceneService {
	public Unityscene getById(Long id) throws ServiceException;
	public void saveOrUpdate(Unityscene entity) throws ServiceException;
	public Long save(Unityscene entity) throws ServiceException;
	public Integer update(Unityscene entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Unityscene> findPage(Page<Unityscene> page, UnitysceneQuery query) throws ServiceException;
	public Page<Unityscene> findPage(Page<Unityscene> page,String statement, UnitysceneQuery query) throws ServiceException;
	public List<Unityscene> findList(UnitysceneQuery query) throws ServiceException;
	public List<Unityscene> findList(UnitysceneQuery query,Integer pageSize) throws ServiceException;
	public List<Unityscene> findList(UnitysceneQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Unityscene> findAllList() throws ServiceException;
}
