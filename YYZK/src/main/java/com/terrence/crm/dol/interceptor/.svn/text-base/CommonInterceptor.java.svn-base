package com.terrence.crm.dol.interceptor;

import org.apache.struts2.StrutsStatics;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.terrence.crm.dol.base.UserContext;
import com.terrence.crm.dol.base.UserContextHolder;
import com.terrence.crm.dol.bean.security.AdminSession;
import com.terrence.crm.dol.utils.SpringSecurityUtils;

/**
 * 公共拦截器
 * 
 * @author Allen
 *
 */
public class CommonInterceptor extends AbstractInterceptor implements StrutsStatics {

	private static final long serialVersionUID = 491815684932676174L;
	private static final Logger logger = LoggerFactory.getLogger(CommonInterceptor.class);

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		final Object action = invocation.getAction();
		
		AdminSession user = SpringSecurityUtils.getCurrentUser();
		
		if(user != null && user.getAdmin() != null) {
			UserContextHolder.set(new UserContext(user.getAdmin()));
		}else{
			//return Action.LOGIN;
		}

		return invocation.invoke();
	}
}
