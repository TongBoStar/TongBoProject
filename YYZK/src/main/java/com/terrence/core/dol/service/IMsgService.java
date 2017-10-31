package com.terrence.core.dol.service;

import java.util.List;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.Msg;
import com.terrence.core.dol.query.MsgQuery;
import com.terrence.crm.dol.base.core.Page;

public interface IMsgService {

	public Msg getById(java.lang.Long id) throws ServiceException;
	
	public void saveOrUpdate(Msg entity) throws ServiceException;
	
	public java.lang.Long save(Msg entity) throws ServiceException;
	
	public Integer update(Msg entity) throws ServiceException;
	
	public Integer deleteById(java.lang.Long id) throws ServiceException;
	
	public Page<Msg> findPage(Page<Msg> page, MsgQuery query) throws ServiceException;
	
	public List<Msg> findList(MsgQuery query) throws ServiceException;
	
	public void sendMsg(String toUserIds,String details,Long menuId);
	
	public Long getCount(MsgQuery msgQuery) throws ServiceException;
}
