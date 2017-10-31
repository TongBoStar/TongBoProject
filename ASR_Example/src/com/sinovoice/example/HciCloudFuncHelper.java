package com.sinovoice.example;

import java.io.File;
import java.io.UnsupportedEncodingException;

import android.content.Context;
import android.os.Environment;
import android.util.Log;
import android.widget.TextView;

import com.sinovoice.hcicloudsdk.common.HciErrorCode;
import com.sinovoice.hcicloudsdk.common.Session;
import com.sinovoice.hcicloudsdk.common.asr.AsrConfig;
import com.sinovoice.hcicloudsdk.common.asr.AsrGrammarId;
import com.sinovoice.hcicloudsdk.common.asr.AsrInitParam;
import com.sinovoice.hcicloudsdk.common.asr.AsrRecogResult;
import com.sinovoice.hcicloudsdk.api.HciCloudSys;
import com.sinovoice.hcicloudsdk.api.asr.HciCloudAsr;


public class HciCloudFuncHelper extends HciCloudHelper{
    private static final String TAG = HciCloudFuncHelper.class.getSimpleName();

	/*
	 * 非实时识别
	 */
	public static void Recog(String capkey,AsrConfig recogConfig,String audioFile) {
		ShowMessage("......Recog ......");

		// 载入语音数据文件
		byte[] voiceData = getAssetFileData(audioFile);
		if (null == voiceData) {
			ShowMessage("Open input voice file" + audioFile + " error!");
			return;
		}

		// 启动 ASR Session
		int errCode = -1;
		AsrConfig config = new AsrConfig();
		config.addParam(AsrConfig.SessionConfig.PARAM_KEY_CAP_KEY, capkey);
		config.addParam(AsrConfig.SessionConfig.PARAM_KEY_REALTIME, "no");
		config.addParam(AsrConfig.AudioConfig.PARAM_KEY_ENCODE, AsrConfig.AudioConfig.VALUE_OF_PARAM_ENCODE_SPEEX);
		String sSessionConfig = config.getStringConfig();
		sSessionConfig += "," + recogConfig.getStringConfig();
		Log.i(TAG, "hciAsrSessionStart config: " + sSessionConfig);
		Session nSessionId = new Session();
		errCode = HciCloudAsr.hciAsrSessionStart(sSessionConfig, nSessionId);
		if (HciErrorCode.HCI_ERR_NONE != errCode) {
			ShowMessage("hciAsrSessionStart error:" + HciCloudSys.hciGetErrorInfo(errCode));
			return;
		}
		ShowMessage("hciAsrSessionStart Success");

		// 识别
		AsrRecogResult asrResult = new AsrRecogResult();
		Log.i(TAG, "HciCloudAsr hciAsrRecog config：" + recogConfig + "\n");
		errCode = HciCloudAsr.hciAsrRecog(nSessionId, voiceData, null, null, asrResult);

		if (HciErrorCode.HCI_ERR_NONE == errCode) {
			Log.i(TAG, "HciCloudAsr hciAsrRecog Success");
			// 输出识别结果
			printAsrResult(asrResult);
		}
		else{
			ShowMessage("hciAsrRecog error:" + HciCloudSys.hciGetErrorInfo(errCode));
		}
		
		// 终止session
		HciCloudAsr.hciAsrSessionStop(nSessionId);
		ShowMessage("hciAsrSessionStop");
	}

	
	/*
	 *实时识别
	 */
	public static void RealtimeRecog(String capkey,AsrConfig recogConfig,String audioFile) {
		ShowMessage("......RealtimeRecog ......");

		// 载入语音数据文件
		byte[] voiceData = getAssetFileData(audioFile);
		if (null == voiceData) {
			ShowMessage("Open input voice file" + audioFile + " error!");
			return;
		}

		// 启动 ASR Session
		int errCode = -1;
		AsrConfig config = new AsrConfig();
		config.addParam(AsrConfig.SessionConfig.PARAM_KEY_CAP_KEY, capkey);
		config.addParam(AsrConfig.SessionConfig.PARAM_KEY_REALTIME, AsrConfig.VALUE_OF_YES);
		config.addParam(AsrConfig.AudioConfig.PARAM_KEY_ENCODE, AsrConfig.AudioConfig.VALUE_OF_PARAM_ENCODE_SPEEX);
		String sSessionConfig = config.getStringConfig();
		sSessionConfig += "," + recogConfig.getStringConfig();
		Log.i(TAG, "hciAsrSessionStart config: " + sSessionConfig);
		Session nSessionId = new Session();
		errCode = HciCloudAsr.hciAsrSessionStart(sSessionConfig, nSessionId);
		if (HciErrorCode.HCI_ERR_NONE != errCode) {
			ShowMessage("hciAsrSessionStart error:" + HciCloudSys.hciGetErrorInfo(errCode));
			return;
		}
		ShowMessage("hciAsrSessionStart Success");
		
		AsrRecogResult asrResult = new AsrRecogResult();
		int nPerLen = 6400; //0.2s
		int nLen = 0;
		while (nLen < voiceData.length) {
			if (voiceData.length - nLen <= nPerLen) {
				nPerLen = voiceData.length - nLen;
			}

			byte[] subVoiceData = new byte[nPerLen];
			System.arraycopy(voiceData, nLen, subVoiceData, 0, nPerLen);
			// 调用识别方法,将音频数据不短的传入引擎
			errCode = HciCloudAsr.hciAsrRecog(nSessionId, subVoiceData, null, null, asrResult);
			if (errCode == HciErrorCode.HCI_ERR_ASR_REALTIME_END) {
				// 检测到末端点
				errCode = HciCloudAsr.hciAsrRecog(nSessionId, null, null, null, asrResult);					
				if (HciErrorCode.HCI_ERR_NONE == errCode) {					
					ShowMessage("hciAsrRecog Success");
					// 输出识别结果
					printAsrResult(asrResult);
				}
				else{
					ShowMessage("hciAsrRecog error:" + HciCloudSys.hciGetErrorInfo(errCode));
				}
			}else if (errCode == HciErrorCode.HCI_ERR_ASR_REALTIME_WAITING 
					|| errCode == HciErrorCode.HCI_ERR_ASR_REALTIME_NO_VOICE_INPUT) {
				//在连续识别的场景，忽略这两个情况，继续识别后面的音频。
				//HCI_ERR_ASR_REALTIME_WAITING （实时识别等待音频）含义是：还没有数据，或者是需要更多数据。
				//HCI_ERR_ASR_REALTIME_NO_VOICE_INPUT 含义是：没有检测到音频起点，即超过了vadHead的范围（此时可以让设备进入休眠状态）

				Log.i(TAG, "hciAsrRecog return errCode:" + errCode); 
				
				nLen += nPerLen;
			}
			else {
				// 识别失败
				ShowMessage("hciAsrRecog error:" + HciCloudSys.hciGetErrorInfo(errCode));
				break;
			}

			try {
				//模拟真实说话人语速，发送200ms数据后需等待200ms
				Thread.sleep(200); 
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}

		// 若未检测到端点，但数据已经传入完毕，则需要告诉引擎数据输入完毕
		if (errCode == HciErrorCode.HCI_ERR_ASR_REALTIME_END 
				|| errCode == HciErrorCode.HCI_ERR_ASR_REALTIME_WAITING) {
			errCode = HciCloudAsr.hciAsrRecog(nSessionId, null, recogConfig.getStringConfig(), null, asrResult);
			if (HciErrorCode.HCI_ERR_NONE == errCode) {
				Log.i(TAG, "HciCloudAsr hciAsrRecog Success");
				// 输出识别结果
				printAsrResult(asrResult);
			}
			else{
				ShowMessage("hciAsrRecog error:" + HciCloudSys.hciGetErrorInfo(errCode));
			}
		}
		
		// 终止session
		HciCloudAsr.hciAsrSessionStop(nSessionId);
		ShowMessage("hciAsrSessionStop");
	}
	
	/**
	 * 输出ASR识别结果
	 * 
	 * @param recogResult
	 *            识别结果
	 */
	private static void printAsrResult(AsrRecogResult recogResult) {
		if (recogResult.getRecogItemList().size() < 1) {
			ShowMessage("recognize result is null");
		}
		for (int i = 0; i < recogResult.getRecogItemList().size(); i++) {
			if (recogResult.getRecogItemList().get(i).getRecogResult() != null) {
				String utf8 = recogResult.getRecogItemList().get(i)
						.getRecogResult();
				ShowMessage("result index:" + String.valueOf(i) + " result:" + utf8);
			} else {
				ShowMessage("result index:" + String.valueOf(i) + " result: null");
			}
		}
	}

	public static void Func(Context context,String capkey,TextView view) {			

		setTextView(view);
		setContext(context);
		
		//初始化ASR
		//构造Asr初始化的帮助类的实例
        AsrInitParam asrInitParam = new AsrInitParam();
        // 获取App应用中的lib的路径,放置能力所需资源文件。如果使用/data/data/packagename/lib目录,需要添加android_so的标记
        //String dataPath = context.getFilesDir().getAbsolutePath().replace("files", "lib");
        //asrInitParam.addParam(AsrInitParam.PARAM_KEY_FILE_FLAG, AsrInitParam.VALUE_OF_PARAM_FILE_FLAG_ANDROID_SO);
        
        String dataPath = Environment.getExternalStorageDirectory().getAbsolutePath()+ File.separator + "sinovoice"
                + File.separator + context.getPackageName() + File.separator + "data";
        copyAssetsFiles(context,dataPath);
        asrInitParam.addParam(AsrInitParam.PARAM_KEY_DATA_PATH, dataPath);
      
        asrInitParam.addParam(AsrInitParam.PARAM_KEY_INIT_CAP_KEYS, capkey);
        ShowMessage("HciAsrInit config :" + asrInitParam.getStringConfig());
        int errCode = HciCloudAsr.hciAsrInit(asrInitParam.getStringConfig());
        if (errCode != HciErrorCode.HCI_ERR_NONE) {
            ShowMessage("HciAsrInit error:" + HciCloudSys.hciGetErrorInfo(errCode));
            return;
        } else {
        	ShowMessage("HciAsrInit Success");
        }
        
        AsrGrammarId grammarId = new AsrGrammarId();
        if(capkey.equalsIgnoreCase("asr.local.grammar.v4")){
        	
        	AsrConfig loadConfig = new AsrConfig();
        	loadConfig.addParam(AsrConfig.GrammarConfig.PARAM_KEY_GRAMMAR_TYPE, AsrConfig.GrammarConfig.VALUE_OF_PARAM_GRAMMAR_TYPE_JSGF);
        	loadConfig.addParam(AsrConfig.GrammarConfig.PARAM_KEY_IS_FILE, AsrConfig.VALUE_OF_NO);
        	loadConfig.addParam(AsrConfig.SessionConfig.PARAM_KEY_CAP_KEY, capkey);
    		byte[] grammarData = getAssetFileData("stock_10001.gram");
    		String strGrammarData = null;
			try {
				strGrammarData = new String(grammarData, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
        	errCode = HciCloudAsr.hciAsrLoadGrammar(loadConfig.getStringConfig(), strGrammarData, grammarId);
        	if (errCode != HciErrorCode.HCI_ERR_NONE) {
                ShowMessage("hciAsrLoadGrammar error:" + HciCloudSys.hciGetErrorInfo(errCode));
                HciCloudAsr.hciAsrRelease();        
                return;
            } else {
            	ShowMessage("hciAsrLoadGrammar Success");
            }
        }
        
        AsrConfig recogConfig = new AsrConfig();
        if(grammarId.isValid()){
        	recogConfig.addParam(AsrConfig.GrammarConfig.PARAM_KEY_GRAMMAR_TYPE, AsrConfig.GrammarConfig.VALUE_OF_PARAM_GRAMMAR_TYPE_ID);
        	recogConfig.addParam(AsrConfig.GrammarConfig.PARAM_KEY_GRAMMAR_ID, grammarId.toString());
        }
        //使用云能力asr.cloud.freetalk.music或asr.cloud.freetalk.poi时需要传相对应的domain参数
        if (capkey.indexOf("asr.cloud.freetalk.music") != -1)
        {
        	recogConfig.addParam(AsrConfig.ResultConfig.PARAM_KEY_DOMAIN, "music");
        }
        if (capkey.indexOf("asr.cloud.freetalk.poi") != -1)
        {
        	recogConfig.addParam(AsrConfig.ResultConfig.PARAM_KEY_DOMAIN, "poi");
        }
        //使用云能力asr.cloud.dialog时，需要传入intention
        if (capkey.indexOf("asr.cloud.dialog") != -1)
        {
        	recogConfig.addParam(AsrConfig.ResultConfig.PARAM_KEY_INTENTION, "weather");
        }
        	
        //私有云版本需根据需求配置property参数，详细见开发手册
        //recogConfig.addParam(AsrConfig.ResultConfig.PARAM_KEY_PROPERTY, "chinese_8k_common ");
        
        String audioFile = "sinovoice.pcm";

        //非实时识别
        //Recog(capkey,recogConfig,audioFile);
        //非实时识别
        RealtimeRecog(capkey,recogConfig,audioFile);
                
        if(grammarId.isValid()){
        	HciCloudAsr.hciAsrUnloadGrammar(grammarId);
        	ShowMessage("hciAsrUnloadGrammar");
        }
        //反初始化ASR
        HciCloudAsr.hciAsrRelease();
        ShowMessage("hciAsrRelease");

        return;
	}
	
}
