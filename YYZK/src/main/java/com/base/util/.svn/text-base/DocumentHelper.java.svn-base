package com.base.util;

import com.base.poi.ExcelHelper;
import com.base.poi.PPTHelper;
import com.base.poi.WordHelper;

public class DocumentHelper {

	public static String getString(String path){
		String extension = path.substring(path.lastIndexOf(".")+1);
		if(extension.equals("doc") || extension.equals("docx")){
			return WordHelper.readWord(path);
		}else if(extension.equals("ppt") || extension.equals("pptx")){
			return PPTHelper.readPPT(path);
		}else if(extension.equals("xls") || extension.equals("xlsx")){
			return ExcelHelper.readExcel(path);
		}else{
			return "";
		}
	}
}
