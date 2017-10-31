package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Yyinventory;
import com.terrence.crm.dol.query.YyinventoryQuery;

public interface IYyinventoryService {
	public Yyinventory getById(Long id) throws ServiceException;
	public void saveOrUpdate(Yyinventory entity) throws ServiceException;
	public Long save(Yyinventory entity) throws ServiceException;
	public Integer update(Yyinventory entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Yyinventory> findPage(Page<Yyinventory> page, YyinventoryQuery query) throws ServiceException;
	public Page<Yyinventory> findPage(Page<Yyinventory> page,String statement, YyinventoryQuery query) throws ServiceException;
	public List<Yyinventory> findList(YyinventoryQuery query) throws ServiceException;
	public List<Yyinventory> findList(YyinventoryQuery query,Integer pageSize) throws ServiceException;
	public List<Yyinventory> findList(YyinventoryQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Yyinventory> findAllList() throws ServiceException;
}
