package com.terrence.crm.common.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.terrence.crm.common.bo.Dictionary;




public class DictionaryUtil {
	
	/**
	 * 字典表的数据集合
	 */
	public static Map<Integer,Dictionary> dictionaryMap = new HashMap<Integer,Dictionary>();
	
	/**
	 * 字典表的数据树状集合
	 */
	public static Map<Integer,List<Integer>> dictionaryTree = new HashMap<Integer,List<Integer>>();
	
	public static final String DICTIONARY_TREE = "dictionary_tree";
	
	public static final String DICTIONARY_BEAN = "dictionary_bean";
	
	/**
	 * 通过key获得中文名称
	 * @param key
	 * @return
	 */
	public static String getValue(Integer key){
		String str = "";
		
		if(dictionaryMap != null){
			Dictionary dic = dictionaryMap.get(key);
			if(dic !=null){
				str = dic.getValue();
			}
		}
		return str;
	}
	
	/**
	 * 通过key获得中文名称
	 * @param key
	 * @return
	 */
	public static List<Integer> getSubValue(Integer key){
		List<Integer> list = null;
		
		if(dictionaryTree != null){
			list = dictionaryTree.get(key);
		}
		return list;
	}
	
	/**
	 * 判断字典表数据是否在内存中存在
	 * @return
	 */
	public static boolean isDistionary(){
		boolean flag = true;
		if(dictionaryMap != null && dictionaryTree !=null){
			flag = true;
		}else{
			flag = false;
		}
		return flag;
	}

}
