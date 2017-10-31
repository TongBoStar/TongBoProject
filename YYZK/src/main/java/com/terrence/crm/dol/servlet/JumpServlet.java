package com.terrence.crm.dol.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.json.JSONObject;

public class JumpServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5189418417145604614L;
	private static final Logger log = Logger.getLogger(JumpServlet.class);
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("=========走了这里的get方法======================");
		String code = request.getParameter("stcode");
		String yqcode = request.getParameter("yqcode");
		if(null!=yqcode&&!"".equals(yqcode)){
			response.sendRedirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4bfe89447a0d8438&redirect_uri=http://www.yiyunzk.com/user/userinfo&response_type=code&scope=snsapi_base&state=agentsaomiao_"+yqcode+"&connect_redirect=1#wechat_redirect");
		}
		if(null!=code&&!"".equals(code)){
			response.sendRedirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4bfe89447a0d8438&redirect_uri=http://www.yiyunzk.com/user/userinfo&response_type=code&scope=snsapi_base&state="+code+"&connect_redirect=1#wechat_redirect");
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("=========走了这里的post方法======================");
		String code = request.getParameter("stcode");
		System.out.println("stcpde:"+code);
		response.sendRedirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4bfe89447a0d8438&redirect_uri=http://www.yiyunzk.com/user/userinfo&response_type=code&scope=snsapi_base&state="+code+"&connect_redirect=1#wechat_redirect");
		//response.sendRedirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx04f2bccb34d1196f&redirect_uri=http://abc.gas366.com/user/userinfo?response_type=code&scope=snsapi_base&state=1&connect_redirect=1#wechat_redirect");
	}
	public void destroy() {
		super.destroy();
	}
}
