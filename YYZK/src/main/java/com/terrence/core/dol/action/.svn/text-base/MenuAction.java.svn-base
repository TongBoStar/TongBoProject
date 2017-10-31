package com.terrence.core.dol.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;

import com.base.BaseAction;
import com.base.util.JsonUtil;
import com.terrence.core.dol.bean.Menu;
import com.terrence.core.dol.bean.MenuOperate;
import com.terrence.core.dol.query.MenuOperateQuery;
import com.terrence.core.dol.query.MenuQuery;
import com.terrence.core.dol.service.IMenuOperateService;
import com.terrence.core.dol.service.IMenuService;
import com.terrence.core.dol.service.IRolePowerService;
import com.terrence.crm.dol.utils.CacheService;
import com.terrence.crm.dol.utils.SpringSecurityUtils;

@Scope("prototype")
@Namespace("/menu")
public class MenuAction extends BaseAction{
	private static final long serialVersionUID = -392975404376665408L;
	
	@Autowired
	@Qualifier("menuService")
	private IMenuService menuService;
	
	@Autowired
	@Qualifier("menuOperateService")
	private IMenuOperateService menuOperateService;
	
	@Autowired
	@Qualifier("rolePowerService")
	private IRolePowerService rolePowerService;
	
	private Menu menu;
	
	private MenuQuery menuQuery;
	private Long pId;
	private String menuMark;
	public void showList() throws NumberFormatException, IOException{
		if(null==menuQuery){
			menuQuery = new MenuQuery();
		}
		if(null==getUserInfo()){
			response.getWriter().print("false");
		}else{
			//if(CacheService.getInstance().get("MenuTree")==null){
				menuQuery.setEmpId(getUserInfo().getAdminId());
				menuQuery.setSortColumns(" sort asc ");
				List<Menu> list = menuService.findShowList(menuQuery);
				//List<Menu> list = SpringSecurityUtils.getCurrentUserAuthority();
				//CacheService.getInstance().add("MenuTree", toGridPageJson(Long.parseLong(list.size()+""),list));
				response.getWriter().print(toGridPageJson(Long.parseLong(list.size()+""),list));
			//}else{
			//	response.getWriter().print(CacheService.getInstance().get("MenuTree"));
			//}
		}
	}
	public void markSession() throws IOException{
		request.getSession().setAttribute("menuMark", menuMark);
		response.getWriter().print("success");
	}
	public void list() throws Exception {
		//当前角色 目前角色都只能设置1个
//		String roleIds = getSysUser().getRoleIds().replace(",", "");
//				
//		SysRolePowerQuery SysRolePowerQuery = new  SysRolePowerQuery();
//		SysRolePowerQuery.setRoleId(Long.parseLong(roleIds));
//		List<SysRolePower> sysRolePowerList =  sysRolePowerService.findList(SysRolePowerQuery);
//		String ids="";
//		for(SysRolePower sysRolePower:sysRolePowerList){
//			ids = ids + sysRolePower.getMenuId()+",";
//		}
//		
//		//临时方案
//		SysMenuQuery query = new SysMenuQuery();
//		query.setLayers(4);
//		List<SysMenu> listMenus = sysMenuService.findList(query);
//		for(SysMenu menu : listMenus){
//			ids = ids + menu.getId()+",";
//		}
		
		if(null==menuQuery){
			menuQuery = new MenuQuery();
		}
//		sysMenuQuery.setIds(ids+"0");
		List<Menu> list = menuService.findList(menuQuery);
		menuQuery.setSortColumns(" sort asc ");
		
		response.getWriter().print(JsonUtil.getListJson(list));
	}
   	
   	public void treeGrid() throws IOException{
   		if(null==menuQuery){
   			menuQuery = new MenuQuery();
		}
   		menuQuery.setSortColumns(" id desc ");
   		List<Menu> list = menuService.findList(menuQuery);
   		if(list!=null&&list.size()>0){
   			for(int i=0;i<list.size();i++){
   				if(list.get(i).getId()!=null){
   					MenuOperateQuery menuOperateQuery = new MenuOperateQuery();
   	   				menuOperateQuery.setMenuId(list.get(i).getId());
   	   				List<MenuOperate> operates = new ArrayList<MenuOperate>();
   	   				operates = menuOperateService.findList(menuOperateQuery);
   	   				if(operates!=null&&operates.size()>0){
   	   					list.get(i).setOperates(operates);
   	   				}
   				}
   				
   			}
   		}
   		response.getWriter().print("["+toTreeGridJson(formatTree(list,0L))+"]");
   	}
   	
   	public void tree() throws IOException{
   		if(null==menuQuery){
   			menuQuery = new MenuQuery();
		}
		List<Menu> list = menuService.findList(menuQuery);
		response.getWriter().print("["+toTreeJson(formatTree(list,pId))+"]");
	}
   	
   	public String toGridPageJson(Long totalCount,List<Menu> list){
		StringBuffer sbResult = new StringBuffer();
		
		sbResult.append("{\"total\":").append(totalCount).append(",");
		sbResult.append("\"rows\":[");
		int listSize = list.size();
		for(int i=0;i<listSize;i++){
			Menu menuEntity = list.get(i);
			sbResult.append("{");
			sbResult.append("\"id\":").append(menuEntity.getId()).append(",");
			sbResult.append("\"keywords\":\"").append(menuEntity.getKeywords()).append("\",");
			sbResult.append("\"name\":\"").append(menuEntity.getName()).append("\",");
			sbResult.append("\"code\":\"").append(menuEntity.getCode()).append("\",");
			sbResult.append("\"pCode\":\"").append(menuEntity.getpCode()).append("\",");
			sbResult.append("\"pId\":").append(menuEntity.getpId()).append(",");
			sbResult.append("\"url\":\"").append(menuEntity.getUrl()).append("\",");
			sbResult.append("\"iconCls\":\"").append(menuEntity.getIconCls()).append("\",");
			sbResult.append("\"sort\":").append(menuEntity.getSort()).append(",");
			sbResult.append("\"iconFont\":\"").append(menuEntity.getIconFont()).append("\",");
			sbResult.append("\"layers\":").append(menuEntity.getLayers()).append(",");
			sbResult.append("\"iconColor\":\"").append(menuEntity.getIconColor()).append("\",");
			sbResult.append("\"showPosition\":\"").append(menuEntity.getShowPosition()).append("\"");
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

   	public String toTreeGridJson(List<Menu> list){
   		StringBuffer sbResult = new StringBuffer();
   		int listSize = list.size();
		for(int i=0;i<listSize;i++){
			Menu menuEntity = list.get(i);
			sbResult.append("{");
			sbResult.append("\"id\":").append(menuEntity.getId()).append(",");
			sbResult.append("\"keywords\":\"").append(menuEntity.getKeywords()).append("\",");
			sbResult.append("\"name\":\"").append(menuEntity.getName()).append("\",");
			sbResult.append("\"code\":\"").append(menuEntity.getCode()).append("\",");
			sbResult.append("\"pCode\":\"").append(menuEntity.getpCode()).append("\",");
			sbResult.append("\"pId\":").append(menuEntity.getpId()).append(",");
			sbResult.append("\"url\":\"").append(menuEntity.getUrl()).append("\",");
			sbResult.append("\"iconCls\":\"").append(menuEntity.getIconCls()).append("\",");
			sbResult.append("\"sort\":").append(menuEntity.getSort()).append(",");
			sbResult.append("\"iconFont\":\"").append(menuEntity.getIconFont()).append("\",");
			sbResult.append("\"layers\":").append(menuEntity.getLayers()).append(",");
			sbResult.append("\"iconColor\":\"").append(menuEntity.getIconColor()).append("\",");
			sbResult.append("\"showPosition\":\"").append(menuEntity.getShowPosition()).append("\"");
			if(menuEntity.getChildren().size()>0){
				sbResult.append(",\"children\":["+toTreeGridJson(menuEntity.getChildren())+"]");
			}
			
			if(menuEntity.getOperates()!=null&&menuEntity.getOperates().size()>0){
				sbResult.append(",\"operates\":["+toOperatesJson(menuEntity.getOperates())+"]");
			}else{
				sbResult.append(",\"operates\":\"").append("null").append("\"");
			}
			if(i==(listSize-1)){
				sbResult.append("}");
			}else{
				sbResult.append("},");
			}
		}
   		return sbResult.toString();
   	}
   	public String toOperatesJson(List<MenuOperate> list){
		StringBuffer sbResult = new StringBuffer();
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
		return sbResult.toString();
	}
   	public String toTreeJson(List<Menu> list){
		StringBuffer sbResult = new StringBuffer();
   		int listSize = list.size();
		for(int i=0;i<listSize;i++){
			Menu menuEntity = list.get(i);
			sbResult.append("{");
			sbResult.append("\"id\":\"").append(menuEntity.getId()).append("\",");
			sbResult.append("\"pid\":\"").append(menuEntity.getpId()).append("\",");
			sbResult.append("\"text\":\"").append(menuEntity.getName()).append("\",");
			sbResult.append("\"attributes\":{");
			sbResult.append("\"url\":\"").append(menuEntity.getUrl()).append("\"");
			sbResult.append("}");
			if(menuEntity.getChildren().size()>0){
				sbResult.append(",\"children\":["+toTreeJson(menuEntity.getChildren())+"]");
			}
			if(i==(listSize-1)){
				sbResult.append("}");
			}else{
				sbResult.append("},");
			}
		}
   		return sbResult.toString();
	}
   	
   	public List<Menu> formatTree(List<Menu> list,Long pId) {
    	List<Menu> returnList = new ArrayList<Menu>();
    	for(Menu menu : list){
    		if(pId.equals(menu.getpId())){
    			List<Menu> childList = formatTree(list,menu.getId());
    			menu.setChildren(childList);
    			returnList.add(menu);
    		}
    	}
    	return returnList;
    }
   	
	public MenuQuery getMenuQuery() {
		return menuQuery;
	}

	public void setMenuQuery(MenuQuery menuQuery) {
		this.menuQuery = menuQuery;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Long getpId() {
		return pId;
	}

	public void setpId(Long pId) {
		this.pId = pId;
	}
	public String getMenuMark() {
		return menuMark;
	}
	public void setMenuMark(String menuMark) {
		this.menuMark = menuMark;
	}
}