package com.terrence.core.dol.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.OperationLog;
import com.terrence.core.dol.query.OperationLogQuery;
import com.terrence.crm.dol.base.core.Page;

public interface IOperationLogService {
	public OperationLog getById(java.lang.Long id) throws ServiceException;

	public void saveOrUpdate(OperationLog entity) throws ServiceException;

	public java.lang.Long save(OperationLog entity) throws ServiceException;

	public Integer update(OperationLog entity) throws ServiceException;

	public Integer deleteById(java.lang.Long id) throws ServiceException;

	public Page<OperationLog> findPage(Page<OperationLog> page, OperationLogQuery query) throws ServiceException;

	public List<OperationLog> findList(OperationLogQuery query) throws ServiceException;
	
	public Long save(String ip,String companyName,Long empId,String empUserName,String empLoginName,String moduleName,String operateType,String operateDescription);
}