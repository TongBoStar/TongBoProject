package com.terrence.cn.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Random;

public class DownloadPdf {

	/**
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		try {
			final int[] ii = new int[]{8888,8089};
			while(true){
				for(int i=0;i<100;i++){
					new Thread(new Runnable() {
						@Override
						public void run() {
							try {
								Random random=new Random();
								int r = random.nextInt(2);//4383_1479873233771.dwg  partsinfofiles 
								System.out.println("==================="+r);
								download("http://221.6.134.45:"+ii[r]+"/files/pic//2015/196/15/18_1436938361595.pdf","ddf.pdf", "D:\\imagedown\\");
								//download("http://www.yiyunzk.com/qrcode/000003.jpg","3.jpg", "D:\\imagedown\\");
							} catch (Exception e) {
								System.out.println(e.getMessage());
							}
						}
					}).start();
				}
				Thread.sleep(10000);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void download(String urlString, String filename,String savePath) throws Exception {
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
		OutputStream os = new FileOutputStream(sf.getPath() + "\\" + filename);
		// 开始读取
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		// 完毕，关闭所有链接
		os.close();
		is.close();
	}

}