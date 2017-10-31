package com.base;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import com.base.util.SpringSecurityUtil;
import com.opensymphony.xwork2.ActionSupport;
import com.terrence.core.dol.security.UserInfoSession;
import com.terrence.core.dol.service.IOperationLogService;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.bean.security.AdminSession;
import com.terrence.crm.dol.utils.SpringSecurityUtils;

public abstract class BaseAction extends ActionSupport implements ServletRequestAware,ServletResponseAware,ApplicationContextAware{

	private static final long serialVersionUID = 2179006781343820226L;
	
	@Autowired
	@Qualifier("operationLogService")
	public IOperationLogService operationLogService;
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	protected ApplicationContext ctx;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	
	private Integer page;
	private Integer rows;
	
	public Map<String,Object> resultMsg = new HashMap<String,Object>();//存放返回消息
	
	public void setApplicationContext(ApplicationContext ctx)
			throws BeansException {
		this.ctx = ctx;

	}

	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}
	
	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}
	
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
		this.response.setContentType("text/html;charset=UTF-8");
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public Admin getUserInfo() {
//		UserInfoSession userInfoSession = SpringSecurityUtil.getCurrentUser();
//		if(userInfoSession == null || userInfoSession.getUserInfo() == null) {
//			logger.error(" admin not found ");
//			return null;
//		}
//		return userInfoSession.getUserInfo();
		
		AdminSession adminSession = SpringSecurityUtils.getCurrentUser();
		if(adminSession == null || adminSession.getAdmin() == null) {
		logger.error(" admin not found ");
		return null;
		}
		return adminSession.getAdmin();
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
