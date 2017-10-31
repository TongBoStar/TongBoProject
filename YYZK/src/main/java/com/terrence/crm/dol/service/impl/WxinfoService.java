package com.terrence.crm.dol.service.impl;

import it.sauronsoftware.jave.AudioAttributes;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.transaction.annotation.Transactional;

import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.DeviceModel;
import com.terrence.crm.dol.bean.DeviceMsg;
import com.terrence.crm.dol.bean.DeviceStatusModel;
import com.terrence.crm.dol.bean.DeviceStatusMsg;
import com.terrence.crm.dol.bean.Usermark;
import com.terrence.crm.dol.bean.ValueColor;
import com.terrence.crm.dol.bean.Wxinfo;
import com.terrence.crm.dol.bean.Yqk;
import com.terrence.crm.dol.dao.IUsermarkDao;
import com.terrence.crm.dol.dao.IWxinfoDao;
import com.terrence.crm.dol.dao.IYqkDao;
import com.terrence.crm.dol.query.WxinfoQuery;
import com.terrence.crm.dol.query.YqkQuery;
import com.terrence.crm.dol.service.IWxinfoService;
import com.terrence.crm.dol.utils.ConnectionUtil;
import com.terrence.crm.dol.utils.Contants;
import com.terrence.crm.dol.utils.DateConvertUtils;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SocketHttpRequester;
import it.sauronsoftware.jave.Encoder;  
import it.sauronsoftware.jave.EncoderException;  
import it.sauronsoftware.jave.EncodingAttributes;  
import it.sauronsoftware.jave.InputFormatException;  
@Service
@Transactional
public class WxinfoService extends BaseService implements IWxinfoService {
	@Autowired
	@Qualifier("wxinfoDao")
	private IWxinfoDao wxinfoDao;
	@Autowired
	@Qualifier("usermarkDao")
	private IUsermarkDao usermarkDao;
	@Autowired
	@Qualifier("yqkDao")
	private IYqkDao yqkDao;
	
	@Override
	public Wxinfo getById(Long id) throws ServiceException {
		return wxinfoDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Wxinfo entity) throws ServiceException {
		wxinfoDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Wxinfo entity) throws ServiceException {
		return wxinfoDao.save(entity);
	}
	@Override
	public Integer update(Wxinfo entity) throws ServiceException {
		return wxinfoDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return wxinfoDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = wxinfoDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Wxinfo> findPage(Page<Wxinfo> page, WxinfoQuery query) throws ServiceException{
		return wxinfoDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Wxinfo> findPage(Page<Wxinfo> page,String statement, WxinfoQuery query) throws ServiceException{
		return wxinfoDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Wxinfo> findList(WxinfoQuery query) throws ServiceException{
		return wxinfoDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Wxinfo> findList(WxinfoQuery query,Integer pageSize) throws ServiceException{
		return wxinfoDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Wxinfo> findList(WxinfoQuery query,String statement,Integer pageSize) throws ServiceException{
		return wxinfoDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Wxinfo> findAllList() throws ServiceException{
		return wxinfoDao.findAllList();
	}
	@Override
	public void updateAccessToken() {
		try {
			System.out.println("=========开始执行更新access_token的定时器了!==========");
			Long now = DateConvertUtils.getCurrentDateTime().getTime();
			WxinfoQuery query = new WxinfoQuery();
			List<Wxinfo> wxinfoList = wxinfoDao.findList(query);
			Long inteval = 15*60*1000L;
			for(Wxinfo wx : wxinfoList){
				if(now+inteval>=wx.getToken_expireTime()){
					//换取access_token
			        String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
			        url = url.replace("APPID", wx.getAppId()).replace("APPSECRET", wx.getAppSecret());
			        //URLConnectionHelper是一个模拟发送http请求的类
			        CloseableHttpClient client = HttpClients.createDefault();
					HttpPost post = new HttpPost(url);
					post.addHeader("Content-Type","application/json");
					CloseableHttpResponse resp = client.execute(post);
					int sc = resp.getStatusLine().getStatusCode();
					String jsonStr = "";
					if(sc>=200&&sc<300) {
						jsonStr = EntityUtils.toString(resp.getEntity());
					}
			        JSONObject jsonObj;
					jsonObj = new JSONObject(jsonStr);
					String access_token = jsonObj.get("access_token").toString();
					
					//换取jsapi_ticket
			        url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi".replace("ACCESS_TOKEN", access_token);
			        client = HttpClients.createDefault();
					post = new HttpPost(url);
					post.addHeader("Content-Type","application/json");
					resp = client.execute(post);
					sc = resp.getStatusLine().getStatusCode();
					jsonStr = "";
					if(sc>=200&&sc<300) {
						jsonStr = EntityUtils.toString(resp.getEntity());
					}
					jsonObj = new JSONObject(jsonStr);
					String jsapi_ticket = jsonObj.get("ticket").toString();
					
					//更新数据库中相关信息
					wx.setAccess_token(access_token);
					wx.setJsapi_ticket(jsapi_ticket);
					wx.setToken_expireTime(now+7200*1000);
					wxinfoDao.update(wx);
				}
			}
			YqkQuery yqkQuery = new YqkQuery();
			List<Yqk> yqkList = yqkDao.findList("Yqk.find.NoIcon", yqkQuery);
			if(null!=yqkList&&yqkList.size()>0){
				for(Yqk yqk:yqkList){
					CloseableHttpClient client = HttpClients.createDefault();
					String url = "https://openapi.youku.com/v2/videos/show.json?client_id=e054a004232b7ad2&ext=thumbnails,show,dvd,reference&video_id="+yqk.getVideoId();
					HttpGet post = new HttpGet(url);
					post.addHeader("Content-Type","application/json");
					CloseableHttpResponse resp = client.execute(post);
					int sc = resp.getStatusLine().getStatusCode();
					String jsonStr = "";
					if(sc>=200&&sc<300) {
						jsonStr = EntityUtils.toString(resp.getEntity());
					}
					JSONObject jsonObj;
					jsonObj = new JSONObject(jsonStr);
					yqk.setResIcon(jsonObj.getString("bigThumbnail"));
					yqk.setFname(jsonObj.getString("title"));
					yqk.setVideoseq(jsonObj.getJSONObject("show").getInt("seq"));
					yqk.setTimes(jsonObj.getInt("duration"));
					yqkDao.update(yqk);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void sendMsg(String serialNumber,String statusMark,Integer type,Double longitude,Double latitude,Long onlineTimes,Float fversion) throws ServiceException {
		Wxinfo wxinfo = getById(1L);
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			//将自动提交设置为false
			conn.setAutoCommit(false);
			//设置事务隔离级别
			conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
			String sqlcheck = "select t_st_wx.wxcode,t_stinfo.stName,t_st_wx.stCode from t_st_wx left join t_stinfo on t_st_wx.serialNumber = t_stinfo.serialNumber " +
					" where t_st_wx.serialNumber=?";
			ps = conn.prepareStatement(sqlcheck);
			ps.setString(1, serialNumber);
			rs = ps.executeQuery();
			
			String url0 = "http://api.map.baidu.com/geocoder/v2/?ak=P848g3G8yYDSdpcmgNxSKHKOF5GEh0iW&location=LLITUDE&output=json&pois=1";
			url0 = url0.replace("LLITUDE", latitude+","+longitude);
			System.out.println("****************************************************************************LLITUDE:"+(latitude+","+longitude));
			byte[] bytelist = SocketHttpRequester.visitHttp(url0);
        	String result0 = new String(bytelist,"utf-8");
        	JSONObject robj = new JSONObject(result0);
        	JSONObject result1 = robj.getJSONObject("result");
        	String result2 = result1.getString("formatted_address");
        	result2 = result1.getJSONObject("addressComponent").getString("province")+result1.getJSONObject("addressComponent").getString("city");
        	Calendar c = Calendar.getInstance();
         	if(type==2){
         		Long intervalTime = new Date().getTime()-onlineTimes;
    			int ss = 1000;  
    			int mi = ss * 60;  
    			int hh = mi * 60;  
    			int dd = hh * 24;  
             	long day = intervalTime / dd;  
             	long hour = (intervalTime - day * dd) / hh;  
             	long minute = (intervalTime - day * dd - hour * hh) / mi;  
             	long second = (intervalTime - day * dd - hour * hh - minute * mi) / ss;  
             	//long milliSecond = intervalTime - day * dd - hour * hh - minute * mi - second * ss;  
    			String strHour = hour < 10 ? "0" + hour : "" + hour;//小时  
             	String strMinute = minute < 10 ? "0" + minute : "" + minute;//分钟  
             	String strSecond = second < 10 ? "0" + second : "" + second;//秒
         		Usermark um = new Usermark();
    			um.setUpTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
    			um.setOperateType(2);
    			um.setSerialNumber(serialNumber);
    			um.setFyear(c.get(Calendar.YEAR));
    			um.setFmonth(c.get(Calendar.MONTH)+1);
    			um.setFday(c.get(Calendar.DAY_OF_MONTH));
    			um.setFversion(fversion);
    			if(null!=intervalTime&&(intervalTime<0||intervalTime>=60*60*12*1000)){
    				intervalTime = 60*60*1000L;
    			}
    			um.setUseTimes(intervalTime);
    			um.setMarkContent("在线时长:"+strHour+"小时"+strMinute+"分钟"+strSecond+"秒");
    			um.setTakeTime(new Date().getTime());
    			um.setLongitude(longitude);
    			um.setLatitude(latitude);
    			usermarkDao.save(um);
         	}else if(type==1){
         		Usermark um = new Usermark();
    			um.setUpTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
    			um.setOperateType(1);
    			um.setSerialNumber(serialNumber);
    			um.setFyear(c.get(Calendar.YEAR));
    			um.setFmonth(c.get(Calendar.MONTH)+1);
    			um.setFday(c.get(Calendar.DAY_OF_MONTH));
    			um.setMarkContent("登陆地点:"+result2);
    			um.setFversion(fversion);
    			um.setTakeTime(onlineTimes);
    			um.setLongitude(longitude);
    			um.setLatitude(latitude);
    			usermarkDao.save(um);
         	}else{
         		
         	}
			while(rs.next()){
				if(type==1){//设备上线
					exeSendMsg(wxinfo,rs.getString(1),rs.getString(2),rs.getString(3),serialNumber,"上线",result2,onlineTimes,"4jGofaHXCFksCpPVXKyj7wmlt-sv0zmVyPCaokMdFvg",fversion);
				}else if(type==2){//设备下线
					exeSendMsg(wxinfo,rs.getString(1),rs.getString(2),rs.getString(3),serialNumber,"下线",result2,onlineTimes,"3sQ8EWO3CZ8CGL6tLNK2BcY7RThsIgejSPfRvjNGhDI",fversion);
				}else if(type==3){
					//Wxinfo wxinfo,String wxCode,String stName,String stCode,String serialNumber,String result,Float fversion
					File file = new File("/home/yyzk/apache-tomcat-7.0.70/webapps/ROOT/voice/"+serialNumber+"/"+statusMark+".mp3");
					String pathvoice = upload(file, wxinfo.getAccess_token(), Contants.VOICE);
					net.sf.json.JSONObject obj = doPostVoice(wxinfo,rs.getString(1),pathvoice);
					System.out.println("==============================发送结果:"+obj);
					if(obj.getInt("errcode")!=0){
						changeToMp3("/home/yyzk/apache-tomcat-7.0.70/webapps/ROOT/voice/"+serialNumber+"/"+statusMark+".mp3","/home/yyzk/apache-tomcat-7.0.70/webapps/ROOT/voice/"+serialNumber+"/"+statusMark+"-1.mp3");
						exeSendVoiceMsg(wxinfo,rs.getString(1),rs.getString(2),rs.getString(3),serialNumber,statusMark,fversion);
					}
				}else{//设备当前状态
					exeSendMsg2(wxinfo,rs.getString(1),rs.getString(2),serialNumber,statusMark);
				}
			}
			rs.close();
			ps.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(null!=rs){
					rs.close();
				}
				if(null!=ps){
					rs.close();
				}
				if(null!=conn){
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	private void exeSendMsg(Wxinfo wxinfo,String wxCode,String stName,String stCode,String serialNumber,
			String typeInfo,String result2,Long onlineTimes,String templeteid,Float fversion){
		try{
			DeviceModel mm = new DeviceModel();
			mm.setTouser(wxCode);//obGhpv0t_3xV6NUKD3xL2_usAbpo "oI5hev_rC3-o8ks9CIJlwrH1kYfE"
			mm.setTemplate_id(templeteid);
			mm.setUrl("http://www.yiyunzk.com/phone/index.jsp?serialNumber="+serialNumber);
			DeviceMsg data = new DeviceMsg();
			ValueColor title = new ValueColor("小书童:"+(null==stName?"":stName)+typeInfo, "#173177");
			ValueColor deviceCode = new ValueColor(stCode, "#173177");
			ValueColor onLineTime = new ValueColor(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"), "#173177");
			ValueColor remark = new ValueColor("请确认是安全登录！", "#173177");
			data.setFirst(title);
			data.setKeyword1(deviceCode);
			if(typeInfo.equals("下线")){
				Long intervalTime = new Date().getTime()-onlineTimes;
				int ss = 1000;  
				int mi = ss * 60;  
				int hh = mi * 60;  
				int dd = hh * 24;  
             	long day = intervalTime / dd;  
             	long hour = (intervalTime - day * dd) / hh;  
             	long minute = (intervalTime - day * dd - hour * hh) / mi;  
             	long second = (intervalTime - day * dd - hour * hh - minute * mi) / ss;  
             	long milliSecond = intervalTime - day * dd - hour * hh - minute * mi - second * ss;  
             	//String strDay = day < 10 ? "0" + day : "" + day; //天  
             	String strHour = hour < 10 ? "0" + hour : "" + hour;//小时  
             	String strMinute = minute < 10 ? "0" + minute : "" + minute;//分钟  
             	String strSecond = second < 10 ? "0" + second : "" + second;//秒  
             	String strMilliSecond = milliSecond < 10 ? "0" + milliSecond : "" + milliSecond;//毫秒  
             	strMilliSecond = milliSecond < 100 ? "0" + strMilliSecond : "" + strMilliSecond;
				ValueColor oltimes = new ValueColor(strHour+"小时"+strMinute+"分钟"+strSecond+"秒", "#173177");
				data.setKeyword2(onLineTime);
				data.setKeyword3(oltimes);
			}else{
				ValueColor deviceAddress = new ValueColor(result2, "#173177");
				data.setKeyword2(deviceAddress);
				data.setKeyword3(onLineTime);
			}
			data.setRemark(remark);
			mm.setData(data);
			net.sf.json.JSONObject jsonMap = net.sf.json.JSONObject.fromObject(mm);
			String json = jsonMap.toString(); 
			CloseableHttpClient client = HttpClients.createDefault();
			String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
			url = url.replace("ACCESS_TOKEN", wxinfo.getAccess_token());
			HttpPost post = new HttpPost(url);
			post.addHeader("Content-Type","application/json");
			StringEntity param = new StringEntity(json, ContentType.create("application/json", "utf-8"));
			post.setEntity(param);
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			if(sc>=200&&sc<300) {
				System.out.println(EntityUtils.toString(resp.getEntity(),"utf-8"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void exeSendVoiceMsg(Wxinfo wxinfo,String wxCode,String stName,String stCode,String serialNumber,String result,Float fversion){
		try{
			DeviceStatusModel mm = new DeviceStatusModel();
			mm.setTouser(wxCode);
			mm.setTemplate_id("2m65HxVbllrJE9Ez-n8nu_tpy-MwYh3fWeBTYY195vs");
			mm.setUrl("http://www.yiyunzk.com/phone/voicelisten.jsp?serialNumber="+serialNumber+"&filepath="+result);
			DeviceStatusMsg data = new DeviceStatusMsg();
			ValueColor title = new ValueColor("您有一条新消息,大致内容为:"+result, "#173177");
			ValueColor mname = new ValueColor(stCode, "#173177");
			ValueColor time = new ValueColor(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"), "#173177");
			ValueColor remark = new ValueColor("请点击收听语音！", "#173177");
			data.setFirst(title);
			data.setKeyword1(mname);
			data.setKeyword2(time);
			data.setRemark(remark);
			mm.setData(data);
			net.sf.json.JSONObject jsonMap = net.sf.json.JSONObject.fromObject(mm);
			String json = jsonMap.toString(); 
			CloseableHttpClient client = HttpClients.createDefault();
			String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
			url = url.replace("ACCESS_TOKEN", wxinfo.getAccess_token());
			HttpPost post = new HttpPost(url);
			post.addHeader("Content-Type","application/json");
			StringEntity param = new StringEntity(json, ContentType.create("application/json", "utf-8"));
			post.setEntity(param);
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			if(sc>=200&&sc<300) {
				System.out.println(EntityUtils.toString(resp.getEntity(),"utf-8"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void exeSendMsg2(Wxinfo wxinfo,String wxCode,String stName,String serialNumber,String statusMark){
		try{
			DeviceStatusModel mm = new DeviceStatusModel();
			mm.setTouser(wxCode);//obGhpv0t_3xV6NUKD3xL2_usAbpo "oI5hev_rC3-o8ks9CIJlwrH1kYfE"
			mm.setTemplate_id("eGWo5rAeAGrL29syXMpjJ65DGX77vIgwdQEosMptiMI");
			mm.setUrl("http://www.yiyunzk.com");
			String status = "";
			if(statusMark.equals("YIQITING")){
				status = "一起听";
			}else if(statusMark.equals("YIQIWAN")){
				status = "一起玩";
			}else if(statusMark.equals("YIQIKAN")){
				status = "一起看";
			}else if(statusMark.equals("YIYUNQIMENG")){
				status = "依云启蒙";
			}else if(statusMark.equals("HUDONGYOUXI")){
				status = "游戏互动";
			}else{
				return;
			}
			DeviceStatusMsg data = new DeviceStatusMsg();
			ValueColor title = new ValueColor("小书童"+stName+"正在操作:"+status, "#173177");
			ValueColor deviceCode = new ValueColor(serialNumber, "#173177");
			ValueColor deviceStatus = new ValueColor(status+" "+DateUtils.formtDateTime(new Date(), "HH:mm:ss"), "#173177");
			ValueColor remark = new ValueColor("请确认是安全登录！", "#173177");
			data.setFirst(title);
			data.setKeyword1(deviceCode);
			data.setKeyword2(deviceStatus);
			data.setRemark(remark);
			mm.setData(data);
			net.sf.json.JSONObject jsonMap = net.sf.json.JSONObject.fromObject(mm);
			String json = jsonMap.toString(); 
			CloseableHttpClient client = HttpClients.createDefault();
			String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
			url = url.replace("ACCESS_TOKEN", wxinfo.getAccess_token());
			HttpPost post = new HttpPost(url);
			post.addHeader("Content-Type","application/json");
			StringEntity param = new StringEntity(json, ContentType.create("application/json", "utf-8"));
			post.setEntity(param);
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			if(sc>=200&&sc<300) {
				System.out.println(EntityUtils.toString(resp.getEntity(),"utf-8"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * POST请求
	 * 
	 * @param url
	 * @param outStr
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	public static net.sf.json.JSONObject doPostVoice(Wxinfo wxinfo,String wxCode,String path) throws Exception {
		DefaultHttpClient client = new DefaultHttpClient();
		HttpPost httpost = new HttpPost("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token="+wxinfo.getAccess_token());
		net.sf.json.JSONObject jsonObject =  new net.sf.json.JSONObject();
		List<String> list = new ArrayList<String>();
		jsonObject.put("touser", wxCode);
		jsonObject.put("msgtype", "voice");
		net.sf.json.JSONObject jsonObject2 =  new net.sf.json.JSONObject();
		jsonObject2.put("media_id",path);
		jsonObject.put("voice", jsonObject2);
		System.out.println("==="+jsonObject.toString());
		httpost.setEntity(new StringEntity(jsonObject.toString(), "UTF-8"));
		HttpResponse response = client.execute(httpost);
		String result = EntityUtils.toString(response.getEntity(), "UTF-8");
		jsonObject = net.sf.json.JSONObject.fromObject(result);
		return jsonObject;
	}
	public static String upload(File file, String accessToken, String type) throws IOException {
		if (null == file || !file.exists()) {
			throw new IOException("文件不存在");
		}
		String url = Contants.UPLOAD_URL.replace("ACCESS_TOKEN", accessToken).replace("TYPE", type);;

		URL urlObj = new URL(url);
		// 连接
		HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();

		con.setRequestMethod("POST");
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setUseCaches(false);

		// 设置请求头信息
		con.setRequestProperty("Connection", "Keep-Alive");
		con.setRequestProperty("Charset", "UTF-8");

		// 设置边界
		String BOUNDARY = "----------" + System.currentTimeMillis();
		con.setRequestProperty("Content-Type", "multipart/form-data; boundary="+ BOUNDARY);
		StringBuilder sb = new StringBuilder();
		sb.append("--");
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"file\";filelength=\""+file.length()+"\";filename=\"" + file.getName()+ "\"\r\n");
		sb.append("Content-Type:application/octet-stream\r\n\r\n");
		byte[] head = sb.toString().getBytes("utf-8");

		// 获得输出流
		OutputStream out = new DataOutputStream(con.getOutputStream());
		// 输出表头
		out.write(head);

		// 文件正文部分
		// 把文件已流文件的方式 推入到url中
		DataInputStream in = new DataInputStream(new FileInputStream(file));
		int bytes = 0;
		byte[] bufferOut = new byte[1024];
		while ((bytes = in.read(bufferOut)) != -1) {
			out.write(bufferOut, 0, bytes);
		}
		in.close();

		// 结尾部分
		byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");// 定义最后数据分隔线

		out.write(foot);

		out.flush();
		out.close();

		StringBuffer buffer = new StringBuffer();
		BufferedReader reader = null;
		String result = null;
		try {
			// 定义BufferedReader输入流来读取URL的响应
			reader = new BufferedReader(new InputStreamReader(
					con.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			if (result == null) {
				result = buffer.toString();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				reader.close();
			}
		}
		net.sf.json.JSONObject jsonObj = net.sf.json.JSONObject.fromObject(result);
		System.out.println(jsonObj);
		String typeName = "media_id";
		return jsonObj.getString(typeName);
	}

	public void changeToMp3(String sourcePath, String targetPath) {
		/*File source = new File(sourcePath);
		File target = new File(targetPath);
		AudioAttributes audio = new AudioAttributes();
		Encoder encoder = new Encoder();

		audio.setCodec("libmp3lame");
		EncodingAttributes attrs = new EncodingAttributes();
		attrs.setFormat("mp3");
		attrs.setAudioAttributes(audio);

		try {
			encoder.encode(source, target, attrs);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InputFormatException e) {
			e.printStackTrace();
		} catch (EncoderException e) {
			e.printStackTrace();
		}*/
		// ./ffmpeg -i /home/yyzk/30O4AV0G821497490708939.mp3 /home/yyzk/30O4AV0G821497490708939-1.mp3
		//String[] cmds = {"/bin/sh","-c","ps -ef|grep java"};  
		try {
			String[] cmds = {"sh","-c","/home/yyzk/apache-tomcat-7.0.70/temp/jave-1/ffmpeg -i "+sourcePath+" "+targetPath};  
			Process pro = Runtime.getRuntime().exec(cmds);  
			pro.waitFor();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
