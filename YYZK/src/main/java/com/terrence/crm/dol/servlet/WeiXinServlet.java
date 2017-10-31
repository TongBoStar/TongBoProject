package com.terrence.crm.dol.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.terrence.crm.dol.utils.ConnectionUtil;
import com.terrence.crm.dol.utils.SHA1;

public class WeiXinServlet extends HttpServlet {
	private String token="yunquxinya";
	/**
	 * 
	 */
	private static final long serialVersionUID = -5189418417145604614L;
	private static final Logger log = Logger.getLogger(WeiXinServlet.class);
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");
		String echostr = request.getParameter("echostr");
		String[] str = {token,timestamp,nonce};
		// 将token、timestamp、nonce三个参数进行字典序排序：     A:65  a:97
		Arrays.sort(str);
		// 拼接成字符串的时候顺序不能变
		String bigStr=str[0] + str[1] + str[2];
		String signature2 = new SHA1().getDigestOfString(bigStr.getBytes());
		// 一定要不区分大小写比较.因为微信服务器在传入signature参数时已经转化了小写,但是API并没有提示
		if(signature.equalsIgnoreCase(signature2)){
			// 如果比对成功,则将随机字符串原样返回
			out.write(echostr);
		}else{
			out.write("error");
		}
		out.flush();
		out.close();
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		try{
			response.setCharacterEncoding("UTF-8");
			Map<String, String> map = parseXml(request.getInputStream());
			//接收消息并相应
			String toUserName = map.get("ToUserName");
			String fromUserName =  map.get("FromUserName");
			String createTime =  map.get("CreateTime");
			String msgType =  map.get("MsgType");
			String content =  map.get("Content");
			//String event =  map.get("Event");
			String mediaId = map.get("MediaId");
			String format = map.get("Format");
			String msgId =  map.get("MsgId");
			log.info("响应成功:"+toUserName+"=="+fromUserName+"=="+createTime+"=="+msgType+"=="+content+"=="+msgId+"=="+mediaId+"=="+format);
			/*StringBuffer xml = new StringBuffer();
			xml.append("<xml>");
			xml.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
			xml.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
			xml.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
			xml.append("<MsgType><![CDATA[text]]></MsgType>");
			xml.append("<Content><![CDATA[你好]]></Content>");
			xml.append("</xml>");*/
			if("voice".equals(msgType)){
				Connection conn = ConnectionUtil.getConnection();
				PreparedStatement ps = null;
				//将自动提交设置为false
				conn.setAutoCommit(false);
				//设置事务隔离级别
				conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
				String wxinfo = "select access_token from t_wxinfo where id=1";
				ps = conn.prepareStatement(wxinfo);
				ResultSet rs = ps.executeQuery();
				if(rs.next()){
					String url = "https://api.weixin.qq.com/cgi-bin/media/get?access_token="+rs.getString(1)+"&media_id="+mediaId;
					download(url,mediaId+"."+format,request.getServletContext().getRealPath("/voice/"+fromUserName));
					String savesql = "insert into t_voice_recod (mediaId,wxCode,timeStamp,msgType) values(?,?,?,?)";
					ps = conn.prepareStatement(savesql);
					ps.setString(1, mediaId);
					ps.setString(2, fromUserName);
					ps.setLong(3, new Date().getTime());
					ps.setString(4, msgType);
					ps.execute();
					conn.commit();
					log.info("数据保存成功");
				}
			}else if("text".equals(msgType)){
				Connection conn = ConnectionUtil.getConnection();
				PreparedStatement ps = null;
				//将自动提交设置为false
				conn.setAutoCommit(false);
				//设置事务隔离级别
				conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
				String wxinfo = "select access_token from t_wxinfo where id=1";
				ps = conn.prepareStatement(wxinfo);
				ResultSet rs = ps.executeQuery();
				if(rs.next()){
					String savesql = "insert into t_voice_recod (fcontent,wxCode,timeStamp,msgType) values(?,?,?,?)";
					ps = conn.prepareStatement(savesql);
					ps.setString(1, content);
					ps.setString(2, fromUserName);
					ps.setLong(3, new Date().getTime());
					ps.setString(4, msgType);
					ps.execute();
					conn.commit();
					log.info("数据保存成功");
				}
			}else{
				
			}
			response.getOutputStream().write("".toString().getBytes("utf-8"));
		}catch (Exception e) {
			e.printStackTrace();
			log.info("请求错误:"+e.getMessage());
			try {
				response.getOutputStream().write("".toString().getBytes("utf-8"));
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}
	public Map<String, String> parseXml(InputStream in){
		Map<String, String> map = new HashMap<String, String>();
		SAXReader saxReader = new SAXReader();
		try {
			Document document = saxReader.read(in);
			Element root = document.getRootElement();
			Element toUserName = root.element("ToUserName");
			Element fromUserName = root.element("FromUserName");
			Element createTime = root.element("CreateTime");
			Element msgType = root.element("MsgType");
			Element content = root.element("Content");
			Element msgId = root.element("MsgId");
			Element event = root.element("Event");
			Element mediaId = root.element("MediaId");
			Element format = root.element("Format");
			map.put("ToUserName", toUserName.getText());
			map.put("FromUserName", fromUserName.getText());
			map.put("CreateTime", createTime.getText());
			map.put("MsgType", msgType.getText());
			if(null!=content){
				map.put("Content", content.getText());
			}
			if(null!=msgId){
				map.put("MsgId", msgId.getText());
			}
			if(null!=event){
				map.put("Event", event.getText());
			}
			if(null!=mediaId){
				map.put("MediaId", mediaId.getText());
			}
			if(null!=format){
				map.put("Format", format.getText());
			}
		} catch (DocumentException e) {
			log.info("xml解析错误:"+e.getMessage());
		}
		return map;
	}
	public void download(String urlString, String filename,String savePath) throws Exception {
		// 构造URL
		URL url = new URL(urlString);
		// 打开连接
		URLConnection con = url.openConnection();
		// 设置请求超时为5s
		con.setConnectTimeout(5 * 1000);
		// 输入流
		InputStream is = con.getInputStream();

		// 1K的数据缓冲
		byte[] bs = new byte[1024];
		// 读取到的数据长度
		int len;
		// 输出的文件流
		File sf = new File(savePath);
		if (!sf.exists()) {
			sf.mkdirs();
		}
		OutputStream os = new FileOutputStream(savePath +"/"+ filename);
		// 开始读取
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		log.info(urlString+"===========================下载完成:"+(savePath + filename));
		// 完毕，关闭所有链接
		os.close();
		is.close();
	}
	public void init() throws ServletException {
	}
	public void destroy() {
		super.destroy();
	}
}
