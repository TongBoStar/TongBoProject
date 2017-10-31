package com.terrence.crm.dol.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

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

import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.utils.ConnectionUtil;
import com.terrence.crm.dol.utils.DateUtils;
public class UserInfoServlet extends HttpServlet {
	/**
	 * https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4bfe89447a0d8438&redirect_uri=http://www.yiyunzk.com/user/userinfo&response_type=code&scope=snsapi_base&state=regyunqujiazu&connect_redirect=1#wechat_redirect
	 */
	private static final long serialVersionUID = -5189418417145604614L;
	private static final Logger log = Logger.getLogger(UserInfoServlet.class);
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			response.setCharacterEncoding("UTF-8");
			String CODE = request.getParameter("code");
			String APPID = "wx4bfe89447a0d8438";
	        String SECRET = "c538d975c61567e456377d9fdf23fd28";
	        String openid = "";
	        String openidsession = (String)request.getSession().getAttribute("openid");
	        if(null==openidsession){
	        	//换取access_token 其中包含了openid
		        String URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code".replace("APPID", APPID).replace("SECRET", SECRET).replace("CODE", CODE);
		        //URLConnectionHelper是一个模拟发送http请求的类
		        CloseableHttpClient client = HttpClients.createDefault();
				HttpPost post = new HttpPost(URL);
				post.addHeader("Content-Type","application/json");
				CloseableHttpResponse resp = client.execute(post);
				int sc = resp.getStatusLine().getStatusCode();
				String jsonStr = "";
				if(sc>=200&&sc<300) {
					jsonStr = EntityUtils.toString(resp.getEntity());
				}
		        JSONObject jsonObj;
				jsonObj = new JSONObject(jsonStr);
				openid = jsonObj.get("openid").toString();
				//request.getSession().setAttribute("openid", openid);
				request.getSession().setAttribute("ctx", request.getContextPath());
	        }else{
	        	openid = openidsession;
	        	System.out.println("=====session中有值========");
	        }
			/*log.info("--------------------**********"+openid);
			log.info("param="+request.getParameter("state"));*/
	        //有了用户的opendi就可以的到用户的信息了
	        //地址为https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN
	        //得到用户信息之后返回到一个页面
	        String state = request.getParameter("state");
	        System.out.println("=================================="+state+"===="+openidsession);
	        if(checkexist(openid)){
	        	if("regyunqujiazu".equals(state)){//是注册云趣家族的请求
	        		int checkresult = checkIsAgent(openid);
	        		if(checkresult==1){
	        			response.sendRedirect("http://www.yiyunzk.com/mobile/agentinfo.jsp?openid="+openid);
	        		}else{
	        			checkresult = checkLogin(openid);
		        		if(checkresult==0){
		        			response.sendRedirect("http://www.yiyunzk.com/mobile/wxlogin.jsp?openid="+openid);
		        		}else if(checkresult==2){//没有同意销售协议
		        			response.sendRedirect("http://www.yiyunzk.com/mobile/saleagreement.jsp?openid="+openid+"&nowTime="+new Date().getTime());
		        		}else if(checkresult==3){//待审核中
		        			response.sendRedirect("http://www.yiyunzk.com/mobile/waitexamine.jsp?openid="+openid+"&nowTime="+new Date().getTime());
		        		}else{
		        			response.sendRedirect("http://www.yiyunzk.com/mobile/wxindex.jsp?openid="+openid);
		        		}
	        		}
	        	}else if("regyunqujiaagin".equals(state)){//是注册云趣家族重新注册的请求
	        		response.sendRedirect("http://www.yiyunzk.com/mobile/wxregister.jsp?openid="+openid);
	        	}else if("unbinddevice".equals(state)){//是解除绑定的请求
	        		response.sendRedirect("http://www.yiyunzk.com/mobile/unbinddevice.jsp?openid="+openid);
	        	}else if(state.startsWith("agentsaomiao_")){//别人扫描了代理商的二维码
	        		updateAdminRelative(openid,state);
	        		response.sendRedirect("http://mp.weixin.qq.com/bizmall/mallshelf?id=&t=mall/list&biz=MzIxMDY0NzU4Nw==&shelf_id=1&showwxpaytitle=1#wechat_redirect");
	        	}else if("saleagree".equals(state)){
	        		if(checkSaleAgree(openid)==1){//审核通过,同意了销售协议，直接进入主页
	        			request.getSession().setAttribute("openid", openid);
	        			response.sendRedirect("http://www.yiyunzk.com/mobile/wxindex.jsp?openid="+openid);
	        		}else if(checkSaleAgree(openid)==2){//审核通过,同意了销售协议，但是账号有问题，进入登陆页面
	        			request.getSession().setAttribute("openid", openid);
	        			response.sendRedirect("http://www.yiyunzk.com/mobile/wxlogin.jsp?openid="+openid);
	        		}else{//审核通过,第一次进入销售协议界面
	        			response.sendRedirect("http://www.yiyunzk.com/mobile/saleagreement.jsp?openid="+openid+"&nowTime="+new Date().getTime());
	        		}
	        	}else{
	        		if(saveBindInfo(openid,state)){
		        		response.sendRedirect("http://www.yiyunzk.com/mobile/bindsuccess.jsp?openid="+openid);
		        	}else{
		        		response.sendRedirect("http://www.yiyunzk.com/mobile/bindfail.jsp?openid="+openid);
		        	}
	        	}
	        }else{
	        	if("uncare".equals(state)){//没有关注公众号 进入普通的关注页面
	        		response.sendRedirect("http://www.yiyunzk.com/login6/index.html");
	        	}else{//绑定设备时没有关注公众号 进入设备绑定关注页面
	        		response.sendRedirect("http://www.yiyunzk.com/mobile/erweima.jsp?openid="+openid);
	        	}
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void updateAdminRelative(String openid, String state) throws Exception{
		String upwxcode = state.split("_")[1];
		Connection conn = ConnectionUtil.getConnection();
		//将自动提交设置为false
		conn.setAutoCommit(false);
		//设置事务隔离级别
		conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
		PreparedStatement ps = null;
		String sql = "select wxCode,upwxCode from t_wxrelative where wxCode = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, openid);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){//之前就有绑定关系
			if(!upwxcode.equals(rs.getString(2))){
				sql = "update t_wxrelative set upwxCode=?,createTime=? where wxCode = ? ";
				ps = conn.prepareStatement(sql);
				ps.setString(1, upwxcode);
				ps.setString(2, DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
				ps.setString(3, openid);
				ps.execute();
				conn.commit();
				rs.close();
				ps.close();
				conn.close();
			}
		}else{
			sql = "insert into t_wxrelative (wxCode,upwxCode,createTime) values(?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, openid);
			ps.setString(2, upwxcode);
			ps.setString(3, DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
			ps.execute();
			conn.commit();
			rs.close();
			ps.close();
			conn.close();
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		try{
		System.out.println("=========同时走了这里的post方法======================");
		response.setCharacterEncoding("UTF-8");
		String CODE = request.getParameter("code");
        String APPID = "wx4bfe89447a0d8438";
        String SECRET = "c538d975c61567e456377d9fdf23fd28";
        //换取access_token 其中包含了openid
        String URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code".replace("APPID", APPID).replace("SECRET", SECRET).replace("CODE", CODE);
        //URLConnectionHelper是一个模拟发送http请求的类
        CloseableHttpClient client = HttpClients.createDefault();
		HttpPost post = new HttpPost(URL);
		post.addHeader("Content-Type","application/json");
		CloseableHttpResponse resp = client.execute(post);
		int sc = resp.getStatusLine().getStatusCode();
		String jsonStr = "";
		if(sc>=200&&sc<300) {
			jsonStr = EntityUtils.toString(resp.getEntity());
		}
        JSONObject jsonObj;
		jsonObj = new JSONObject(jsonStr);
		String openid = jsonObj.get("openid").toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
        //有了用户的opendi就可以的到用户的信息了
        //地址为https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN
        //得到用户信息之后返回到一个页面
	}
	public void destroy() {
		super.destroy();
	}
	/**
	 * 检查有没有关注云趣新芽的公众号
	 * @param wxCode 微信号
	 * @return 是否存在
	 */
	public boolean checkexist(String wxCode){
		try {
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement ps = null;
			String sql = "select access_token from t_wxinfo";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			String accessToken = "";
			if(rs.next()){
				accessToken = rs.getString(1);
			}else{
				return false;
			}
			String URL = "https://api.weixin.qq.com/cgi-bin/user/info?access_token="+accessToken+"&openid="+wxCode;
			//URLConnectionHelper是一个模拟发送http请求的类
			CloseableHttpClient client = HttpClients.createDefault();
			HttpPost post = new HttpPost(URL);
			post.addHeader("Content-Type","application/json");
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			String jsonStr = "";
			if(sc>=200&&sc<300) {
				jsonStr = EntityUtils.toString(resp.getEntity());
			}
			org.json.JSONObject  jsonObj;
			jsonObj = new org.json.JSONObject(jsonStr);
			String nickName = jsonObj.getString("nickname").toString();
			if(nickName==null){
				return false;
			}else{
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 绑定设备
	 * @param wxCode 微信号
	 * @param serialNumber 序列号
	 * @return 是否绑定成功 
	 */
	public boolean saveBindInfo(String wxCode,String stCode){
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement ps = null;
		try {
			//将自动提交设置为false
			conn.setAutoCommit(false);
			//设置事务隔离级别
			conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
			String sqlcheck = "select wxcode,stCode,serialNumber from t_st_wx where wxcode=? and serialNumber=(select serialNumber from t_stcode where stCode=?)";
			ps = conn.prepareStatement(sqlcheck);
			ps.setString(1, wxCode);
			ps.setString(2, stCode);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				return true;
			}else{
				String sqlfind = "select serialNumber from t_stcode where stCode=?";
				ps = conn.prepareStatement(sqlfind);
				ps.setString(1, stCode);
				rs = ps.executeQuery();
				if(rs.next()){
					String serialNumber =  rs.getString(1);
					String sqlinsert = "insert into t_st_wx (wxcode,stCode,serialNumber,createDate) values(?,?,?,?)";
					ps = conn.prepareStatement(sqlinsert);
					ps.setString(1, wxCode);
					ps.setString(2, stCode);
					ps.setString(3,serialNumber);
					ps.setString(4, DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
					ps.execute();
					conn.commit();
					rs.close();
					ps.close();
					conn.close();
					return true;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			
		}
		return false;
	}
	/**
	 * 判断是不是代理商
	 * @param wxCode 微信号
	 * @return 是否代理商
	 */
	public Integer checkIsAgent(String wxCode){
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement ps = null;
		try {
			//将自动提交设置为false
			conn.setAutoCommit(false);
			//设置事务隔离级别
			conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
			String sqlcheck = "select wxCode,fstatus from t_yyagent where wxCode=? and fstatus=?";
			ps = conn.prepareStatement(sqlcheck);
			ps.setString(1, wxCode);
			ps.setInt(2, 1);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				return 1;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 判断登录是否超时
	 * @param wxCode 微信号
	 * @param serialNumber 序列号
	 * @return 是否绑定成功 
	 */
	public Integer checkLogin(String wxCode){
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement ps = null;
		try {
			//将自动提交设置为false
			conn.setAutoCommit(false);
			//设置事务隔离级别
			conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
			String sqlcheck = "select wxcode,lastLoginTime,status,issaleagree from t_admin where wxcode=? and status=?";
			ps = conn.prepareStatement(sqlcheck);
			ps.setString(1, wxCode);
			ps.setInt(2, 3);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				System.out.println("====================================="+rs.getDate(2).getTime());
				if(rs.getInt(3)==0){//待审核
					return 3;
				}
				if(rs.getInt(3)==1){//被驳回
					return 0;
				}
				if(rs.getInt(4)!=1){//是否同意了销售协议
					return 2;
				}
				if(null!=rs.getDate(2)&&new Date().getTime()-rs.getDate(2).getTime()>7*24*60*60*1000){//超过一周
					return 0;
				}else{
					return 1;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	/**
	 * 判断是否同意了销售协议
	 * @param wxCode 微信号
	 * @param serialNumber 序列号
	 * @return 是否绑定成功 
	 */
	public Integer checkSaleAgree(String wxCode){
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement ps = null;
		try {
			//将自动提交设置为false
			conn.setAutoCommit(false);
			//设置事务隔离级别
			conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
			String sqlcheck = "select wxcode,lastLoginTime,status from t_admin where wxcode=? and issaleagree=?";
			ps = conn.prepareStatement(sqlcheck);
			ps.setString(1, wxCode);
			ps.setInt(2, 1);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getInt(3)!=3){
					return 2;
				}else{
					return 1;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}