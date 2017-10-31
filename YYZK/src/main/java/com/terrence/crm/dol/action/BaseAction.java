/**
 * 
 */
package com.terrence.crm.dol.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import com.opensymphony.xwork2.ActionSupport;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.bean.security.AdminSession;
import com.terrence.crm.dol.utils.SpringSecurityUtils;

/**
 * @author thinkpad
 *
 */
public abstract class BaseAction extends ActionSupport implements
		ApplicationContextAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2591464089503315144L;
	protected Logger logger = LoggerFactory.getLogger(getClass());
	protected ApplicationContext ctx;

	/* (non-Javadoc)
	 * @see org.springframework.context.ApplicationContextAware#setApplicationContext(org.springframework.context.ApplicationContext)
	 */
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
	
	public Admin getAdmin() {
		AdminSession adminSession = SpringSecurityUtils.getCurrentUser();
		if(adminSession == null || adminSession.getAdmin() == null) {
			logger.error(" admin not found ");
			return null;
		}
		return adminSession.getAdmin();
	}
}
