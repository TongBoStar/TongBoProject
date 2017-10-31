/*
 * 
 */
package com.terrence.crm.dol.action;


import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Scope;

import com.terrence.crm.dol.base.CrudActionSupport;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.AdminRole;
import com.terrence.crm.dol.query.AdminRoleQuery;
import com.terrence.crm.dol.service.IAdminRoleService;

/**
 * 
 * 
 * @version 1.0
 */
@Scope("prototype")
@Namespace("/adminRole")
@Results( { @Result(name = CrudActionSupport.RELOAD, location = "adminRole." + CrudActionSupport.ACTIONSUFFIX + "?page.pageRequest=${page.pageRequest}", type = "redirect")})
public class AdminRoleAction extends CrudActionSupport<AdminRole>  implements ApplicationContextAware{
	
	
	@Autowired
	@Qualifier("adminRoleService")
	private IAdminRoleService adminRoleService;
	
	
	private AdminRole entity;

	private AdminRoleQuery adminRoleQuery;
	
	
	private java.lang.Long adminRoleId;
	
	/** 分页器 */
	private Page<AdminRole> page = new Page<AdminRole>();
	
	/** Json操作信息 */
	private String[] resultInfo = new String[2];
	
	/** 所选择的编号列表 */
	private List<java.lang.Long> checkedIdList;
	
	
	private ApplicationContext ctx;
	
	private List<AdminRole> adminRoleList;

	/* (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#prepareModel()
	 */
	@Override
	protected void prepareModel() throws Exception {
		if (adminRoleId != null ) {
			entity = adminRoleService.getById(adminRoleId);
		} else {
			entity = new AdminRole();
		}
	}
	
	/* (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#delete()
	 */
	@Override
	public String delete() throws Exception {
		
		try {
			adminRoleService.deleteByMultipleId(checkedIdList);
			
			resultInfo[0] = "0";
			resultInfo[1] = "删除成功";
			
			addActionMessage("删除成功");
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch(Exception e) {
			logger.error(e.getMessage());
			
			resultInfo[0] = "-1";
			resultInfo[1] = "删除失败";
			
			addActionMessage("删除失败");
		}
		return RELOAD;
	}
	
	/* (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#deleteToJson()
	 */
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

	/* (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#input()
	 */
	@Override
	public String input() throws Exception {
		return INPUT;
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#list()
	 */
	@Override
	public String list() throws Exception {
		if (!page.isOrderBySetted()) {
			page.setOrderBy("adminRoleId");
			page.setOrder(Page.DESC);
		}
		if(adminRoleQuery == null) {
			adminRoleQuery = new AdminRoleQuery();
		}
		
		try {
			page = adminRoleService.findPage(page, adminRoleQuery);
			
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
		return JSON;
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#save()
	 */
	@Override
	public String save() throws Exception {
		
		try {
			adminRoleService.saveOrUpdate(entity);
			
			resultInfo[0] = "0";
			resultInfo[1] = "操作成功";
			
			addActionMessage("操作成功");
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch(Exception e) {
			logger.error(e.getMessage());
			
			resultInfo[0] = "-1";
			resultInfo[1] = "操作失败";
			
			addActionMessage("操作失败");
			return INPUT;
		}
		return RELOAD;
	}
	
	/* (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#saveToJson()
	 */
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

	/* (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#show()
	 */
	@Override
	public String show() throws Exception {
		
		try {
			entity = adminRoleService.getById(adminRoleId);
			
			resultInfo[0] = "0";
			resultInfo[1] = "查询成功";
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch(Exception e) {
			logger.error(e.getMessage());
			
			resultInfo[0] = "-1";
			resultInfo[1] = "查询失败";
		}
		return SHOW;
	}
	
	/* (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#showToJson()
	 */
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

	
	// -------------------自定义方法

	
	
	public String listAll() throws Exception {
		try{
			adminRoleList = adminRoleService.findAllList();
			resultInfo[0] = "0";
			resultInfo[1] = "操作成功";
		} catch(ServiceException e){
			logger.warn("param error ", e);
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch(Exception e){
			logger.warn("param error ", e);
			resultInfo[0] = "-1";
			resultInfo[1] = "操作失败";
		}	
		
		return JSON;
	}
	// -------------------自定义方法
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	public AdminRole getModel() {
		return entity;
	}

	/**
	 * 
	 *
	 * @return the lottery query
	 */
	public AdminRoleQuery getAdminRoleQuery() {
		return adminRoleQuery;
	}

	
	public void setAdminRoleQuery(AdminRoleQuery adminRoleQuery) {
		this.adminRoleQuery = adminRoleQuery;
	}

	public void setAdminRoleId(java.lang.Long adminRoleId) {
		this.adminRoleId = adminRoleId;
	}
	
	
	public java.lang.Long getAdminRoleId() {
		return this.adminRoleId;
	}

	/**
	 * 获得分页器
	 *
	 * @return the page
	 */
	public Page<AdminRole> getPage() {
		return page;
	}

	/**
	 * 设置分页器
	 *
	 * @param page the new page
	 */
	public void setPage(Page<AdminRole> page) {
		this.page = page;
	}
	
	/**
	 * 获得Json操作信息
	 *
	 * @return the result info
	 */
	public String[] getResultInfo() {
		return resultInfo;
	}

	/**
	 * 获得所选择的编号列表
	 *
	 * @return 编号列表
	 */
	public List<java.lang.Long> getCheckedIdList() {
		return checkedIdList;
	}

	/**
	 * 设置编号列表
	 *
	 * @param checkedIdList 编号列表
	 */
	public void setCheckedIdList(List<java.lang.Long> checkedIdList) {
		this.checkedIdList = checkedIdList;
	}
	

	public void setApplicationContext(ApplicationContext ctx)
		throws BeansException {
	this.ctx = ctx;
	}

	public List<AdminRole> getAdminRoleList() {
		return adminRoleList;
	}
	
	
}
