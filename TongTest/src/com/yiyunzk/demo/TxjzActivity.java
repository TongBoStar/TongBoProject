package com.yiyunzk.demo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;


public class TxjzActivity extends Activity  implements OnClickListener {
	private final static String TAG = "TxjzActivity";
	private Runtime rn;
	private TextView ultv;
	private TextView urtv;
	private TextView bltv;
	private TextView brtv;
	private Button txjzulu,txjzuru,txjzmru,txjzmrb,txjzrlb,txjzblb,txjzmlb,txjzmlu,txjzuback,txjzrestore;
	@Override  
	public void onCreate(Bundle savedInstanceState) {  
	   super.onCreate(savedInstanceState);  
	   setContentView(R.layout.sttxjz); 
	   
	   Intent intent = new Intent("com.android.systemui.show");
	   sendBroadcast(intent); //显示
	   ultv = (TextView)findViewById(R.id.txjzultv);
	   urtv = (TextView)findViewById(R.id.txjzurtv);
	   bltv = (TextView)findViewById(R.id.txjzbltv);
	   brtv = (TextView)findViewById(R.id.txjzbrtv);
	   txjzulu = (Button)findViewById(R.id.txjzulu);
	   txjzuru = (Button)findViewById(R.id.txjzuru);
	   txjzmru = (Button)findViewById(R.id.txjzmru);
	   txjzmrb = (Button)findViewById(R.id.txjzmrb);
	   txjzrlb = (Button)findViewById(R.id.txjzrlb);
	   txjzblb = (Button)findViewById(R.id.txjzblb);
	   txjzmlb = (Button)findViewById(R.id.txjzmlb);
	   txjzmlu = (Button)findViewById(R.id.txjzmlu);
	   txjzuback = (Button)findViewById(R.id.txjzuback);
	   txjzrestore = (Button)findViewById(R.id.txjzrestore);
	   txjzulu.setOnClickListener(this);
	   txjzulu.setOnFocusChangeListener(new MyLayoutListenter());
	   txjzuru.setOnClickListener(this);
	   txjzuru.setOnFocusChangeListener(new MyLayoutListenter());
	   txjzmru.setOnClickListener(this);
	   txjzmru.setOnFocusChangeListener(new MyLayoutListenter());
	   txjzmrb.setOnClickListener(this);
	   txjzmrb.setOnFocusChangeListener(new MyLayoutListenter());
	   txjzrlb.setOnClickListener(this);
	   txjzrlb.setOnFocusChangeListener(new MyLayoutListenter());
	   txjzblb.setOnClickListener(this);
	   txjzblb.setOnFocusChangeListener(new MyLayoutListenter());
	   txjzmlb.setOnClickListener(this);
	   txjzmlb.setOnFocusChangeListener(new MyLayoutListenter());
	   txjzmlu.setOnClickListener(this);
	   txjzmlu.setOnFocusChangeListener(new MyLayoutListenter());
	   txjzuback.setOnClickListener(this);
	   txjzuback.setOnFocusChangeListener(new MyLayoutListenter());
	   txjzrestore.setOnClickListener(this);
	   txjzrestore.setOnFocusChangeListener(new MyLayoutListenter());
	   try {
		   rn = Runtime.getRuntime();
		   Process process = rn.exec("adb shell getprop persist.sys.keystone.lb");
		   //获得结果的输入流
		   InputStream input = process.getInputStream();
		   BufferedReader br = new BufferedReader(new InputStreamReader(input));
		   String strLine;
		   while(null != (strLine = br.readLine())){
			   bltv.setText(strLine);
		   }
		   process = rn.exec("adb shell getprop persist.sys.keystone.lt");
		   //获得结果的输入流
		   input = process.getInputStream();
		   br = new BufferedReader(new InputStreamReader(input));
		   while(null != (strLine = br.readLine())){
			   ultv.setText(strLine);
		   }
		   process = rn.exec("adb shell getprop persist.sys.keystone.rb");
		   //获得结果的输入流
		   input = process.getInputStream();
		   br = new BufferedReader(new InputStreamReader(input));
		   while(null != (strLine = br.readLine())){
			   brtv.setText(strLine);
		   }
		   process = rn.exec("adb shell getprop persist.sys.keystone.rt");
		   //获得结果的输入流
		   input = process.getInputStream();
		   br = new BufferedReader(new InputStreamReader(input));
		   while(null != (strLine = br.readLine())){
			   urtv.setText(strLine);
		   }
		   br.close();
		   input.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Override
	protected void onStop() {
		super.onStop();
	}
	@Override
	protected void onDestroy() {
		super.onDestroy();
	}
	@Override
	public void onClick(View v) {
		try {
			System.out.println("v.getId()："+v.getId());
			switch (v.getId()) {
			case R.id.txjzulu:
				System.out.println("1:这里是上边向上扩展");
				Toast.makeText(TxjzActivity.this, "正在设置", 0).show();
				//rn.exec("adb shell setprop persist.sys.keystone.lt "+ultv.getText().toString().split(",")[0]+","+(Integer.valueOf(ultv.getText().toString().split(",")[1])+10));
				//rn.exec("adb shell setprop persist.sys.keystone.rt "+urtv.getText().toString().split(",")[0]+","+(Integer.valueOf(urtv.getText().toString().split(",")[1])+10));
				rn.exec("adb shell setprop persist.sys.keystone.lt "+(Integer.valueOf(ultv.getText().toString().split(",")[0])-10)+","+ultv.getText().toString().split(",")[1]);
				rn.exec("adb shell setprop persist.sys.keystone.rt "+(Integer.valueOf(urtv.getText().toString().split(",")[0])+10)+","+urtv.getText().toString().split(",")[1]);
				rn.exec("adb shell setprop persist.sys.keystone.update 1");
				break;
			case R.id.txjzuru:
				Toast.makeText(TxjzActivity.this, "正在设置", 0).show();
				System.out.println("2:这里是上边向下收缩");
				//rn.exec("adb shell setprop persist.sys.keystone.lt "+ultv.getText().toString().split(",")[0]+","+(Integer.valueOf(ultv.getText().toString().split(",")[1])-10));
				//rn.exec("adb shell setprop persist.sys.keystone.rt "+urtv.getText().toString().split(",")[0]+","+(Integer.valueOf(urtv.getText().toString().split(",")[1])-10));
				rn.exec("adb shell setprop persist.sys.keystone.lt "+(Integer.valueOf(ultv.getText().toString().split(",")[0])+10)+","+ultv.getText().toString().split(",")[1]);
				rn.exec("adb shell setprop persist.sys.keystone.rt "+(Integer.valueOf(urtv.getText().toString().split(",")[0])-10)+","+urtv.getText().toString().split(",")[1]);
				rn.exec("adb shell setprop persist.sys.keystone.update 1");
				break;
			case R.id.txjzmru:
				Toast.makeText(TxjzActivity.this, "正在设置", 0).show();
				System.out.println("3:这里是右边向外扩展");
				//rn.exec("adb shell setprop persist.sys.keystone.rt "+(Integer.valueOf(urtv.getText().toString().split(",")[0])+10)+","+urtv.getText().toString().split(",")[1]);
				//rn.exec("adb shell setprop persist.sys.keystone.rb "+(Integer.valueOf(brtv.getText().toString().split(",")[0])+10)+","+brtv.getText().toString().split(",")[1]);
				rn.exec("adb shell setprop persist.sys.keystone.rt "+urtv.getText().toString().split(",")[0]+","+(Integer.valueOf(urtv.getText().toString().split(",")[1])+10));
				rn.exec("adb shell setprop persist.sys.keystone.rb "+brtv.getText().toString().split(",")[0]+","+(Integer.valueOf(brtv.getText().toString().split(",")[1])-10));
				rn.exec("adb shell setprop persist.sys.keystone.update 1");
				break;
			case R.id.txjzmrb:
				System.out.println("4:这里是右边向内收缩");
				Toast.makeText(TxjzActivity.this, "正在设置", 0).show();
				//rn.exec("adb shell setprop persist.sys.keystone.rt "+(Integer.valueOf(urtv.getText().toString().split(",")[0])-10)+","+urtv.getText().toString().split(",")[1]);
				//rn.exec("adb shell setprop persist.sys.keystone.rb "+(Integer.valueOf(brtv.getText().toString().split(",")[0])-10)+","+brtv.getText().toString().split(",")[1]);
				rn.exec("adb shell setprop persist.sys.keystone.rt "+urtv.getText().toString().split(",")[0]+","+(Integer.valueOf(urtv.getText().toString().split(",")[1])-10));
				rn.exec("adb shell setprop persist.sys.keystone.rb "+brtv.getText().toString().split(",")[0]+","+(Integer.valueOf(brtv.getText().toString().split(",")[1])+10));
				rn.exec("adb shell setprop persist.sys.keystone.update 1");
				break;
			case R.id.txjzrlb:
				System.out.println("5:这里是下边向下扩展");
				Toast.makeText(TxjzActivity.this, "正在设置", 0).show();
				//rn.exec("adb shell setprop persist.sys.keystone.rb "+(brtv.getText().toString().split(",")[0])+","+(Integer.valueOf(brtv.getText().toString().split(",")[1])-10));
				//rn.exec("adb shell setprop persist.sys.keystone.lb "+(bltv.getText().toString().split(",")[0])+","+(Integer.valueOf(bltv.getText().toString().split(",")[1])-10));
				rn.exec("adb shell setprop persist.sys.keystone.rb "+(Integer.valueOf(brtv.getText().toString().split(",")[0])-10)+","+brtv.getText().toString().split(",")[1]);
				rn.exec("adb shell setprop persist.sys.keystone.lb "+(Integer.valueOf(bltv.getText().toString().split(",")[0])+10)+","+bltv.getText().toString().split(",")[1]);
				rn.exec("adb shell setprop persist.sys.keystone.update 1");
				break;
			case R.id.txjzblb:
				System.out.println("6:这里是下边向上缩进");
				Toast.makeText(TxjzActivity.this, "正在设置", 0).show();
				//rn.exec("adb shell setprop persist.sys.keystone.rb "+(brtv.getText().toString().split(",")[0])+","+(Integer.valueOf(brtv.getText().toString().split(",")[1])+10));
				//rn.exec("adb shell setprop persist.sys.keystone.lb "+(bltv.getText().toString().split(",")[0])+","+(Integer.valueOf(bltv.getText().toString().split(",")[1])+10));
				rn.exec("adb shell setprop persist.sys.keystone.lb "+(Integer.valueOf(bltv.getText().toString().split(",")[0])-10)+","+bltv.getText().toString().split(",")[1]);
				rn.exec("adb shell setprop persist.sys.keystone.rb "+(Integer.valueOf(brtv.getText().toString().split(",")[0])+10)+","+brtv.getText().toString().split(",")[1]);
				rn.exec("adb shell setprop persist.sys.keystone.update 1");
				break;
			case R.id.txjzmlb:
				System.out.println("7:这里是左边向左扩展");
				Toast.makeText(TxjzActivity.this, "正在设置", 0).show();
				//rn.exec("adb shell setprop persist.sys.keystone.lt "+(Integer.valueOf(ultv.getText().toString().split(",")[0])-10)+","+brtv.getText().toString().split(",")[1]);
				//rn.exec("adb shell setprop persist.sys.keystone.lb "+(Integer.valueOf(bltv.getText().toString().split(",")[0])-10)+","+bltv.getText().toString().split(",")[1]);
				rn.exec("adb shell setprop persist.sys.keystone.lt "+ultv.getText().toString().split(",")[0]+","+(Integer.valueOf(ultv.getText().toString().split(",")[1])-10));
				rn.exec("adb shell setprop persist.sys.keystone.lb "+bltv.getText().toString().split(",")[0]+","+(Integer.valueOf(bltv.getText().toString().split(",")[1])+10));
				rn.exec("adb shell setprop persist.sys.keystone.update 1");
				break;
			case R.id.txjzmlu:
				System.out.println("8:这里是左边向右缩进");
				Toast.makeText(TxjzActivity.this, "正在设置", 0).show();
				//rn.exec("adb shell setprop persist.sys.keystone.lt "+(Integer.valueOf(ultv.getText().toString().split(",")[0])+10)+","+brtv.getText().toString().split(",")[1]);
				//rn.exec("adb shell setprop persist.sys.keystone.lb "+(Integer.valueOf(bltv.getText().toString().split(",")[0])+10)+","+bltv.getText().toString().split(",")[1]);
				rn.exec("adb shell setprop persist.sys.keystone.lt "+ultv.getText().toString().split(",")[0]+","+(Integer.valueOf(ultv.getText().toString().split(",")[1])+10));
				rn.exec("adb shell setprop persist.sys.keystone.lb "+bltv.getText().toString().split(",")[0]+","+(Integer.valueOf(bltv.getText().toString().split(",")[1])-10));
				rn.exec("adb shell setprop persist.sys.keystone.update 1");
				break;
			case R.id.txjzuback:
				Intent intent=new Intent(TxjzActivity.this,YiYunDemoActivity.class);
				startActivity(intent);
				break;
			case R.id.txjzrestore:
				Toast.makeText(TxjzActivity.this, "正在设置", 0).show();
				rn.exec("adb shell setprop persist.sys.keystone.lb 0,0");
				rn.exec("adb shell setprop persist.sys.keystone.lt 0,0");
		    	rn.exec("adb shell setprop persist.sys.keystone.rb 0,0");
		    	rn.exec("adb shell setprop persist.sys.keystone.rt 0,0");
		    	rn.exec("adb shell setprop persist.sys.keystone.update 1");
				/*File file = new File("/sys/devices/20072000.i2c/i2c-0/0-001b/set2607Flip");
				if(file.exists()&&file.exists()){
					OutputStream out = new FileOutputStream(file);
					out.write("1".getBytes());
					out.close();
				}*/
				break;
			default:
				break;
			}
			Process process = rn.exec("adb shell getprop persist.sys.keystone.lt");
		   //获得结果的输入流
		   InputStream input = process.getInputStream();
		   BufferedReader br = new BufferedReader(new InputStreamReader(input));
		   String strLine;
		   while(null != (strLine = br.readLine())){
			   ultv.setText(strLine);
			   System.out.println("=============0strLine:"+strLine);
		   }
		   process = rn.exec("adb shell getprop persist.sys.keystone.rt");
		   //获得结果的输入流
		   input = process.getInputStream();
		   br = new BufferedReader(new InputStreamReader(input));
		   while(null != (strLine = br.readLine())){
			   urtv.setText(strLine);
			   System.out.println("=============1strLine:"+strLine);
		   }
		   process = rn.exec("adb shell getprop persist.sys.keystone.rb");
		   //获得结果的输入流
		   input = process.getInputStream();
		   br = new BufferedReader(new InputStreamReader(input));
		   while(null != (strLine = br.readLine())){
			   brtv.setText(strLine);
			   System.out.println("=============2strLine:"+strLine);
		   }
		   process = rn.exec("adb shell getprop persist.sys.keystone.lb");
		   //获得结果的输入流
		   input = process.getInputStream();
		   br = new BufferedReader(new InputStreamReader(input));
		   while(null != (strLine = br.readLine())){
			   bltv.setText(strLine);
			   System.out.println("=============3strLine:"+strLine); 
		   }
		   br.close();
		   input.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	class MyLayoutListenter implements OnFocusChangeListener{
		@SuppressLint("NewApi")
		@Override
		public void onFocusChange(View v, boolean hasFocus) {
			if(hasFocus){
				v.setScaleX(1.2F);
				v.setScaleY(1.2F);
			}else{
				v.setScaleX(1F);
				v.setScaleY(1F);
			}
		}
	}
}