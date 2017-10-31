package com.terrence.cn.test;

import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import com.base.util.DateUtil;
import com.terrence.crm.dol.utils.DateUtils;

public class TestWxOrder {
	public static void main(String[] args) {
		try {
			/*String url = "https://api.weixin.qq.com/merchant/order/getbyfilter?access_token=ACCESS_TOKEN";
			url = url.replace("ACCESS_TOKEN","32j7SHPiF5PrRHjXMoD4VPpG9lySZM0T0tv5S8A0Fp5YrREwpAO8a0CX6l-teGWQbvdjpS1fdpu6-SOUOqzrsPo1gSE6QkFunkUb93KUJ-lbfIEWVp0EJ39uzZ0fwGLnIHObAHAEDK");
			SimpleDateFormat formt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			// URLConnectionHelper是一个模拟发送http请求的类
			CloseableHttpClient client = HttpClients.createDefault();
			HttpPost post = new HttpPost(url);
			post.addHeader("Content-Type", "application/json");
			JSONObject jsonParam = new JSONObject();  
			jsonParam.put("status", "2");
			jsonParam.put("begintime", formt.parse("2017-04-26 00:00:00").getTime()/1000);
			jsonParam.put("endtime", formt.parse("2017-04-26 23:59:59").getTime()/1000);
			post.setEntity(new StringEntity(jsonParam.toString(), Charset.forName("UTF-8")));  
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			String jsonStr = "";
			if (sc >= 200 && sc < 300) {
				jsonStr = EntityUtils.toString(resp.getEntity(),"utf-8");
			}
			System.out.println(jsonStr);
			JSONObject jsonObj = new JSONObject(jsonStr);
			JSONArray ja = (JSONArray)jsonObj.get("order_list");
			for(int i=0;i<ja.length();i++){
				jsonObj = ja.getJSONObject(i);
				System.out.println(jsonObj.get("order_id")+"=="+jsonObj.get("order_status")+"=="+jsonObj.get("order_create_time")
						+"=="+jsonObj.get("buyer_openid")+"=="+jsonObj.get("receiver_name")+"=="+jsonObj.get("receiver_mobile"));
			}*/
			
			
			/*String url = "https://api.weixin.qq.com/device/authorize_device?access_token=ACCESS_TOKEN";
			url = url.replace("ACCESS_TOKEN","OZVkeEGbg6V1daJ0qRyZqr49eZcCy-TzYyzUrg0GiSkLaRy1Qo7SoF0YSw5u2og4Ig2Wsw5pJLO4GuP__hl1U3ZZvRMAwcs-5zO3XQQUfKL43bmeRZUJPPP9DBdK7diAUTAaACAONU");
			SimpleDateFormat formt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			// URLConnectionHelper是一个模拟发送http请求的类
			CloseableHttpClient client = HttpClients.createDefault();
			HttpPost post = new HttpPost(url);
			post.addHeader("Content-Type", "application/json");
			JSONObject jsonParam = new JSONObject();  
			jsonParam.put("device_num", "1");
			jsonParam.put("op_type","0");
			jsonParam.put("product_id", "35765");
			
			JSONArray ja = new JSONArray();
			JSONObject jsonParam2 = new JSONObject();  
			jsonParam2.put("id", "11_ww_ee_dd");
			jsonParam2.put("mac", "1234567890AB");
			jsonParam2.put("connect_protocol", "3");
			jsonParam2.put("auth_key", "1234567890ABCDEF1234567890ABCDEF");
			jsonParam2.put("close_strategy", "1");
			jsonParam2.put("conn_strategy", "1");
			jsonParam2.put("crypt_method", "0");
			jsonParam2.put("auth_ver", "0");
			jsonParam2.put("manu_mac_pos", "-1");
			jsonParam2.put("ser_mac_pos", "-2");
			jsonParam2.put("ble_simple_protocol", "0");
			ja.put(1, jsonParam2);
			jsonParam.put("device_list", ja);
			post.setEntity(new StringEntity(jsonParam.toString(), Charset.forName("UTF-8")));  
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			String jsonStr = "";
			if (sc >= 200 && sc < 300) {
				jsonStr = EntityUtils.toString(resp.getEntity(),"utf-8");
			}
			System.out.println(jsonStr);*/
			
			
			/*String url = "https://api.weixin.qq.com/device/authorize_device?access_token=ACCESS_TOKEN";
			url = url.replace("ACCESS_TOKEN","OZVkeEGbg6V1daJ0qRyZqr49eZcCy-TzYyzUrg0GiSkLaRy1Qo7SoF0YSw5u2og4Ig2Wsw5pJLO4GuP__hl1U3ZZvRMAwcs-5zO3XQQUfKL43bmeRZUJPPP9DBdK7diAUTAaACAONU");
			SimpleDateFormat formt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			// URLConnectionHelper是一个模拟发送http请求的类
			CloseableHttpClient client = HttpClients.createDefault();
			HttpPost post = new HttpPost(url);
			post.addHeader("Content-Type", "application/json");
			String str = "<xml>"+
						    "<ToUserName><![CDATA[wx4bfe89447a0d8438]]></ToUserName>"+
						    "<FromUserName><![CDATA[oI5hev_rC3-o8ks9CIJlwrH1kYfE]]></FromUserName>"+
						    "<CreateTime>123456789</CreateTime>"+
						    "<MsgType><![CDATA[1]]></MsgType>"+
						    "<Event><![CDATA[bind]]></Event>"+
						    "<DeviceType><![CDATA[gh_81b3dd521c41]]></DeviceType>"+
						    "<DeviceID><![CDATA[123_abc_uvy]]></DeviceID>"+
						    "<Content><![CDATA[haha]]></Content>"+
						    "<SessionID>%u</SessionID>"+
						    "<OpenID><![CDATA[%s]]></OpenID>"+
						"</xml>";
			post.setEntity(new StringEntity(jsonParam.toString(), Charset.forName("UTF-8")));  
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			String jsonStr = "";
			if (sc >= 200 && sc < 300) {
				jsonStr = EntityUtils.toString(resp.getEntity(),"utf-8");
			}
			System.out.println(jsonStr);*/
			
			
			String url = "https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token=ACCESS_TOKEN";
			url = url.replace("ACCESS_TOKEN","Euay2VegmUFlD7w0BafmYHVcKwbL6JLjwBurtGSonV1ke1j8lcddJBFRgMJ-aJ8CM_dglyMhcEFCo5QeZ6UV6zIu_3PvbrljOcvkOmJmPrJ52CRXESjFhA2DDBXw5o9DZWOaADATQI");
			// URLConnectionHelper是一个模拟发送http请求的类
			CloseableHttpClient client = HttpClients.createDefault();
			HttpPost post = new HttpPost(url);
			post.addHeader("Content-Type", "application/json");
			JSONObject jsonParam2 = new JSONObject();  
			jsonParam2.put("type", "news");
			jsonParam2.put("offset", "0");
			jsonParam2.put("count", "100");
			post.setEntity(new StringEntity(jsonParam2.toString(), Charset.forName("UTF-8")));  
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			String jsonStr = "";
			if (sc >= 200 && sc < 300) {
				jsonStr = EntityUtils.toString(resp.getEntity(),"utf-8");
			}
			System.out.println(jsonStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
