package com.base.util;

import java.util.Date;
import java.util.List;
import java.util.Map;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonBeanProcessor;

public class JsonUtil {
	
	public static JSONObject getGridPageJson(Long total,List<?> rows){
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
		
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("total", total,jsonConfig);
		jsonObject.accumulate("rows", rows,jsonConfig);
		return jsonObject;
	}
	
	public static JSONObject getJqGridPageJson(Integer pageNo,Long totalPages,Long totalCount,List<?> rows){
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("page", pageNo,jsonConfig);
		jsonObject.accumulate("total", totalPages,jsonConfig);
		jsonObject.accumulate("records", totalCount,jsonConfig);
		jsonObject.accumulate("rows", rows,jsonConfig);
		return jsonObject;
	}
	
	public static JSONArray getGridJson(List<?> list){
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
		
		JSONArray array = new JSONArray();
		for(int i=0;i<list.size();i++){
			array.add(list.get(i),jsonConfig);
		}
		return array;
	}

//	public static JSONObject getGridPageJson(Long total,List<?> rows){
//		JsonConfig jsonConfig = new JsonConfig();
//		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
//		
//		JSONObject jsonObject = new JSONObject();
//		jsonObject.accumulate("iTotalRecords", total,jsonConfig);
//		jsonObject.accumulate("iTotalDisplayRecords", total,jsonConfig);
//		jsonObject.accumulate("aaData", rows,jsonConfig);
//		return jsonObject;
//	}
	
	public static JSONObject getListJson(List<?> rows){
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("rows", rows,jsonConfig);
		return jsonObject;
	}
	
	public static JSONObject getResultJson(Map<String,Object> map){
		JSONObject jsonObject = new JSONObject();
		for(Map.Entry entry:map.entrySet()){
			jsonObject.accumulate(entry.getKey().toString(),entry.getValue());
		}
		return jsonObject;
	}
}
