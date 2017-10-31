package com.terrence.cn.test;

import java.io.File;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class ParseLog {
	public static void main(String[] args) {
		try {
			File file = new File("E:\\stapp1493641225364.xml");
			String name = "E:\\stapp1493641225364.xml".split("\\.")[0];
			System.out.println(name.substring(8,name.length()));
			SAXReader reader = new SAXReader();
			if(file.exists()){
				Document document = reader.read(file);
			    Element root = document.getRootElement();//通过document对象获取根节点
			    String serialNumber = root.attributeValue("stcode");
			    System.out.println(serialNumber);
			    Element indexElement = root.element("IndexActivity");
			    if(null!=indexElement){
			    	for(int i=0;i<indexElement.elements().size();i++){
				    	System.out.print(((Element)indexElement.elements().get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)indexElement.elements().get(i)).getText());
				    }
			    }
			    
			    Element voiceElement = root.element("voice");
			    if(null!=voiceElement){
			    	List askElements = voiceElement.elements("ask");
				    List answerElements = voiceElement.elements("answer");
				    for(int i=0;i<askElements.size();i++){
				    	System.out.print(((Element)askElements.get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)askElements.get(i)).getText());
				    }
				    for(int i=0;i<answerElements.size();i++){
				    	System.out.print(((Element)answerElements.get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)answerElements.get(i)).getText());
				    }
			    }
			    
			    Element yiqiwanElement = root.element("YiQiWanActivity");
			    if(null!=yiqiwanElement){
				    List playgameElements = yiqiwanElement.elements("playgame");
				    List stayTimeElements = yiqiwanElement.elements("stayTime");
				    for(int i=0;i<playgameElements.size();i++){
				    	System.out.print(((Element)playgameElements.get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)playgameElements.get(i)).getText());
				    }
				    for(int i=0;i<stayTimeElements.size();i++){
				    	System.out.print(((Element)stayTimeElements.get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)stayTimeElements.get(i)).getText());
				    }
			    }
			    Element yiyunqimengElement = root.element("YiYunQiMengActivity");
			    if(null!=yiyunqimengElement){
				    List studyElements = yiyunqimengElement.elements("study");
				    List stayTimeElements = yiyunqimengElement.elements("stayTime");
				    for(int i=0;i<studyElements.size();i++){
				    	System.out.print(((Element)studyElements.get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)studyElements.get(i)).getText());
				    }
				    for(int i=0;i<stayTimeElements.size();i++){
				    	System.out.print(((Element)stayTimeElements.get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)stayTimeElements.get(i)).getText());
				    }
			    }
			    Element yiqitingElement = root.element("YiQiTingActivity");
			    if(null!=yiyunqimengElement){
				    List musicElements = yiqitingElement.elements("music");
				    List stayTimeElements = yiqitingElement.elements("stayTime");
				    for(int i=0;i<musicElements.size();i++){
				    	System.out.print(((Element)musicElements.get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)musicElements.get(i)).getText());
				    }
				    for(int i=0;i<stayTimeElements.size();i++){
				    	System.out.print(((Element)stayTimeElements.get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)stayTimeElements.get(i)).getText());
				    }
			    }
			    Element playerElement = root.element("PlayerActivity");
			    if(null!=playerElement){
				    List playvideoElements = playerElement.elements("playvideo");
				    List stayTimeElements = playerElement.elements("stayTime");
				    for(int i=0;i<playvideoElements.size();i++){
				    	System.out.print(((Element)playvideoElements.get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)playvideoElements.get(i)).getText());
				    }
				    for(int i=0;i<stayTimeElements.size();i++){
				    	System.out.print(((Element)stayTimeElements.get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)stayTimeElements.get(i)).getText());
				    }
			    }
			    Element courseDetailElement = root.element("CourseDetailActivity");
			    if(null!=courseDetailElement){
			    	for(int i=0;i<courseDetailElement.elements().size();i++){
				    	System.out.print(((Element)courseDetailElement.elements().get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)courseDetailElement.elements().get(i)).getText());
				    }
			    }
			    Element gamerightorwrongDetailElement = root.element("GameRightOrWrongActivity");
			    if(null!=gamerightorwrongDetailElement){
			    	for(int i=0;i<gamerightorwrongDetailElement.elements().size();i++){
				    	System.out.print(((Element)gamerightorwrongDetailElement.elements().get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)gamerightorwrongDetailElement.elements().get(i)).getText());
				    }
			    }
			    Element gamedragDetailElement = root.element("GameDragActivity");
			    if(null!=gamedragDetailElement){
			    	for(int i=0;i<gamedragDetailElement.elements().size();i++){
				    	System.out.print(((Element)gamedragDetailElement.elements().get(i)).attributeValue("timestamp")+"==");
				    	System.out.println(((Element)gamedragDetailElement.elements().get(i)).getText());
				    }
			    }
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
