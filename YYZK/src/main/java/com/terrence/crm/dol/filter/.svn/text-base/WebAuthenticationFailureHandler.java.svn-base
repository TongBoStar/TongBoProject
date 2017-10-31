package com.terrence.crm.dol.filter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.ExceptionMappingAuthenticationFailureHandler;


/**
 * spring security 登录失败后的handler
 *
 * @author allen
 *
 */
public class WebAuthenticationFailureHandler extends ExceptionMappingAuthenticationFailureHandler {
	
	@Override
	 public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
	            AuthenticationException exception) throws IOException, ServletException {
	        super.onAuthenticationFailure(request, response, exception);
	    }
	

}
