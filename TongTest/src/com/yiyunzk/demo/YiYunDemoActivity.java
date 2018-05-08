package com.yiyunzk.demo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import com.yiyunzk.android.service.YiYunService;
import com.yiyunzk.demo.R;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class YiYunDemoActivity extends Activity {
	private final static String TAG = "YiYunDemoActivity";
	private Button startvoice; 
	private Button lvdeng;
	private int lv = 0;
	@Override  
	public void onCreate(Bundle savedInstanceState) {
	   super.onCreate(savedInstanceState);  
	   setContentView(R.layout.tosplash);
	   /*Intent intent = new Intent(this, YiYunService.class);
	   startService(intent);*/
       startvoice = (Button)findViewById(R.id.startvoice);
       startvoice.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				/*if(startvoice.getText().toString().equals("开始聊天")){
					startvoice.setText("停止聊天");
				}else{
					startvoice.setText("开始聊天");
				}
				Intent intent = new Intent();  
		    	intent.setAction("com.yyzk.voice");  
		    	sendBroadcast(intent);
		    	Log.i(TAG,"向service发送广播成功");*/
				Intent intent0 = new Intent(YiYunDemoActivity.this,TxjzActivity.class);
				startActivity(intent0);
			}
		});
       lvdeng = (Button)findViewById(R.id.lvdeng);
       lvdeng.setOnClickListener(new View.OnClickListener() {
		@Override
		public void onClick(View v) {
			try {
				File filegreen = new File("/sys/class/i2c-adapter/i2c-0/0-0030/green_brightness");
				if(filegreen.exists()&&filegreen.exists()){
					OutputStream outgreen = new FileOutputStream(filegreen);
					if(lv==0){
						lv = 1;
						outgreen.write("300".getBytes());
					}else{
						lv = 0;
						outgreen.write("0".getBytes());
					}
					outgreen.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	});
	 }
	@Override
	protected void onStop() {
		super.onStop();
		finish();
	}
	@Override
	protected void onDestroy() {
		super.onDestroy();
		finish();
	}
}