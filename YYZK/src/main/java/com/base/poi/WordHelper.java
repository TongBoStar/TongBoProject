package com.base.poi;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;


public class WordHelper {

	public static String readWord(String path){
		String extension = path.substring(path.lastIndexOf(".")+1);
		String result="";
		if(extension.equals("doc")){
			try{
				InputStream is = new FileInputStream(new File(path));  
	            WordExtractor ex = new WordExtractor(is);  
	            result = ex.getText();  
			}catch(Exception e){
				
			}
		}else if(extension.equals("docx")){
			try{
				OPCPackage opcPackage = POIXMLDocument.openPackage(path);  
	            POIXMLTextExtractor extractor = new XWPFWordExtractor(opcPackage);  
	            result = extractor.getText();  
			}catch(Exception e){
				
			}
		}
		return result;
	}
	
	public static void main(String[] args) {
		System.out.println(readWord("D:\\测试文档sss\\产品研发流程图.docx"));
	}
}
