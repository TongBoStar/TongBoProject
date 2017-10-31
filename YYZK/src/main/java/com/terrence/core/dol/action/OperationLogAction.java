package com.terrence.core.dol.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import com.terrence.core.dol.bean.OperationLog;
import com.terrence.core.dol.query.OperationLogQuery;
import com.terrence.core.dol.service.IOperationLogService;
import com.terrence.crm.dol.action.BaseAction;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;

@Scope("prototype")
@Namespace("/operationlog")
public class OperationLogAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 861218190128965056L;
	
	@Autowired
	private IOperationLogService pressDataService;
	
	private OperationLogQuery operationLogQuery;
	/** Json操作信息 */
	private String[] resultInfo = new String[2];
	
	/** 分页器 */
	private Page<OperationLog> page = new Page<OperationLog>();
	/**
	 * 分页查询日志
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.DESC);
		}
		if(operationLogQuery == null) {
			operationLogQuery = new OperationLogQuery();
		}
		try {
			page = pressDataService.findPage(page, operationLogQuery);
			resultInfo[0] = "0";
			resultInfo[1] = "查询列表成功";
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询列表失败";
		}
		return SUCCESS;
	}
	public String listToJson() throws Exception {
		try {
			list();			
		} catch(Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询列表失败";
		}
		return "json";
	}
	public Page<OperationLog> getPage() {
		return page;
	}
	public void setPage(Page<OperationLog> page) {
		this.page = page;
	}
	public OperationLogQuery getOperationLogQuery() {
		return operationLogQuery;
	}
	public void setOperationLogQuery(OperationLogQuery operationLogQuery) {
		this.operationLogQuery = operationLogQuery;
	}
	public String[] getResultInfo() {
		return resultInfo;
	}
	public void setResultInfo(String[] resultInfo) {
		this.resultInfo = resultInfo;
	}
}