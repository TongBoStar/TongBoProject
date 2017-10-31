package com.terrence.crm.dol.servlet;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

public class Test {
	public static void main(String[] args) throws Exception {
		String URL = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=dniLRNtXG-n8XydERZjV9qyuQqdMtpuhQM2t0FRoigzI07zLimHKiUpP9wvvBIUzDDvDQHWL1pro6WQQ_93nOC0TOfS-DbFeFRSRCIveCjmWWGSuLJ9KFHsoCirzVb6CVNCcAGABTI&openid=oVvr0vw_SXLlgpVRTwz8wO2RxY74";
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
		String openid = jsonObj.get("headimgurl").toString();
		String nickName = jsonObj.getString("nickname").toString();
		String sex = jsonObj.getString("sex").toString();
		String city = jsonObj.getString("city").toString();
		String country = jsonObj.getString("country").toString();
		System.out.println(openid);
		System.out.println(new String(nickName.getBytes("iso-8859-1"),"UTF-8"));
		System.out.println(new String(sex.getBytes("iso-8859-1"),"UTF-8"));
		System.out.println(new String(city.getBytes("iso-8859-1"),"UTF-8"));
		System.out.println(new String(country.getBytes("iso-8859-1"),"UTF-8"));
		System.out.println();
	}
}
