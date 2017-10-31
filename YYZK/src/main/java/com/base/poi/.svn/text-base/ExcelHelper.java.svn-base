package com.base.poi;

import java.io.FileInputStream;
import java.io.InputStream;
import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hssf.extractor.ExcelExtractor;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.extractor.XSSFExcelExtractor;


public class ExcelHelper {
	public static String readExcel(String path){
		String extension = path.substring(path.lastIndexOf(".")+1);
		String result="";
		if(extension.equals("xls")){
			try{
	            InputStream is=new FileInputStream(path);   
	            HSSFWorkbook wb=new HSSFWorkbook(is);   
	            ExcelExtractor ex=new ExcelExtractor(wb);   
	            ex.setFormulasNotResults(true);   
	            ex.setIncludeSheetNames(false);   
	            result =ex.getText();   
			}catch(Exception e){
				
			}
			
		}else if(extension.equals("xlsx")){
			try{
				OPCPackage opcPackage = POIXMLDocument.openPackage(path);  
				POIXMLTextExtractor ex = new XSSFExcelExtractor(opcPackage);
                result = ex.getText();
			}catch(Exception e){
				
			}
		}
		return result;
	}
	
	public static void main(String[] args) {
//		System.out.println(readExcel("D:\\测试文档sss\\CG001办公用品采购申请单 - 副本.xls"));
		System.out.println(readExcel("D:\\测试文档sss\\CK004转库存申请单.xlsx"));
	}
}
