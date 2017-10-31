package com.terrence.core.dol.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.terrence.crm.dol.bean.security.AdminSession;
import com.terrence.crm.dol.utils.SpringSecurityUtils;

public class AuthorityInterceptor extends MethodFilterInterceptor{

	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		// TODO Auto-generated method stub
		AdminSession adminSession = SpringSecurityUtils.getCurrentUser();
		if(adminSession == null || adminSession.getAdmin() == null) {
			return Action.LOGIN;
		}else{
			return actionInvocation.invoke();
		}
	}
}
