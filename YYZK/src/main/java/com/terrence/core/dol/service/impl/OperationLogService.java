package com.terrence.core.dol.service.impl;

import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.OperationLog;
import com.terrence.core.dol.dao.IOperationLogDao;
import com.terrence.core.dol.query.OperationLogQuery;
import com.terrence.core.dol.service.IOperationLogService;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.core.Page;

@Service
@Transactional
public class OperationLogService extends BaseService implements IOperationLogService {

	@Autowired
	@Qualifier("operationLogDao")
	private IOperationLogDao operationLogDao;

	@Override
	public OperationLog getById(Long id) throws ServiceException {
		return operationLogDao.getById(id);
	}

	@Override
	public void saveOrUpdate(OperationLog entity) throws ServiceException {
		
	}

	public Long save(String ip,String companyName,Long empId,String empUserName,String empLoginName,String moduleName,String operateType,String operateDescription){
		OperationLog entity = new OperationLog();
		entity.setEmpId(empId);
		entity.setEmpLoginName(empLoginName);
		entity.setEmpUserName(empUserName);
		entity.setModuleName(moduleName);
		entity.setOperateType(operateType);
		entity.setIp(ip);
		entity.setOperateDescription(operateDescription);
		entity.setMachineName(companyName);
		//entity.setOperateDate(new Date());
		return operationLogDao.save(entity);
	}
	
	@Override
	public Long save(OperationLog entity) throws ServiceException {
		return operationLogDao.save(entity);
	}
	public Long save(String moduleName,String operateType,String operateDescription) throws Exception{
		return operationLogDao.save(moduleName, operateType, operateDescription);
	}
	@Override
	public Integer update(OperationLog entity) throws ServiceException {
		return operationLogDao.update(entity);
	}

	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return operationLogDao.deleteById(id);
	}

	@Override
	public Page<OperationLog> findPage(Page<OperationLog> page,
			OperationLogQuery query) throws ServiceException {
		return operationLogDao.findPage(page, query);
	}

	@Override
	public List<OperationLog> findList(OperationLogQuery query)
			throws ServiceException {
		return operationLogDao.findList(query);
	}
}