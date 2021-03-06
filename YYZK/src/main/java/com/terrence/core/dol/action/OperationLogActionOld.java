package com.terrence.core.dol.action;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;

import com.base.BaseAction;
import com.base.util.DateUtil;
import com.base.util.JsonUtil;
import com.terrence.core.dol.bean.OperationLog;
import com.terrence.core.dol.query.OperationLogQuery;
import com.terrence.core.dol.service.IOperationLogService;
import com.terrence.crm.dol.base.core.Page;

@Scope("prototype")
@Namespace("/operationlogold")
public class OperationLogActionOld extends BaseAction{
	
	private static final long serialVersionUID = 1809985790350955235L;

	@Autowired
	@Qualifier("operationLogService")
	private IOperationLogService operationLogService;

	private OperationLog operationLog;
   	private OperationLogQuery operationLogQuery;

	private Page<OperationLog> operationLogPage = new Page<OperationLog>();
	private Integer page;
	private Integer rows;

	public void pageList() throws IOException{
		if(null==operationLogQuery){
			operationLogQuery = new OperationLogQuery();
		}
		operationLogPage.setPageNo(page.equals(0)?0:this.getPage());
		operationLogPage.setPageSize(rows.equals(0)?0:this.getRows());
		operationLogQuery.setSortColumns(" id desc ");
		operationLogPage = operationLogService.findPage(operationLogPage, operationLogQuery);
		response.getWriter().print(toGridPageJson(operationLogPage.getTotalCount() ,operationLogPage.getResult()));
	}

	public void save() throws IOException{
		if(null != operationLog && null == operationLog.getId()){
			operationLogService.save(operationLog);
			resultMsg.put("type", "add");
			resultMsg.put("msg", "新增联系人成功！");
		}else{
			OperationLog entity = operationLogService.getById(operationLog.getId());
			entity.setId(operationLog.getId());
			entity.setEmpId(operationLog.getEmpId());
			operationLogService.update(entity);
			resultMsg.put("type", "edit");
			resultMsg.put("msg","修改联系人成功！");
		}
		response.getWriter().print(JsonUtil.getResultJson(resultMsg));
	}

	public void delete() throws IOException{
		if(null != operationLog && null != operationLog.getId()){
			operationLogService.deleteById(operationLog.getId());
			resultMsg.put("msg","删除联系人成功！");
		}else{
			resultMsg.put("msg","请选择要删除的联系人！");
		}
		response.getWriter().print(JsonUtil.getResultJson(resultMsg));
	}

	public String toGridPageJson(Long totalCount,List<OperationLog> list){
		StringBuffer sbResult = new StringBuffer();
		sbResult.append("{\"total\":").append(totalCount).append(",");
		sbResult.append("\"rows\":[");
		int listSize = list.size();
		for(int i=0;i<listSize;i++){
			OperationLog operationLogEntity = list.get(i);
			sbResult.append("{");
			sbResult.append("\"id\":").append(operationLogEntity.getId()).append(",");
			sbResult.append("\"empId\":").append(operationLogEntity.getEmpId()).append(",");
			sbResult.append("\"empUserName\":\"").append(operationLogEntity.getEmpUserName()).append("\",");
			sbResult.append("\"moduleName\":\"").append(operationLogEntity.getModuleName()).append("\",");
			sbResult.append("\"ip\":\"").append(operationLogEntity.getIp()).append("\",");
			sbResult.append("\"machineName\":\"").append(operationLogEntity.getMachineName()).append("\",");
			sbResult.append("\"operateDate\":\"").append(DateUtil.DateToStr(DateUtil.yyyy_MM_dd_HH_mm_ss, operationLogEntity.getOperateDate())).append("\",");
			sbResult.append("\"empLoginName\":\"").append(operationLogEntity.getEmpLoginName()).append("\",");
			sbResult.append("\"operateType\":\"").append(operationLogEntity.getOperateType()).append("\",");
			sbResult.append("\"operateDescription\":\"").append(operationLogEntity.getOperateDescription()).append("\"");
			if(i==(listSize-1)){
				sbResult.append("}");
			}else{
				sbResult.append("},");
			}
		}
		sbResult.append("]");
		sbResult.append("}");
		return sbResult.toString();
	}

	public OperationLog getOperationLog() {
		return operationLog;
	}

	public void setOperationLog(OperationLog operationLog) {
		this.operationLog = operationLog;
	}

	public OperationLogQuery getOperationLogQuery() {
		return operationLogQuery;
	}

	public void setOperationLogQuery(OperationLogQuery operationLogQuery) {
		this.operationLogQuery = operationLogQuery;
	}

	public Page<OperationLog> getOperationLogPage() {
		return operationLogPage;
	}

	public void setOperationLogPage(Page<OperationLog> operationLogPage) {
		this.operationLogPage = operationLogPage;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}
}