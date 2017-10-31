package com.terrence.cn.test;

import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class TestYouKu {
	public static void main(String[] args) {
		try {
			/*CloseableHttpClient client = HttpClients.createDefault();
			HttpGet post = new HttpGet("https://openapi.youku.com/v2/videos/by_user.json?user_name=%E4%BA%8C%E5%8D%81%E5%B0%8F%E5%8D%97%E7%93%9C&client_id=e054a004232b7ad2&page=10&count=50");
			post.addHeader("Content-Type","application/json");
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			String jsonStr = "";
			if(sc>=200&&sc<300) {
				jsonStr = EntityUtils.toString(resp.getEntity());
			}
			JSONObject jsonObj;
			jsonObj = new JSONObject(jsonStr);
			JSONArray videos = jsonObj.getJSONArray("videos");
			for(int i=0;i<videos.length();i++){
				JSONObject jo = (JSONObject)videos.get(i);
				System.out.println(jo.getString("id")+""+jo.getString("title")+""+jo.getString("bigThumbnail"));
			}*/
			/*CloseableHttpClient client = HttpClients.createDefault();
			String url = "https://openapi.youku.com/v2/videos/show_batch.json?client_id=e054a004232b7ad2&video_ids=";
			HttpGet post = new HttpGet(url+"XOTE1MzMyMDQ4,XOTE1MzIyNzgw");
			post.addHeader("Content-Type","application/json");
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			String jsonStr = "";
			if(sc>=200&&sc<300) {
				jsonStr = EntityUtils.toString(resp.getEntity());
			}
			JSONObject jsonObj;
			jsonObj = new JSONObject(jsonStr);
			JSONArray videos = jsonObj.getJSONArray("videos");
			for(int i=0;i<videos.length();i++){
				JSONObject jo = (JSONObject)videos.get(i);
				System.out.println(jo.getString("id")+""+jo.getString("title")+""+jo.getString("bigThumbnail"));
			}*/
			
			
			/*CloseableHttpClient client = HttpClients.createDefault();
			String url = "https://openapi.youku.com/v2/videos/show.json?client_id=e054a004232b7ad2&ext=thumbnails,show,dvd,reference&video_id=";
			HttpGet post = new HttpGet(url+"XMjcwMzI5Mzg0OA");
			post.addHeader("Content-Type","application/json");
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			String jsonStr = "";
			if(sc>=200&&sc<300) {
				jsonStr = EntityUtils.toString(resp.getEntity());
			}
			JSONObject jsonObj;
			jsonObj = new JSONObject(jsonStr);
			System.out.println(jsonObj.getString("id")+""+jsonObj.getString("title")+""+jsonObj.getString("bigThumbnail")
					+"=="+jsonObj.getJSONObject("show").getString("seq")+"=="+jsonObj.getJSONObject("show").getString("name")+"=="+jsonObj.getInt("duration"));
			*/
			
			CloseableHttpClient client = HttpClients.createDefault();
			String url = "https://openapi.youku.com/router/rest.json?action=youku.api.vod.search.videoinfo&client_id=e054a004232b7ad2&timestamp=&version=&sign=";
			HttpGet post = new HttpGet(url+"XMjcwMzI5Mzg0OA");
			post.addHeader("Content-Type","application/json");
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			String jsonStr = "";
			if(sc>=200&&sc<300) {
				jsonStr = EntityUtils.toString(resp.getEntity());
			}
			JSONObject jsonObj;
			jsonObj = new JSONObject(jsonStr);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
