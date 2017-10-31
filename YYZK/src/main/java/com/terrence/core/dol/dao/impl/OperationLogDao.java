package com.terrence.core.dol.dao.impl;

import java.util.Date;

import org.apache.struts2.ServletActionContext;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.base.BaseIbatisDao;
import com.base.util.SpringSecurityUtil;
import com.terrence.core.dol.bean.OperationLog;
import com.terrence.core.dol.dao.IOperationLogDao;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.ClientInfo;
import com.terrence.crm.dol.utils.DateConvertUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;

@Repository
public class OperationLogDao extends BaseIbatisDao<OperationLog, java.lang.Long> implements IOperationLogDao {

	@Override
	public String getIbatisSqlMapNamespace() {
		return "OperationLog";
	}

	@Override
	public void saveOrUpdate(OperationLog entity) throws DataAccessException {
		if(null!=entity.getId()){
			save(entity);
		}else{
			update(entity);
		}
	}
	@Override
	public Long save(String moduleName,String operateType,String operateDescription) throws ServiceException {
		ClientInfo clientInfo = (ClientInfo)ServletActionContext.getRequest().getSession().getAttribute("ClientInfo");
		OperationLog entity = new OperationLog();
		entity.setEmpId(SpringSecurityUtils.getCurrentUserId());
		entity.setEmpLoginName(SpringSecurityUtils.getCurrentUserName());
		entity.setEmpUserName(SpringSecurityUtils.getCurrentRealName());
		entity.setModuleName(moduleName);
		entity.setOperateType(operateType);
		entity.setIp(clientInfo.getIp());
		entity.setMachineName(clientInfo.getComputerName());
		entity.setOperateDescription(operateDescription);
		entity.setOperateDate(DateConvertUtils.parse(new Date(), "yyyy-MM-dd HH:mm:ss"));
		return save(entity);
	}
}