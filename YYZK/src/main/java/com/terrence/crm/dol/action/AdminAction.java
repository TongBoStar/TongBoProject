/*
 * 
 */
package com.terrence.crm.dol.action;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import com.terrence.core.dol.bean.Role;
import com.terrence.core.dol.query.RoleQuery;
import com.terrence.core.dol.service.IRoleService;
import com.terrence.crm.dol.base.CrudActionSupport;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.base.utils.Struts2Utils;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.bean.security.AdminSession;
import com.terrence.crm.dol.query.AdminQuery;
import com.terrence.crm.dol.service.IAdminService;
import com.terrence.crm.dol.utils.SpringSecurityUtils;

/**
 * 管理员服务控制
 * 
 * @version 1.0
 */
@Namespace("/admin")
public class AdminAction extends CrudActionSupport<Admin>  implements ApplicationContextAware{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4040358917381501706L;

	/** 管理员服务访问接口 */
	@Autowired
	@Qualifier("adminService")
	private IAdminService adminService;
	
	@Autowired
	@Qualifier("roleService")
	private IRoleService roleService;
	
	private ApplicationContext ctx;
	/** 管理员 */
	private Admin entity;
	/** 管理员查询类 */
	private AdminQuery adminQuery;
	
	/** 管理员编号  */
	private java.lang.Long adminId;
	
	private Page<Admin> page;
	private List<java.lang.Long> checkedIdList;
	/** Json操作信息 */
	private String[] resultInfo = new String[2];
	private	List<Admin> adminList;
	private	List allUser;
	
	/**
	 * 管理员列表
	 * @return
	 * @throws Exception
	 */

	//==========================================================================	
	public String list() throws Exception {
		if (!page.isOrderBySetted()) {
			page.setOrderBy("adminId");
			page.setOrder(Page.DESC);
		}

		if(adminQuery == null) {
			adminQuery = new AdminQuery();
		}
		
		try {
			page = adminService.findPage(page, adminQuery);
			
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

	public String addAdmin()throws Exception
	{
		Admin admin = new Admin();
		try{
			RoleQuery roleQuery=new RoleQuery();
			List<Role> roleList = roleService.findList(roleQuery);
			List<Map<String, Object>> treeList = convertRolesTree(roleList);
			admin.setRolesTreeList(treeList);
			Struts2Utils.renderJson(admin);
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson(e.getMessage());
		} catch (Exception e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson("查询角色失败！");
		}
		return null;
	}
	/**
	 * 管理员信息
	 */
	public String input() throws Exception {
		try {
			
			Admin admin = new Admin();
			if(adminId != null) {
				//admin = adminService.getById(adminId);
				Admin minad = new Admin();
				minad.setAdminId(adminId);
				admin = adminService.findById(minad);
			}
			
			List<Role> roleList = roleService.findAllByAdminId(adminId);
			List<Map<String, Object>> treeList = convertRolesTree(roleList);
			admin.setRolesTreeList(treeList);
			Struts2Utils.renderJson(admin);
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson(e.getMessage());
		} catch (Exception e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson("查询管理员失败！");
		}
		return null;
	}
	public String show()throws Exception
	{
		try
		{
			entity = adminService.getById(adminId);
			Struts2Utils.renderJson(entity);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	@Action("/system/showAdmin")	
	public String showAdmin()throws Exception
	{
		try
		{
			entity = adminService.getById(adminId);
			resultInfo[0] = "0";
			resultInfo[1] = "查询成功";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			resultInfo[0] = "0";
			resultInfo[1] = "查询失败";
		}
		return JSON;
	}
	public Admin getAdmin() {
		AdminSession adminSession = SpringSecurityUtils.getCurrentUser();
		if(adminSession == null || adminSession.getAdmin() == null) {
			logger.error(" admin not found ");
			return null;
		}
		return adminSession.getAdmin();
	}
	/**
	 * 保存管理员信息
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception {
		try {
			String method = getRequest().getMethod();  
			if (!"post".equalsIgnoreCase(method)) {  
				logger.error("非法提交");
				Struts2Utils.renderJson("非法提交！");
				return null;
			} 
			
			Admin admin = getAdmin();
			if(admin == null) {
				logger.error("用户没有登录");
				Struts2Utils.renderJson("用户没有登录！");
				return null;
			}
			if(entity.getAdminId() != null && entity.getAdminId() == 1) {
				if(admin.getAdminId() != 1) {
					logger.error("不是超级管理员不能修改！");
					Struts2Utils.renderJson("不是超级管理员不能修改！");
					return null;
				}
			}
			adminService.saveOrUpdate(entity);
			Struts2Utils.renderJson(SUCCESS);
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson(e.getMessage());
		} catch (Exception e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson("保存管理员信息失败！");
		}
		return RELOAD;
	}
	
	/**
	 * 删除管理员
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
		try {
			String method = getRequest().getMethod();  
			if (!"post".equalsIgnoreCase(method)) {  
				logger.error("非法提交");
				Struts2Utils.renderJson("非法提交！");
				return null;
			} 
			
			adminService.deleteByMultipleId(checkedIdList);
			Struts2Utils.renderJson(SUCCESS);
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson(e.getMessage());
		} catch (Exception e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson("删除管理员信息失败！");
		}
		return null;
	}
	
	private List<Map<String, Object>> convertRolesTree(List<Role> roleList) throws Exception
	{
		List<Map<String, Object>> rolesTreeList = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", 0);
		map.put("pId", -1);
		map.put("name", "所有角色");
		map.put("open", true);
		map.put("nocheck", false);
		
		List<Map<String, Object>> childrenList = new ArrayList<Map<String, Object>>();
		for(Role role: roleList) {
			Map<String, Object> childrenMap = new HashMap<String, Object>();
			childrenMap.put("id", role.getId());
			childrenMap.put("pId", 0);
			childrenMap.put("name", role.getName());
			childrenMap.put("open", true);
			childrenMap.put("nocheck", false);
			
			if(role.getAdminRoles().size()>0&&role.getAdminRoles().iterator().next().getAdminId() != null) {
				childrenMap.put("checked", true);
			}
			
			childrenList.add(childrenMap);
		}
		map.put("children", childrenList);
		rolesTreeList.add(map);
		return rolesTreeList;
	}
//---自定义方法------------------------------------------------------	
	//---查询列表---------------------
	@Action("/system/adminList")	
	public String adminList() throws Exception {
			adminList = adminService.findList(adminQuery);
			Struts2Utils.renderJson(adminList);
			return null;
	}
	/**
	 * 通过部门查找用户
	 * @return
	 * @throws Exception
	 */
	@Action("/system/findListByDepart")	
	public String findListByDepart() throws Exception {
			adminList = adminService.findListByDepart(adminQuery);
			Struts2Utils.renderJson(adminList);
			return null;
	}
	@Action("/system/listfindAdmin")	
	public String listfindAdmin() throws Exception {
			adminList = adminService.listfindAdmin(adminQuery);
			Struts2Utils.renderJson(adminList);
			return null;
	}
	@Action("/system/findAdminById")	
	public String findAdminById()throws Exception{
		adminList=adminService.findAdminId(adminQuery);
		return JSON;
   }
	
	@Action("/system/adminListName")	
	public String adminListName() throws Exception {
			if (page==null) {
				page=new Page<Admin>();
				page.setOrder(Page.DESC);
				page.setPageSize(20);
			}
	
			if(adminQuery == null) {
				adminQuery = new AdminQuery();
			}
			try {
				page= adminService.findPage(page, adminQuery);
			} catch (Exception e) {
				e.printStackTrace();
			}
			Struts2Utils.renderJson(page.getResult());
			return null;
	}
	
	
	
	@Action("/admin/adminTongERP")
	public String syncAdminERPData() throws Exception {
		try{
			adminService.syncAdminERPData();
//			resultInfo[0] = "0";
//			resultInfo[1] = "同步成功";
			Struts2Utils.renderJson("同步成功");
		} catch(ServiceException e){
			logger.warn("param error ", e);
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
			Struts2Utils.renderJson("同步失败");
		} catch(Exception e){
			logger.warn("param error ", e);
			resultInfo[0] = "-1";
			resultInfo[1] = "同步失败";
			Struts2Utils.renderJson("同步失败");
		}	
		
		return null;
	}
	
	/**
	 * 查询采购部人员
	* <p>Description: </p>
	* @author yjb
	* @date 2015-10-19下午03:20:25
	 */
	@Action("/system/findAdminProcurement")
	public String findAdminProcurement() throws Exception {
		if(adminQuery == null) {
			adminQuery = new AdminQuery();
		}
		try {
		adminList = adminService.findAdminProcurement(adminQuery);
			
			resultInfo[0] = "0";
			resultInfo[1] = "查询成功";
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询失败";
		}
		return JSON;
	}
//---------------------------------------------------------	
	/**2013-08-12  自定义方法   物料管理，修改中的模糊查询**/
	public String findAdminId()throws Exception{
			adminList=adminService.findAdminId(adminQuery);
			Struts2Utils.renderJson(adminList);
		return null;
	}
//----------------------------------------------------------	
	/**
	 * 根据微信号查询用户
	 * @return
	 * @throws Exception
	 */
	public String checkAdminToJson() throws Exception {
		try {
			entity = (Admin)getRequest().getSession().getAttribute("sadmin");
			if(null==entity){
				adminService.getById(1L);
				entity = adminService.checkAdminByWxCode(adminQuery,getRequest());
				if(null==entity.getAdminId()){
					entity = adminService.checkAdminByWxCode(adminQuery,getRequest());
				}
				getRequest().getSession().setAttribute("sadmin", entity);
				getRequest().getSession().setAttribute("ctx", getRequest().getContextPath());
			}
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
		return JSON;
	}
	public String loadAdminByWxCode(){
		try {
			entity = adminService.findAdminByWxCode(adminQuery);
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
		return JSON;
	}
	public void prepareUpdateAdminByWxcode() throws Exception {
		prepareModel();
	}
	public String updateAdminByWxcode(){
		try {
			AdminQuery adminQuery2 = new AdminQuery();
    		adminQuery2.setAdminId(2L);
    		adminService.findList(adminQuery2);
			adminService.updateAdminByWxcode(entity);
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
		return JSON;
	}
	public String updateAgreeByWxcode(){
		try {
			AdminQuery adminQuery2 = new AdminQuery();
    		adminQuery2.setAdminId(2L);
    		adminService.findList(adminQuery2);
			adminService.updateAgreeByWxcode(adminQuery);
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
		return JSON;
	}
	public void setAdminQuery(AdminQuery adminQuery) {
		this.adminQuery = adminQuery;
	}

	public void setAdminId(java.lang.Long adminId) {
		this.adminId = adminId;
	}

	public void setPage(Page<Admin> page) {
		this.page = page;
	}

	public Page<Admin> getPage() {
		return page;
	}

	public java.lang.Long getAdminId() {
		return adminId;
	}

	public AdminQuery getAdminQuery() {
		return adminQuery;
	}

	public void setEntity(Admin entity) {
		this.entity = entity;
	}

	public Admin getEntity() {
		return entity;
	}

	public List<Admin> getAdminList() {
		return adminList;
	}

	public void setAdminList(List<Admin> adminList) {
		this.adminList = adminList;
	}

	public List getAllUser() {
		return allUser;
	}

	public void setAllUser(List allUser) {
		this.allUser = allUser;
	}

	public List<java.lang.Long> getCheckedIdList() {
		return checkedIdList;
	}

	public void setCheckedIdList(List<java.lang.Long> checkedIdList) {
		this.checkedIdList = checkedIdList;
	}
	public String listToJson() throws Exception {
		
		try {
			list();			
		} catch(Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询列表失败";
		}
		return JSON;
	}
	//----------
	@Action("/system/showToAdm")
	public String listToAdm() throws Exception {
		
		try {
			list();			
		} catch(Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询列表失败";
		}
		return JSON;
	}
	@Override
	public Admin getModel() {
		return entity;
	}

	@Override
	public void setApplicationContext(ApplicationContext ctx)
			throws BeansException {
		this.ctx = ctx;
		
	}

	@Override
	public String saveToJson() throws Exception {
		try {
			save();
				
		} catch(Exception e) {
			logger.error(e.getMessage());
			
			resultInfo[0] = "-1";
			resultInfo[1] = "操作失败";
		}
		return JSON;
	}
	public void prepareSaveAdmin() throws Exception {
		prepareModel();
	}
	/**
	 * 保存管理员信息
	 * @return
	 * @throws Exception
	 */
	public String saveAdmin() throws Exception {
		try {
			adminService.saveAdmin(entity);
			resultInfo[0] = "0";
			resultInfo[1] = "查询列表成功";
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			resultInfo[0] = "1";
			resultInfo[1] = "保存失败:"+e.getMessage();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "1";
			resultInfo[1] = "保存失败:"+e.getMessage();
		}
		return JSON;
	}
	@Override
	public String deleteToJson() throws Exception {
		try {
			delete();
			
		} catch(Exception e) {
			logger.error(e.getMessage());
			
			resultInfo[0] = "-1";
			resultInfo[1] = "删除失败";
		}
		return JSON;
	}

	@Override
	@Action("/system/showToAdmin")
	public String showToJson() throws Exception {
		try {
			show();
		} catch(Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询失败";
		}
		return JSON;
	}

	@Override
	protected void prepareModel() throws Exception {
		if (adminId != null ) {
			entity = adminService.getById(adminId);
		} else {
			entity = new Admin();
		}
	}
	//----------------------------
	public void prepareShowpwd() throws Exception {
		prepareModel();
	}
	@Action("/usercenter/showpwd")
	public String showpwd() throws Exception{
		//当前密码比对
		try {
			AdminSession adminSession = SpringSecurityUtils.getCurrentUser();
			System.out.println("entity:"+entity.toString());
			Integer compare=adminService.comparePwd(adminSession.getAdmin(),entity.getPassword());
			if(compare.intValue()==1){
				resultInfo[0] = "1";
				resultInfo[1] = "当前密码正确！";
				Struts2Utils.renderJson(resultInfo);
			}else{
				resultInfo[0] = "-1";
				resultInfo[1] = "当前密码不正确！";
				Struts2Utils.renderJson(resultInfo);
			}
		} catch(Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "当前密码不正确！";
			Struts2Utils.renderJson(resultInfo);
		}
		return null;
	}
	public void prepareUpdatepwdwx() throws Exception {
		prepareModel();
	}
	@Action("/usercenter/updatepwdwx")
	public String updatepwdwx() throws Exception {
		try {
			String method = getRequest().getMethod();  
			if (!"post".equalsIgnoreCase(method)) {  
				logger.error("非法提交");
				Struts2Utils.renderJson("非法提交！");
				return null;
			} 
			
			Admin adm=adminService.getById(adminId);
			adm.setPassword(entity.getPassword());
			adminService.updatePwd(adm);
			Struts2Utils.renderJson(SUCCESS);
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson(e.getMessage());
		} catch (Exception e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson("修改密码失败！");
		}
		return null;
	}	
	public void prepareUpdatepwd() throws Exception {
		prepareModel();
	}
	@Action("/usercenter/updatepwd")
	public String updatepwd() throws Exception {
		try {
			String method = getRequest().getMethod();  
			if (!"post".equalsIgnoreCase(method)) {  
				logger.error("非法提交");
				Struts2Utils.renderJson("非法提交！");
				return null;
			} 
			
			Admin admin = getAdmin();
			if(admin == null) {
				logger.error("用户没有登录");
				Struts2Utils.renderJson("用户没有登录！");
				return null;
			}
			AdminSession adminSession = SpringSecurityUtils.getCurrentUser();
			Admin adm=adminSession.getAdmin();
			adm.setPassword(entity.getPassword());
			adminService.updatePwd(adm);
			Struts2Utils.renderJson(SUCCESS);
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson(e.getMessage());
		} catch (Exception e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson("修改密码失败！");
		}
		return null;
	}	
	@Action("/system/adminListadminName")
	public String adminListadminName() throws Exception {
		adminList = adminService.findList(adminQuery);
		// Struts2Utils.renderJson(adminList);
		return JSON;
	}
	@Action("/adminFind/adminlistfind")
	public String adminlistfind() throws Exception {// 查询，每次十条

		try {
			adminList = adminService.listfindAdmin(adminQuery);

			resultInfo[0] = "0";
			resultInfo[1] = "查询列表成功";
		} catch (ServiceException e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询列表失败";
		}
		return JSON;
	}
	public void prepareAxamineYunQuUser() throws Exception {
		prepareModel();
	}
	public String examineYunQuUser(){
    	try {
    		AdminQuery adminQuery2 = new AdminQuery();
    		adminQuery2.setAdminId(2L);
    		adminService.findList(adminQuery2);
			adminService.examineYunQuUser(entity);
			resultInfo[0] = "0";
			resultInfo[1] = "查询列表成功";
		} catch (ServiceException e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询列表失败";
		}
		return JSON;
	}
	public String wxlogin(){
    	try {
    		AdminQuery adminQuery2 = new AdminQuery();
    		adminQuery2.setAdminId(2L);
    		adminService.findList(adminQuery2);
			adminService.wxlogin(adminQuery,getRequest());
			resultInfo[0] = "0";
			resultInfo[1] = "登录成功";
		} catch (ServiceException e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "登录失败"+e.getMessage();
		}
		return JSON;
	}
	@Action("/usercenter/resetpwd")
	public String resetpwd() throws Exception {
		try {
			String method = getRequest().getMethod();  
			if (!"post".equalsIgnoreCase(method)) {  
				logger.error("非法提交");
				Struts2Utils.renderJson("非法提交！");
				return null;
			} 
			Admin admin = getAdmin();
			if(admin == null) {
				logger.error("用户没有登录");
				Struts2Utils.renderJson("用户没有登录！");
				return null;
			}
			Admin adminu = null;
			for(Long id:checkedIdList){
				adminu = adminService.getById(id);
				adminu.setPassword("123456");
				adminService.updatePwd(adminu);
			}
			Struts2Utils.renderJson(SUCCESS);
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson(e.getMessage());
		} catch (Exception e) {
			logger.error(e.getMessage());
			Struts2Utils.renderJson("修改密码失败！");
		}
		return null;
	}	
	public String[] getResultInfo() {
		return resultInfo;
	}

	public void setResultInfo(String[] resultInfo) {
		this.resultInfo = resultInfo;
	}
}
