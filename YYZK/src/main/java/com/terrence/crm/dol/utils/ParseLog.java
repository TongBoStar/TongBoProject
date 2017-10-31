package com.terrence.crm.dol.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.terrence.crm.dol.bean.Stuselog;

public class ParseLog {
	public static Map<String,List<Stuselog>> exeParse(Map<String, String> yqkMap,Map<String, String> courseMap,Map<String, String> stcodeMap,
			Map<String,String> yqtMap,Map<String,String> gameinfoMap,String fileName) {
		Map<String,List<Stuselog>> map = new HashMap<String, List<Stuselog>>();
		List<Stuselog> stuselogs = new ArrayList<Stuselog>();
		List<Stuselog> stuselogsall = new ArrayList<Stuselog>();
		try {
			Long parseTime = new Date().getTime();
			File file = new File(fileName);
			String name = fileName.split("\\.")[0];
			String upLoadTime = DateUtils.formtDateTime(new Date(Long.valueOf(name.substring(32,name.length()))), "yyyy-MM-dd HH:mm:ss.SSS");
			SAXReader reader = new SAXReader();
			Long times = 0L;
			if(file.exists()&&file.length()>0){
				Document document = reader.read(file);
			    Element root = document.getRootElement();//通过document对象获取根节点
			    String serialNumber = root.attributeValue("stcode");
			    String stCode = stcodeMap.get(serialNumber);
			    Stuselog sl = null;
			    Element indexElement = root.element("IndexActivity");
			    if(null!=indexElement){
			    	for(int i=0;i<indexElement.elements().size();i++){
			    		sl = new Stuselog();
			    		Element el = ((Element)indexElement.elements().get(i));
			    		times += Long.valueOf(el.getText());
			    		sl.setOperateContent(el.getText());
			    		sl.setOperateTypeMark("stayTime");
			    		sl.setOperateModuleMark("IndexActivity");
			    		sl.setStCode(stCode);
			    		sl.setSerialNumber(serialNumber);
			    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
			    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
			    		sl.setUpLoadTime(upLoadTime);
			    		sl.setParseTimeLong(parseTime);
			    		stuselogs.add(sl);
				    }
			    	Stuselog slall = new Stuselog();
			    	slall.setStCode(stCode);
			    	slall.setSerialNumber(serialNumber);
			    	slall.setOperateModuleMark(sl.getOperateModuleMark());
			    	slall.setOperateTypeMark(sl.getOperateTypeMark());
			    	sl.setUpLoadTime(upLoadTime);
			    	slall.setParseTimeLong(parseTime);
			    	slall.setsTime(times+"");
			    	stuselogsall.add(slall);
			    }
			    
			    Element voiceElement = root.element("voice");
			    if(null!=voiceElement){
			    	List askElements = voiceElement.elements("ask");
				    List answerElements = voiceElement.elements("answer");
				    List sendWXElements = voiceElement.elements("sendWX");
				    List receiveWXElements = voiceElement.elements("receiveWX");
				    List vmusicElements = voiceElement.elements("vmusic");
				    if(null!=askElements&&askElements.size()>0){
				    	times = 0L;
				    	for(int i=0;i<askElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)askElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("ask");
				    		sl.setOperateModuleMark("voice");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += 1;
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setSerialNumber(serialNumber);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setsTime(times+"");
				    	stuselogsall.add(slall);
				    }
				    if(null!=answerElements&&answerElements.size()>0){
				    	times = 0L;
				    	for(int i=0;i<answerElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)answerElements.get(i));
				    		sl.setOperateContent(el.getText().split("===")[0]);
				    		sl.setOperateTypeMark("answer");
				    		sl.setOperateModuleMark("voice");
				    		sl.setOperateType(el.getText().split("===").length>1?el.getText().split("===")[1]:"");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += 1;
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setSerialNumber(serialNumber);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setsTime(times+"");
				    	stuselogsall.add(slall);
				    }
				    if(null!=sendWXElements&&sendWXElements.size()>0){
				    	times = 0L;
				    	for(int i=0;i<sendWXElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)sendWXElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("sendWX");
				    		sl.setOperateModuleMark("voice");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += 1;
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setSerialNumber(serialNumber);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setsTime(times+"");
				    	stuselogsall.add(slall);
				    }
				    if(null!=receiveWXElements&&receiveWXElements.size()>0){
				    	times = 0L;
				    	for(int i=0;i<receiveWXElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)receiveWXElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("receiveWX");
				    		sl.setOperateModuleMark("voice");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += 1;
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setSerialNumber(serialNumber);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setsTime(times+"");
				    	stuselogsall.add(slall);
				    }
				    if(null!=vmusicElements&&vmusicElements.size()>0){
				    	for(int i=0;i<vmusicElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)vmusicElements.get(i));
				    		sl.setOperateContent(el.getText().split(":")[0]);
				    		sl.setOperateTypeMark("vmusic");
				    		sl.setOperateModuleMark("voice");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		sl.setsTime(el.getText().split(":")[1]);
				    		sl.setOperateModule(el.getText().split(":")[0]);
				    		String vmusictype = yqtMap.get(el.getText().split(":")[0]);
				    		sl.setItemType(null==vmusictype?"0":vmusictype);
				    		stuselogs.add(sl);
				    		times += Long.valueOf(el.getText().split(":")[1]);
					    }
				    }
			    }
			    
			    Element yiqiwanElement = root.element("YiQiWanActivity");
			    if(null!=yiqiwanElement){
			    	String games = "";
				    List playgameElements = yiqiwanElement.elements("playgame");
				    List stayTimeElements = yiqiwanElement.elements("stayTime");
				    List toaddgameElements = yiqiwanElement.elements("ToAddGame");
				    List playGameTimeElements = yiqiwanElement.elements("playGameTime");
				    if(null!=playgameElements&&playgameElements.size()>0){
				    	for(int i=0;i<playgameElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)playgameElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateType(el.getText().split(":")[1]);
				    		sl.setOperateModule(el.getText().split(":")[0]);
				    		sl.setItemType(gameinfoMap.get(el.getText().split(":")[1]));
				    		sl.setOperateTypeMark("playgame");
				    		sl.setOperateModuleMark("YiQiWanActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		games += el.getText()+";";
					    }
					    times = 0L;
				    }
				    if(null!=playGameTimeElements&&playGameTimeElements.size()>0){
				    	for(int i=0;i<playGameTimeElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)playGameTimeElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("playGameTime");
				    		sl.setOperateModuleMark("YiQiWanActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += Long.valueOf(el.getText());
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setSerialNumber(serialNumber);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setOperateContent(games);
				    	slall.setsTime(times+"");
				    	stuselogsall.add(slall);
				    }
				    if(null!=stayTimeElements&&stayTimeElements.size()>0){
				    	for(int i=0;i<stayTimeElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)stayTimeElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("stayTime");
				    		sl.setOperateModuleMark("YiQiWanActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += Long.valueOf(el.getText());
					    }
				    	games = "";
				    }
				    if(null!=toaddgameElements&&toaddgameElements.size()>0){
				    	for(int i=0;i<toaddgameElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)toaddgameElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("ToAddGame");
				    		sl.setOperateModuleMark("YiQiWanActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += 1;
					    }
				    }
			    }
			    times = 0L;
			    Element yiyunqimengElement = root.element("YiYunQiMengActivity");
			    if(null!=yiyunqimengElement){
			    	times += 0L;
			    	String studys = "";
				    List studyElements = yiyunqimengElement.elements("study");
				    List stayTimeElements = yiyunqimengElement.elements("stayTime");
				    if(null!=studyElements&&studyElements.size()>0){
				    	for(int i=0;i<studyElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)studyElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("study");
				    		sl.setOperateModuleMark("YiYunQiMengActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		studys += el.getText()+";";
					    }
				    }
				    if(null!=stayTimeElements&&stayTimeElements.size()>0){
				    	for(int i=0;i<stayTimeElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)stayTimeElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("stayTime");
				    		sl.setOperateModuleMark("YiYunQiMengActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += Long.valueOf(el.getText());
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setSerialNumber(serialNumber);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setOperateContent(studys);
				    	slall.setsTime(times+"");
				    	stuselogsall.add(slall);
				    }
			    }
			    times = 0L;
			    Element yiqitingElement = root.element("YiQiTingActivity");
			    if(null!=yiqitingElement){
			    	String musics = "";
				    List musicElements = yiqitingElement.elements("music");
				    List stayTimeElements = yiqitingElement.elements("stayTime");
				    List ymusicElements = yiqitingElement.elements("ymusic");
				    if(null!=musicElements&&musicElements.size()>0){
				    	for(int i=0;i<musicElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)musicElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("music");
				    		sl.setOperateModuleMark("YiQiTingActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		musics += el.getText()+";";
					    }
				    }
				    if(null!=ymusicElements&&ymusicElements.size()>0){
				    	for(int i=0;i<ymusicElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)ymusicElements.get(i));
				    		sl.setOperateContent(el.getText().split(":")[0]);
				    		sl.setOperateTypeMark("ymusic");
				    		sl.setOperateModuleMark("YiQiTingActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		sl.setsTime(el.getText().split(":")[1]);
				    		sl.setOperateModule(el.getText().split(":")[0]);
				    		sl.setItemType(yqtMap.get(el.getText().split(":")[0]));
				    		stuselogs.add(sl);
				    		times += Long.valueOf(el.getText().split(":")[1]);
					    }
				    }
				    if(null!=stayTimeElements&&stayTimeElements.size()>0){
				    	for(int i=0;i<stayTimeElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)stayTimeElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("stayTime");
				    		sl.setOperateModuleMark("YiQiTingActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += Long.valueOf(el.getText());
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setSerialNumber(serialNumber);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setOperateContent(musics);
				    	slall.setsTime(times+"");
				    	stuselogsall.add(slall);
				    }
			    }
			    times = 0L;
			    Element playerElement = root.element("PlayerActivity");
			    if(null!=playerElement){
			    	String videos = "";
				    List playvideoElements = playerElement.elements("playvideo");
				    List stayTimeElements = playerElement.elements("stayTime");
				    if(null!=playvideoElements&&playvideoElements.size()>0){
				    	for(int i=0;i<playvideoElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)playvideoElements.get(i));
				    		if(yqkMap.containsKey(el.getText())){
				    			sl.setOperateContent(yqkMap.get(el.getText()));
				    			String all = yqkMap.get(el.getText()).split(":")[1];
				    			String module = all.split("=")[0];
				    			String belongName = yqkMap.get(el.getText()).split(":")[0];
				    			sl.setOperateModule(module);
				    			sl.setBelongName(belongName);
				    			sl.setItemType(all.split("=")[1]);
				    		}else if(courseMap.containsKey(el.getText())){
				    			sl.setOperateContent(courseMap.get(el.getText()));
				    			String all = courseMap.get(el.getText()).split(":")[1];
				    			String module = all.split("=")[0];
				    			String belongName = courseMap.get(el.getText()).split(":")[0];
				    			sl.setOperateModule(module);
				    			sl.setBelongName(belongName);
				    			sl.setItemType(all.split("=")[1]);
				    		}else{
				    			sl.setOperateContent("");
				    		}
				    		sl.setOperateType(el.getText());
				    		sl.setOperateTypeMark("playvideo");
				    		sl.setOperateModuleMark("PlayerActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		videos += sl.getOperateContent()+";";
					    }
				    }
				    if(null!=stayTimeElements&&stayTimeElements.size()>0){
				    	for(int i=0;i<stayTimeElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)stayTimeElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("stayTime");
				    		sl.setOperateModuleMark("PlayerActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += Long.valueOf(el.getText());
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setSerialNumber(serialNumber);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setOperateContent(videos);
				    	slall.setsTime(times+"");
				    	stuselogsall.add(slall);
				    }
			    }
			    Element courseDetailElement = root.element("CourseDetailActivity");
			    if(null!=courseDetailElement){
			    	times += 0L;
			    	for(int i=0;i<courseDetailElement.elements().size();i++){
			    		sl = new Stuselog();
			    		Element el = ((Element)courseDetailElement.elements().get(i));
			    		sl.setOperateContent(el.getText());
			    		sl.setOperateTypeMark("stayTime");
			    		sl.setOperateModuleMark("CourseDetailActivity");
			    		sl.setStCode(stCode);
			    		sl.setSerialNumber(serialNumber);
			    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
			    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
			    		sl.setUpLoadTime(upLoadTime);
			    		sl.setParseTimeLong(parseTime);
			    		stuselogs.add(sl);
			    		times += Long.valueOf(el.getText());
				    }
			    	Stuselog slall = new Stuselog();
			    	slall.setStCode(stCode);
			    	slall.setSerialNumber(serialNumber);
			    	slall.setOperateModuleMark(sl.getOperateModuleMark());
			    	slall.setOperateTypeMark(sl.getOperateTypeMark());
			    	sl.setUpLoadTime(upLoadTime);
			    	slall.setParseTimeLong(parseTime);
			    	slall.setsTime(times+"");
			    	stuselogsall.add(slall);
			    }
			    Element gamerightorwrongDetailElement = root.element("GameRightOrWrongActivity");
			    if(null!=gamerightorwrongDetailElement){
			    	times = 0L;
			    	for(int i=0;i<gamerightorwrongDetailElement.elements().size();i++){
			    		sl = new Stuselog();
			    		Element el = ((Element)gamerightorwrongDetailElement.elements().get(i));
			    		sl.setOperateContent(el.getText());
			    		sl.setOperateTypeMark("stayTime");
			    		sl.setOperateModuleMark("GameRightOrWrongActivity");
			    		sl.setStCode(stCode);
			    		sl.setSerialNumber(serialNumber);
			    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
			    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
			    		sl.setUpLoadTime(upLoadTime);
			    		sl.setParseTimeLong(parseTime);
			    		stuselogs.add(sl);
			    		times += Long.valueOf(el.getText());
				    }
			    	Stuselog slall = new Stuselog();
			    	slall.setStCode(stCode);
			    	slall.setSerialNumber(serialNumber);
			    	slall.setOperateModuleMark(sl.getOperateModuleMark());
			    	slall.setOperateTypeMark(sl.getOperateTypeMark());
			    	sl.setUpLoadTime(upLoadTime);
			    	slall.setParseTimeLong(parseTime);
			    	slall.setsTime(times+"");
			    	stuselogsall.add(slall);
			    }
			    Element gamedragDetailElement = root.element("GameDragActivity");
			    if(null!=gamedragDetailElement){
			    	times = 0L;
			    	for(int i=0;i<gamedragDetailElement.elements().size();i++){
			    		sl = new Stuselog();
			    		Element el = ((Element)gamedragDetailElement.elements().get(i));
			    		sl.setOperateContent(el.getText());
			    		sl.setOperateTypeMark("stayTime");
			    		sl.setOperateModuleMark("GameDragActivity");
			    		sl.setStCode(stCode);
			    		sl.setSerialNumber(serialNumber);
			    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
			    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
			    		sl.setUpLoadTime(upLoadTime);
			    		sl.setParseTimeLong(parseTime);
			    		stuselogs.add(sl);
			    		times += Long.valueOf(el.getText());
				    }
			    	Stuselog slall = new Stuselog();
			    	slall.setStCode(stCode);
			    	slall.setSerialNumber(serialNumber);
			    	slall.setOperateModuleMark(sl.getOperateModuleMark());
			    	slall.setOperateTypeMark(sl.getOperateTypeMark());
			    	sl.setUpLoadTime(upLoadTime);
			    	slall.setParseTimeLong(parseTime);
			    	slall.setsTime(times+"");
			    	stuselogsall.add(slall);
			    }
			    Element loginElement = root.element("Login");
			    if(null!=loginElement){
			    	for(int i=0;i<loginElement.elements().size();i++){
			    		sl = new Stuselog();
			    		Element el = ((Element)loginElement.elements().get(i));
			    		sl.setOperateContent(el.getText());
			    		sl.setOperateTypeMark("loginTime");
			    		sl.setOperateModuleMark("Login");
			    		sl.setStCode(stCode);
			    		sl.setSerialNumber(serialNumber);
			    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
			    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
			    		sl.setUpLoadTime(upLoadTime);
			    		sl.setParseTimeLong(parseTime);
			    		stuselogs.add(sl);
				    }
			    	Stuselog slall = new Stuselog();
			    	slall.setStCode(stCode);
			    	slall.setSerialNumber(serialNumber);
			    	slall.setOperateModuleMark(sl.getOperateModuleMark());
			    	slall.setOperateTypeMark(sl.getOperateTypeMark());
			    	slall.setUpLoadTime(upLoadTime);
			    	slall.setParseTimeLong(parseTime);
			    	slall.setTakeTimeLong(sl.getTakeTimeLong());
			    	stuselogsall.add(slall);
			    }
			    Element logoutElement = root.element("Logout");
			    if(null!=logoutElement){
			    	for(int i=0;i<logoutElement.elements().size();i++){
			    		sl = new Stuselog();
			    		Element el = ((Element)logoutElement.elements().get(i));
			    		sl.setOperateContent(el.getText());
			    		sl.setOperateTypeMark("logoutTime");
			    		sl.setOperateModuleMark("Logout");
			    		sl.setStCode(stCode);
			    		sl.setSerialNumber(serialNumber);
			    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
			    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
			    		sl.setUpLoadTime(upLoadTime);
			    		sl.setParseTimeLong(parseTime);
			    		stuselogs.add(sl);
				    }
			    	Stuselog slall = new Stuselog();
			    	slall.setStCode(stCode);
			    	slall.setSerialNumber(serialNumber);
			    	slall.setOperateModuleMark(sl.getOperateModuleMark());
			    	slall.setOperateTypeMark(sl.getOperateTypeMark());
			    	slall.setParseTimeLong(parseTime);
			    	slall.setTakeTimeLong(sl.getTakeTimeLong());
			    	stuselogsall.add(slall);
			    }
			    Element apkInfoElement = root.element("ApkInfo");
			    if(null!=apkInfoElement){
			    	String names = "";
			    	List addElements = apkInfoElement.elements("Add");
				    List unstallElements = apkInfoElement.elements("Unstall");
				    List replaceElements = apkInfoElement.elements("Replace");
				    List changeElements = apkInfoElement.elements("Change");
				    List restartElements = apkInfoElement.elements("Restart");
				    if(null!=addElements&&addElements.size()>0){
				    	for(int i=0;i<addElements.size();i++){
				    		sl = new Stuselog();
				    		Element el = ((Element)addElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("Add");
				    		sl.setOperateModuleMark("ApkInfo");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		names += el.getText()+";";
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setSerialNumber(serialNumber);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setOperateContent(names);
				    	stuselogsall.add(slall);
					    names = "";
				    }
				    if(null!=unstallElements&&unstallElements.size()>0){
				    	for(int i=0;i<unstallElements.size();i++){
				    		sl = new Stuselog();
				    		Element el = ((Element)unstallElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("Unstall");
				    		sl.setOperateModuleMark("ApkInfo");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		names += el.getText()+";";
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setSerialNumber(serialNumber);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setOperateContent(names);
				    	stuselogsall.add(slall);
					    names = "";
				    }
				    if(null!=replaceElements&&replaceElements.size()>0){
				    	for(int i=0;i<replaceElements.size();i++){
				    		sl = new Stuselog();
				    		Element el = ((Element)replaceElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("Replace");
				    		sl.setOperateModuleMark("ApkInfo");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		names += el.getText()+";";
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setSerialNumber(serialNumber);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setOperateContent(names);
				    	stuselogsall.add(slall);
					    names = "";
				    }
				    if(null!=changeElements&&changeElements.size()>0){
				    	for(int i=0;i<changeElements.size();i++){
				    		sl = new Stuselog();
				    		Element el = ((Element)changeElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("Change");
				    		sl.setOperateModuleMark("ApkInfo");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		names += el.getText()+";";
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	slall.setSerialNumber(serialNumber);
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setOperateContent(names);
				    	stuselogsall.add(slall);
					    names = "";
				    }
				    if(null!=restartElements&&restartElements.size()>0){
				    	for(int i=0;i<restartElements.size();i++){
				    		sl = new Stuselog();
				    		Element el = ((Element)restartElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("Restart");
				    		sl.setOperateModuleMark("ApkInfo");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		names += el.getText()+";";
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	slall.setSerialNumber(serialNumber);
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setOperateContent(names);
				    	stuselogsall.add(slall);
					    names = "";
				    }
			    }
			    Element jkmsElement = root.element("JiankangmoshiActivity");
			    if(null!=jkmsElement){
			    	times = 0L;
			    	List stayTimeElements = jkmsElement.elements("stayTime");
				    List qcElements = jkmsElement.elements("QCTime");
				    List xiuxiElements = jkmsElement.elements("XiuXiTime");
				    List limitElements = jkmsElement.elements("LimitTime");
				    if(null!=stayTimeElements&&stayTimeElements.size()>0){
				    	for(int i=0;i<stayTimeElements.size();i++){
				    		sl = new Stuselog();
				    		Element el = ((Element)stayTimeElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("stayTime");
				    		sl.setOperateModuleMark("JiankangmoshiActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += Long.valueOf(el.getText());
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	slall.setSerialNumber(serialNumber);
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setsTime(times+"");
				    	stuselogsall.add(slall);
				    }
				    if(null!=qcElements&&qcElements.size()>0){
				    	for(int i=0;i<qcElements.size();i++){
				    		sl = new Stuselog();
				    		Element el = ((Element)qcElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("QCTime");
				    		sl.setOperateModuleMark("JiankangmoshiActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	slall.setSerialNumber(serialNumber);
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setOperateContent("设置起床时间:"+sl.getOperateContent());
				    	stuselogsall.add(slall);
				    }
				    if(null!=xiuxiElements&&xiuxiElements.size()>0){
				    	for(int i=0;i<xiuxiElements.size();i++){
				    		sl = new Stuselog();
				    		Element el = ((Element)xiuxiElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("XiuXiTime");
				    		sl.setOperateModuleMark("JiankangmoshiActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	slall.setSerialNumber(serialNumber);
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setOperateContent("设置休息时间:"+sl.getOperateContent());
				    	stuselogsall.add(slall);
				    }
				    if(null!=limitElements&&limitElements.size()>0){
				    	for(int i=0;i<limitElements.size();i++){
				    		sl = new Stuselog();
				    		Element el = ((Element)limitElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("LimitTime");
				    		sl.setOperateModuleMark("JiankangmoshiActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
					    }
				    	Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	slall.setSerialNumber(serialNumber);
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setOperateContent("设置使用时间:"+sl.getOperateContent());
				    	stuselogsall.add(slall);
				    }
			    }
			    Element appListElement = root.element("AppListActivity");
			    if(null!=appListElement){
			    	times = 0L;
			    	String del = "";
			    	String add = "";
			    	List stayTimeElements = appListElement.elements("stayTime");
				    List delappElements = appListElement.elements("DelAppInfo");
				    List addappElements = appListElement.elements("AddAppInfo");
				    if(null!=stayTimeElements&&stayTimeElements.size()>0){
				    	for(int i=0;i<stayTimeElements.size();i++){
				    		sl = new Stuselog();
				    		Element el = ((Element)stayTimeElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("stayTime");
				    		sl.setOperateModuleMark("AppListActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += Long.valueOf(el.getText());
					    }
				    }
			    	if(null!=delappElements&&delappElements.size()>0){
			    		for(int i=0;i<delappElements.size();i++){
				    		sl = new Stuselog();
				    		Element el = ((Element)delappElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("DelAppInfo");
				    		sl.setOperateModuleMark("AppListActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		del += el.getText()+"";
					    }
			    	}
			    	if(null!=addappElements&&addappElements.size()>0){
			    		for(int i=0;i<addappElements.size();i++){
				    		sl = new Stuselog();
				    		Element el = ((Element)addappElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("AddAppInfo");
				    		sl.setOperateModuleMark("AppListActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		add += el.getText()+"";
					    }
			    		Stuselog slall = new Stuselog();
				    	slall.setStCode(stCode);
				    	slall.setOperateModuleMark(sl.getOperateModuleMark());
				    	slall.setOperateTypeMark(sl.getOperateTypeMark());
				    	slall.setSerialNumber(serialNumber);
				    	sl.setUpLoadTime(upLoadTime);
				    	slall.setParseTimeLong(parseTime);
				    	slall.setsTime(times+"");
				    	slall.setOperateContent("添加游戏:"+add+",删除游戏:"+del);
				    	stuselogsall.add(slall);
			    	}
			    }
			    times = 0L;
			    Element yqkDetailElement = root.element("YqkDetailActivity");
			    if(null!=yqkDetailElement){
				    List stayTimeElements = yqkDetailElement.elements("stayTime");
				    if(null!=stayTimeElements&&stayTimeElements.size()>0){
				    	for(int i=0;i<stayTimeElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)stayTimeElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("study");
				    		sl.setOperateModuleMark("YiYunQiMengActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += Long.valueOf(el.getText());
					    }
				    }
			    }
			    times = 0L;
			    Element yqkItemElement = root.element("YqkItemActivity");
			    if(null!=yqkItemElement){
				    List stayTimeElements = yqkItemElement.elements("stayTime");
				    if(null!=stayTimeElements&&stayTimeElements.size()>0){
				    	for(int i=0;i<stayTimeElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)stayTimeElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("stayTime");
				    		sl.setOperateModuleMark("YqkItemActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		stuselogs.add(sl);
				    		times += Long.valueOf(el.getText());
					    }
				    }
				    times = 0L;
			    }
			    times = 0L;
			    Element unityPlayerElement = root.element("UnityPlayerActivity");
			    if(null!=unityPlayerElement){
				    List stayTimeElements = unityPlayerElement.elements("stayTime");
				    if(null!=stayTimeElements&&stayTimeElements.size()>0){
				    	for(int i=0;i<stayTimeElements.size();i++){
					    	sl = new Stuselog();
				    		Element el = ((Element)stayTimeElements.get(i));
				    		sl.setOperateContent(el.getText());
				    		sl.setOperateTypeMark("stayTime");
				    		sl.setOperateModuleMark("UnityPlayerActivity");
				    		sl.setStCode(stCode);
				    		sl.setSerialNumber(serialNumber);
				    		sl.setTakeTimeLong(Long.valueOf(el.attributeValue("timestamp")));
				    		sl.setTakeTime(DateUtils.formtDateTime(new Date(Long.valueOf(el.attributeValue("timestamp"))), "yyyy-MM-dd HH:mm:ss.SSS"));
				    		sl.setUpLoadTime(upLoadTime);
				    		sl.setParseTimeLong(parseTime);
				    		sl.setsTime(el.getText());
				    		stuselogs.add(sl);
					    }
				    }
				    times = 0L;
			    }
			}
			map.put("stuselogs", stuselogs);
			map.put("stuselogsall", stuselogsall);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}