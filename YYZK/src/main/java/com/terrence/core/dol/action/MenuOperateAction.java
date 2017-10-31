package com.terrence.core.dol.action;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;

import com.base.BaseAction;
import com.terrence.core.dol.bean.MenuOperate;
import com.terrence.core.dol.query.MenuOperateQuery;
import com.terrence.core.dol.service.IMenuOperateService;
import com.terrence.crm.dol.base.core.Page;

@Scope("prototype")
@Namespace("/menuoperate")
public class MenuOperateAction extends BaseAction {

	private static final long serialVersionUID = -1170145168680752788L;

	@Autowired
	@Qualifier("menuOperateService")
	private IMenuOperateService menuOperateService;

	private MenuOperate menuOperate;
	private MenuOperateQuery menuOperateQuery;
	private Page<MenuOperate> menuOperatePage = new Page<MenuOperate>();

	public void list() throws NumberFormatException, IOException{
		if(null==menuOperateQuery){
			menuOperateQuery = new MenuOperateQuery();
		}
		List<MenuOperate> list = menuOperateService.findList(menuOperateQuery);
		response.getWriter().print(toGridPageJson(Long.parseLong(list.size()+""),list));
	}
	
	public void showList() throws NumberFormatException, IOException{
		if(null==menuOperateQuery){
			menuOperateQuery = new MenuOperateQuery();
		}
		menuOperateQuery.setEmpId(getUserInfo().getAdminId());
		menuOperateQuery.setSortColumns(" id asc ");
		List<MenuOperate> list = menuOperateService.findMenuOperateList(menuOperateQuery);
		response.getWriter().print(toGridPageJson(Long.parseLong(list.size()+""),list));
	}
	
	public String toGridPageJson(Long totalCount,List<MenuOperate> list){
		StringBuffer sbResult = new StringBuffer();
		
		sbResult.append("{\"total\":").append(totalCount).append(",");
		sbResult.append("\"rows\":[");
		int listSize = list.size();
		for(int i=0;i<listSize;i++){
			MenuOperate menuOperateEntity = list.get(i);
			sbResult.append("{");
			sbResult.append("\"id\":").append(menuOperateEntity.getId()).append(",");
			sbResult.append("\"menuId\":").append(menuOperateEntity.getMenuId()).append(",");
			sbResult.append("\"name\":\"").append(menuOperateEntity.getName()).append("\",");
			sbResult.append("\"functionName\":\"").append(menuOperateEntity.getFunctionName()).append("\",");
			sbResult.append("\"iconCls\":\"").append(menuOperateEntity.getIconCls()).append("\",");
			sbResult.append("\"remark\":\"").append(menuOperateEntity.getRemark()).append("\"");
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
	
	public MenuOperate getMenuOperate() {
		return menuOperate;
	}

	public void setMenuOperate(MenuOperate menuOperate) {
		this.menuOperate = menuOperate;
	}

	public MenuOperateQuery getMenuOperateQuery() {
		return menuOperateQuery;
	}

	public void setMenuOperateQuery(MenuOperateQuery menuOperateQuery) {
		this.menuOperateQuery = menuOperateQuery;
	}

	public Page<MenuOperate> getMenuOperatePage() {
		return menuOperatePage;
	}

	public void setMenuOperatePage(Page<MenuOperate> menuOperatePage) {
		this.menuOperatePage = menuOperatePage;
	}
}
