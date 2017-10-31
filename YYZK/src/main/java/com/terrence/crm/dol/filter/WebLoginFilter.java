package com.terrence.crm.dol.filter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
/**
 * spring security 登录filter
 * @author frank
 *
 */
public class WebLoginFilter extends UsernamePasswordAuthenticationFilter {

	@Override
	public Authentication attemptAuthentication(javax.servlet.http.HttpServletRequest request,
            javax.servlet.http.HttpServletResponse response)
     throws AuthenticationException{
		super.getFilterProcessesUrl();
		return super.attemptAuthentication(request, response);
	}
	
	@Override
	 protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response,
	            Authentication authResult) throws IOException, ServletException {
		
		 super.successfulAuthentication(request, response, authResult);
		
	 }
	
	@Override
	protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException failed) throws IOException, ServletException {
		super.unsuccessfulAuthentication(request, response, failed);
	}
}
