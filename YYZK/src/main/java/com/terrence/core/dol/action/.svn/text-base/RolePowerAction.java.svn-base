package com.terrence.core.dol.action;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;

import com.base.BaseAction;
import com.base.util.JsonUtil;
import com.base.util.StringUtil;
import com.terrence.core.dol.bean.RolePower;
import com.terrence.core.dol.query.RolePowerQuery;
import com.terrence.core.dol.service.IRolePowerService;

@Scope("prototype")
@Namespace("/rolepower")
public class RolePowerAction extends BaseAction{

	private static final long serialVersionUID = 6730700030010051659L;

	@Autowired
	@Qualifier("rolePowerService")
	private IRolePowerService rolePowerService;

	private RolePower rolePower;
	private RolePowerQuery rolePowerQuery;
	
	private String[] rolePowerArray;
	
	private String menuIds;
	
	public void list() throws Exception {
		if(null==rolePowerQuery){
			rolePowerQuery = new RolePowerQuery();
		}
		List<RolePower> list = rolePowerService.findList(rolePowerQuery);
		response.getWriter().print(JsonUtil.getListJson(list));
	}
	
	public void operateList() throws IOException{
		if(null==rolePowerQuery){
			rolePowerQuery = new RolePowerQuery();
		}
//		rolePowerQuery.setRoleId(getUserInfo().getRoleList().get(0).getId());
		rolePowerQuery.setCode("operate");
		List<RolePower> list = rolePowerService.findList(rolePowerQuery);
		response.getWriter().print(JsonUtil.getListJson(list));
	}
	
	public void save() throws IOException{
		try {
			rolePowerService.save(rolePower,rolePowerArray);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		resultMsg.put("msg", "授权成功！");
		response.getWriter().print(JsonUtil.getResultJson(resultMsg));
	}
	
	public String getMenuIds() {
		return menuIds;
	}

	public void setMenuIds(String menuIds) {
		this.menuIds = menuIds;
	}

	public RolePower getRolePower() {
		return rolePower;
	}

	public void setRolePower(RolePower rolePower) {
		this.rolePower = rolePower;
	}

	public RolePowerQuery getRolePowerQuery() {
		return rolePowerQuery;
	}

	public void setRolePowerQuery(RolePowerQuery rolePowerQuery) {
		this.rolePowerQuery = rolePowerQuery;
	}

	public String[] getRolePowerArray() {
		return rolePowerArray;
	}

	public void setRolePowerArray(String[] rolePowerArray) {
		this.rolePowerArray = rolePowerArray;
	}
}