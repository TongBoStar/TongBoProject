package com.terrence.crm.dol.filter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;


/**
 * spring security 登出成功后的handler
 * @author allen
 *
 */
public class WebLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {

	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
    throws IOException, ServletException {
		
	
		 
		super.onLogoutSuccess(request, response, authentication);
	}

}
