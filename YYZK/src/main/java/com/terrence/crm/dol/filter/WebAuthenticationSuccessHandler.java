package com.terrence.crm.dol.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.terrence.core.dol.service.IOperationLogService;
import com.terrence.crm.dol.base.UserContext;
import com.terrence.crm.dol.base.UserContextHolder;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.bean.ClientInfo;
import com.terrence.crm.dol.bean.security.AdminSession;
import com.terrence.crm.dol.utils.SpringSecurityUtils;



/**
 * spring security 登录成功后的handler
 *
 * @author allen
 *
 */
public class WebAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler implements ApplicationContextAware{
	private ApplicationContext ctx;
	@Autowired
	@Qualifier("operationLogService")
	private IOperationLogService operationLogService;
	 @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws ServletException, IOException {
		 AdminSession user = (AdminSession)authentication.getPrincipal();
		 Admin admin = user.getAdmin();
		 UserContextHolder.set(new UserContext(admin));
		 //ctx.publishEvent(new AdminLogEvent(admin.getAdminName() + "登录"));
		 ClientInfo clientInfo = SpringSecurityUtils.getClientInfo(authentication);
		 operationLogService.save(clientInfo.getIp(), clientInfo.getComputerName(), admin.getAdminId(), admin.getAdminName(), admin.getLoginName(), "用户登录", "登录", "登录成功！");
		 request.getSession().setAttribute("ClientInfo", clientInfo);
		 super.onAuthenticationSuccess(request, response, authentication);
	 }
	public void setApplicationContext(ApplicationContext arg0)
			throws BeansException {
		this.ctx = arg0;
	}
}