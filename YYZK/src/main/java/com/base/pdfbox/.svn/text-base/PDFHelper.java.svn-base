package com.base.pdfbox;

import java.io.FileInputStream;

import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.util.PDFTextStripper;

public class PDFHelper {
	public static String readPDF(String path){
		String result="";
		FileInputStream fis;
		try {
			fis = new FileInputStream(path);
			PDFParser p = new PDFParser(fis);
			p.parse();
			PDFTextStripper ts = new PDFTextStripper();
			result = ts.getText(p.getPDDocument());
			fis.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public static void main(String[] args) {
//		System.out.println(readPDF("D:\\测试文档sss\\ZG001ERP权限申请单.pdf"));
		System.out.println(readPDF("D:\\测试文档sss\\中国重汽济南动力部信息化建设简介.pdf"));
	}
}
