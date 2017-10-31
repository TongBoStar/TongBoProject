package com.terrence.cn.test.wxmms;

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
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

public class WeiXinSend {
	private static final String ACCESS_TOKEN= "hBgdDm93U4DDkINdTOFWFArfmVNKLiwEMdx3QsSbJxZxO01Jt4ohlzr9w_fO5XTN15CMGMF1Xj_wm5VdzY80w7YEJnD3OVWdFMs_DAAAz64XJZcAFANZP";
	public static void main(String[] args) {
		try {
			File file = new File("E://123.mp3");
			//String path = upload(file, ACCESS_TOKEN, Contants.VOICE);
			//JSONObject obj = doPostStrTxt(path);
			JSONObject obj = doPostVoice("ZXC0avvjkO9nk_HwZo3qvJGL2MzWSGd3x06GmZCKi6AvBnsVJv5Ij4kujsRAbPs7");
			System.out.println("---"+obj.toString());
		} catch (Exception e) {
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
	public static JSONObject doPostStr(String path) throws ParseException, IOException {
		DefaultHttpClient client = new DefaultHttpClient();
		HttpPost httpost = new HttpPost("https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=-qetJkYfARVeU-kZzdJc3Ow3zx2WdeE20ctq2NSa0ftnoXQHX9NZoFWdXmKa669nJDQ4uvldrAwvs1scuLL0m5LRuF0S7GtDG7X0MfLGM3L-4Lw5Ot3Egva5HLilr96oDWQcAAAOHB");
		JSONObject jsonObject =  new JSONObject();
		List<String> list = new ArrayList<String>();
		list.add("oI5hevwfXtsaOnEGVoRAVNIUhdGs");
		list.add("oI5hev_rC3-o8ks9CIJlwrH1kYfE");
		jsonObject.put("touser", list);
		jsonObject.put("msgtype", "voice");
		JSONObject jsonObject2 =  new JSONObject();
		jsonObject2.put("media_id",path);
		jsonObject.put("voice", jsonObject2);
		System.out.println("==="+jsonObject.toString());
		httpost.setEntity(new StringEntity(jsonObject.toString(), "UTF-8"));
		HttpResponse response = client.execute(httpost);
		String result = EntityUtils.toString(response.getEntity(), "UTF-8");
		jsonObject = JSONObject.fromObject(result);
		return jsonObject;
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
	public static JSONObject doPostStrTxt()
			throws ParseException, IOException {
		DefaultHttpClient client = new DefaultHttpClient();
		HttpPost httpost = new HttpPost("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=-qetJkYfARVeU-kZzdJc3Ow3zx2WdeE20ctq2NSa0ftnoXQHX9NZoFWdXmKa669nJDQ4uvldrAwvs1scuLL0m5LRuF0S7GtDG7X0MfLGM3L-4Lw5Ot3Egva5HLilr96oDWQcAAAOHB");
		JSONObject jsonObject =  new JSONObject();
		List<String> list = new ArrayList<String>();
		jsonObject.put("touser", "oI5hev_rC3-o8ks9CIJlwrH1kYfE");
		jsonObject.put("msgtype", "text");
		JSONObject jsonObject2 =  new JSONObject();
		jsonObject2.put("content","88888888");
		jsonObject.put("text", jsonObject2);
		System.out.println("==="+jsonObject.toString());
		httpost.setEntity(new StringEntity(jsonObject.toString(), "UTF-8"));
		HttpResponse response = client.execute(httpost);
		String result = EntityUtils.toString(response.getEntity(), "UTF-8");
		jsonObject = JSONObject.fromObject(result);
		return jsonObject;
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
	public static JSONObject doPostVoice(String path) throws ParseException, IOException {
		DefaultHttpClient client = new DefaultHttpClient();
		HttpPost httpost = new HttpPost("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token="+ACCESS_TOKEN);
		JSONObject jsonObject =  new JSONObject();
		List<String> list = new ArrayList<String>();
		jsonObject.put("touser", "oI5hev_rC3-o8ks9CIJlwrH1kYfE");
		jsonObject.put("msgtype", "voice");
		JSONObject jsonObject2 =  new JSONObject();
		jsonObject2.put("media_id",path);
		jsonObject.put("voice", jsonObject2);
		System.out.println("==="+jsonObject.toString());
		httpost.setEntity(new StringEntity(jsonObject.toString(), "UTF-8"));
		HttpResponse response = client.execute(httpost);
		String result = EntityUtils.toString(response.getEntity(), "UTF-8");
		jsonObject = JSONObject.fromObject(result);
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
		JSONObject jsonObj = JSONObject.fromObject(result);
		System.out.println(jsonObj);
		String typeName = "media_id";
		return jsonObj.getString(typeName);
	}
}
