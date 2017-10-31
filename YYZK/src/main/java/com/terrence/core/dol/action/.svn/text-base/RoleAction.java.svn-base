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
import com.terrence.core.dol.bean.Role;
import com.terrence.core.dol.query.RoleQuery;
import com.terrence.core.dol.service.IRoleService;
import com.terrence.crm.dol.base.core.Page;

@Scope("prototype")
@Namespace("/role")
public class RoleAction extends BaseAction{

	private static final long serialVersionUID = 4436342821586721798L;

	@Autowired
	@Qualifier("roleService")
	private IRoleService roleService;

   	private Role role;
   	private RoleQuery roleQuery;
   	private Page<Role> rolePage = new Page<Role>();
   	
   	
   	public void list() throws Exception {
		if(null==roleQuery){
			roleQuery = new RoleQuery();
		}
		List<Role> list = roleService.findList(roleQuery);
		response.getWriter().print(JsonUtil.getListJson(list));
	}
   	
   	
   	
   	public void treeGrid() throws IOException{
   		if(null==roleQuery){
			roleQuery = new RoleQuery();
		}
   		roleQuery.setSortColumns(" id desc ");
   		List<Role> list = roleService.findList(roleQuery);
   		response.getWriter().print(JsonUtil.getGridJson(formatTree(list,0L)));
   	}

	public void tree() throws IOException{
   		if(null==roleQuery){
			roleQuery = new RoleQuery();
		}
		List<Role> list = roleService.findList(roleQuery);
		response.getWriter().print("["+toTreeJson(formatTree(list,0L))+"]");
	}

	public String toTreeJson(List<Role> list){
		StringBuffer sbResult = new StringBuffer();
   		int listSize = list.size();
		for(int i=0;i<listSize;i++){
			Role roleEntity = list.get(i);
			sbResult.append("{");
			sbResult.append("\"id\":\"").append(roleEntity.getId()).append("\",");
			sbResult.append("\"pid\":\"").append(roleEntity.getpId()).append("\",");
			sbResult.append("\"text\":\"").append(roleEntity.getName()).append("\"");
			if(roleEntity.getChildren().size()>0){
				sbResult.append(",\"children\":["+toTreeJson(roleEntity.getChildren())+"]");
			}
			if(i==(listSize-1)){
				sbResult.append("}");
			}else{
				sbResult.append("},");
			}
		}
   		return sbResult.toString();
	}
	
	public List<Role> formatTree(List<Role> list,Long pId) {
    	List<Role> returnList = new ArrayList<Role>();
    	for(Role role : list){
    		if(pId.equals(role.getpId())){
    			List<Role> childList = formatTree(list,role.getId());
    			role.setChildren(childList);
    			returnList.add(role);
    		}
    	}
    	return returnList;
    }
   	
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public RoleQuery getRoleQuery() {
		return roleQuery;
	}

	public void setRoleQuery(RoleQuery roleQuery) {
		this.roleQuery = roleQuery;
	}

	public Page<Role> getRolePage() {
		return rolePage;
	}

	public void setRolePage(Page<Role> rolePage) {
		this.rolePage = rolePage;
	}
}