package com.terrence.core.dol.action;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;

import com.base.BaseAction;
import com.base.util.DateUtil;
import com.base.util.JsonUtil;
import com.terrence.core.dol.bean.Menu;
import com.terrence.core.dol.bean.Msg;
import com.terrence.core.dol.query.MsgQuery;
import com.terrence.core.dol.service.IMsgService;
import com.terrence.crm.dol.base.core.Page;

@Scope("prototype")
@Namespace("/msg")
public class MsgAction extends BaseAction{

	private static final long serialVersionUID = 125908287095391075L;

	@Autowired
	@Qualifier("msgService")
	private IMsgService msgService;

	private Msg msg;
	private MsgQuery msgQuery;
	private Page<Msg> msgPage = new Page<Msg>();
	private Integer page;
	private Integer rows;
   
	public void list() throws Exception {
//		msgPage.setPageNo(this.getDraw()==0?1:this.getDraw());
		
		if(null==msgQuery){
			msgQuery = new MsgQuery();
		}
		msgQuery.setToUserId(getUserInfo().getAdminId());
		msgPage = msgService.findPage(msgPage, msgQuery);
		response.getWriter().print(JsonUtil.getGridPageJson(msgPage.getTotalCount(), msgPage.getResult()));
	}
	
	public void getCount() throws IOException{
		if(null==msgQuery){
			msgQuery = new MsgQuery();
		}
		msgQuery.setToUserId(getUserInfo().getAdminId());
		Long count = msgService.getCount(msgQuery);
		response.getWriter().print("{\"total\":"+count+"}");
	}
	
	public void pageList() throws IOException{
		if(null==msgQuery){
			msgQuery = new MsgQuery();
		}
		msgPage.setPageNo(page.equals(0)?0:this.getPage());
		msgPage.setPageSize(rows.equals(0)?0:this.getRows());
		msgQuery.setToUserId(getUserInfo().getAdminId());
		msgQuery.setSortColumns(" receiveTime desc ");
		msgPage = msgService.findPage(msgPage, msgQuery);
		response.getWriter().print(toGridPageJson(msgPage.getTotalCount() ,msgPage.getResult()));
	}
	
	@Action(value="read")
	public void read() throws IOException{
		msg = msgService.getById(msgQuery.getId());
		msg.setState(1);
		msgService.update(msg);
		resultMsg.put("success", true);
		response.getWriter().print(JsonUtil.getResultJson(resultMsg));
	}
	
	/**
	 * 生成json
	 * @param totalCount
	 * @param list
	 * @return
	 */
	public String toGridPageJson(Long totalCount,List<Msg> list){
		StringBuffer sbResult = new StringBuffer();
		sbResult.append("{\"total\":").append(totalCount).append(",");
		sbResult.append("\"rows\":[");
		int listSize = list.size();
		for(int i=0;i<listSize;i++){
			Msg msgEntity = list.get(i);
			sbResult.append("{");
			sbResult.append("\"id\":").append(msgEntity.getId()).append(",");
			sbResult.append("\"toUserId\":").append(msgEntity.getToUserId()).append(",");
			sbResult.append("\"details\":\"").append(msgEntity.getDetails()).append("\",");
			sbResult.append("\"state\":").append(msgEntity.getState()).append(",");
			sbResult.append("\"url\":\"").append(msgEntity.getUrl()).append("\",");
			sbResult.append("\"receiveTime\":\"").append(DateUtil.DateToStr(DateUtil.yyyy_MM_dd_HH_mm_ss, msgEntity.getReceiveTime())).append("\",");
			sbResult.append("\"isDel\":").append(msgEntity.getIsDel()).append(",");
			sbResult.append("\"menuId\":").append(msgEntity.getMenuId()).append("");
			
			Menu menuEntity = msgEntity.getMenu();
			if(null!=menuEntity.getId()){
				sbResult.append(",\"menu\":{");
				sbResult.append("\"id\":").append(menuEntity.getId()).append(",");
				sbResult.append("\"name\":\"").append(menuEntity.getName()).append("\",");
				sbResult.append("\"code\":\"").append(menuEntity.getCode()).append("\",");
				sbResult.append("\"pCode\":\"").append(menuEntity.getpCode()).append("\",");
				sbResult.append("\"pId\":").append(menuEntity.getpId()).append(",");
				sbResult.append("\"url\":\"").append(menuEntity.getUrl()).append("\",");
				sbResult.append("\"iconCls\":\"").append(menuEntity.getIconCls()).append("\",");
				sbResult.append("\"sort\":").append(menuEntity.getSort()).append(",");
				sbResult.append("\"iconFont\":\"").append(menuEntity.getIconFont()).append("\",");
				sbResult.append("\"layers\":").append(menuEntity.getLayers()).append(",");
				sbResult.append("\"iconColor\":\"").append(menuEntity.getIconColor()).append("\"");
				sbResult.append("}");
			}
			
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

	public Msg getMsg() {
		return msg;
	}

	public void setMsg(Msg msg) {
		this.msg = msg;
	}

	public MsgQuery getMsgQuery() {
		return msgQuery;
	}

	public void setMsgQuery(MsgQuery msgQuery) {
		this.msgQuery = msgQuery;
	}

	public Page<Msg> getMsgPage() {
		return msgPage;
	}

	public void setMsgPage(Page<Msg> msgPage) {
		this.msgPage = msgPage;
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