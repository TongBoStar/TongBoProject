package com.base.poi;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hslf.extractor.PowerPointExtractor;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xslf.extractor.XSLFPowerPointExtractor;


public class PPTHelper {
	public static String readPPT(String path){
		String extension = path.substring(path.lastIndexOf(".")+1);
		String result="";
		if(extension.equals("ppt")){
			try{
				InputStream is = new FileInputStream(new File(path));  
				PowerPointExtractor ex = new PowerPointExtractor(is);
	            result = ex.getText();  
			}catch(Exception e){
				
			}
		}else if(extension.equals("pptx")){
			try{
				OPCPackage opcPackage = POIXMLDocument.openPackage(path);  
	            POIXMLTextExtractor extractor = new XSLFPowerPointExtractor(opcPackage);  
	            result = extractor.getText();  
//				InputStream is = new FileInputStream(new File(path));  
//				PowerPointExtractor ex = new PowerPointExtractor(is);
//	            result = ex.getText();
				
			}catch(Exception e){
				
			}
		}
		return result;
	}
	
	public static void main(String[] args) {
//		System.out.println(readPPT("D:\\测试文档sss\\文件柜标签.pptx"));
		String path = "D:\\测试文档sss\\文件柜标签.pptx";
		String extension = path.substring(path.lastIndexOf(".")+1);
		System.out.println(extension);
		
	}
}
