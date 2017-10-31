package com.terrence.crm.dol.utils;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

public class SocketHttpRequester {
	public static byte[] visitHttp(String path) throws Exception{
		URL url = new URL(path);
		HttpURLConnection connection = (HttpURLConnection)url.openConnection();
		connection.setRequestMethod("GET");
		connection.setConnectTimeout(5*1000);
		InputStream inStream = connection.getInputStream();
		return StreamTool.readInputStream(inStream);
	}
	/**
	 * 发送xml数据
	 * @param path 请求地址
	 * @param xml xml数据
	 * @param encoding 编码
	 * @return
	 * @throws Exception
	 */
	public static byte[] postXml(String path, String xml, String encoding) throws Exception{
		byte[] data = xml.getBytes(encoding);
		URL url = new URL(path);
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		conn.setRequestProperty("Content-Type", "text/xml; charset="+ encoding);
		conn.setRequestProperty("Content-Length", String.valueOf(data.length));
		conn.setConnectTimeout(5 * 1000);
		OutputStream outStream = conn.getOutputStream();
		outStream.write(data);
		outStream.flush();
		outStream.close();
		if(conn.getResponseCode()==200){
			return readStream(conn.getInputStream());
		}
		return null;
	}
	/**
	 * 提交数据到服务器
	 * @param path 上传路径(注：避免使用localhost或127.0.0.1这样的路径测试，因为它会指向手机模拟器，你可以使用http://www.itcast.cn或http://192.168.1.10:8080这样的路径测试)
	 * @param params 请求参数 key为参数名,value为参数值
	 * @param encode 编码
	 */
	public static byte[] postFromHttpClient(String path, Map<String, String> params, String encode) throws Exception{
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();//用于存放请求参数
		for(Map.Entry<String, String> entry : params.entrySet()){
			formparams.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, encode);
		HttpPost httppost = new HttpPost(path);
		httppost.setEntity(entity);
		HttpClient httpclient = new DefaultHttpClient();//看作是浏览器
		HttpResponse response = httpclient.execute(httppost);//发送post请求		
		return readStream(response.getEntity().getContent());
	}

	/**
	 * 发送请求
	 * @param path 请求路径
	 * @param params 请求参数 key为参数名称 value为参数值
	 * @param encode 请求参数的编码
	 */
	public static byte[] post(String path, byte[] data, String encode) throws Exception{
		URL url = new URL(path);
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setDoOutput(true);//允许对外发送请求参数
		conn.setUseCaches(false);//不进行缓存
		conn.setConnectTimeout(5 * 1000);
		conn.setRequestMethod("POST");
		//下面设置http请求头
		conn.setRequestProperty("Accept", "image/gif, image/jpeg, image/pjpeg, image/pjpeg, application/x-shockwave-flash, application/xaml+xml, application/vnd.ms-xpsdocument, application/x-ms-xbap, application/x-ms-application, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */*");
		conn.setRequestProperty("Accept-Language", "zh-CN");
		conn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Content-Length", String.valueOf(data.length));
		conn.setRequestProperty("Connection", "Keep-Alive");
		
		//发送参数
		DataOutputStream outStream = new DataOutputStream(conn.getOutputStream());
		outStream.write(data);//把参数发送出去
		outStream.flush();
		outStream.close();
		if(conn.getResponseCode()==200){
			return readStream(conn.getInputStream());
		}
		return null;
	}
	
	/**
	 * 读取流
	 * @param inStream
	 * @return 字节数组
	 * @throws Exception
	 */
	public static byte[] readStream(InputStream inStream) throws Exception{
		ByteArrayOutputStream outSteam = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int len = -1;
		while( (len=inStream.read(buffer)) != -1){
			outSteam.write(buffer, 0, len);
		}
		outSteam.close();
		inStream.close();
		return outSteam.toByteArray();
	}
}
