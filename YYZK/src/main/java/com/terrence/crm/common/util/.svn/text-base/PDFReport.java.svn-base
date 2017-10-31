package com.terrence.crm.common.util;



import java.awt.Color;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;

import com.lowagie.text.BadElementException;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfCell;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPRow;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

public class PDFReport{
	Document document = new Document(PageSize.A4,10.0f,10.0f,10.0f,10.0f);// 建立一个Document对象	
	
	private static Font headfont ;// 设置字体大小
	private static Font keyfont;// 设置字体大小
	private static Font textfont;// 设置字体大小
	

	
	static{
		BaseFont bfChinese;
		try {
			//bfChinese = BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);
			bfChinese = BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);
			headfont = new Font(bfChinese, 18, Font.BOLD);// 设置字体大小
			keyfont = new Font(bfChinese, 8, Font.BOLD);// 设置字体大小
			textfont = new Font(bfChinese, 8, Font.NORMAL);// 设置字体大小
		} catch (Exception e) {			
			e.printStackTrace();
		} 
	}
	
	
	public PDFReport(File file) {		 
		 //document.setPageSize(PageSize.A4);// 设置页面大小
		 try {
			PdfWriter.getInstance(document,new FileOutputStream(file));
			document.open(); 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		
	}
	int maxWidth = 520;
	
	
	 public PdfPCell createCell(String value,com.lowagie.text.Font font,int align){
		 PdfPCell cell = new PdfPCell();
		 cell.setVerticalAlignment(Element.ALIGN_MIDDLE);		 
		 cell.setHorizontalAlignment(align);	
		 cell.setPhrase(new Phrase(value,font));
		 
		return cell;
	}
	 public PdfPCell createCellImage( ) throws BadElementException, MalformedURLException, IOException{
		 PdfPCell cell = new PdfPCell();
		 Image image=Image.getInstance("D:\\terrencelogo.jpg");
		 cell.setPaddingTop(0f);
		 cell.setImage(image);
		 cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		 cell.setHorizontalAlignment(Element.ALIGN_RIGHT);	
		 cell.setBorder(0);
		 //cell.setFixedHeight(16.0f);
		return cell;
	}
	
	 public PdfPCell createCell(String value,com.lowagie.text.Font font){
		 PdfPCell cell = new PdfPCell();
		 cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		 cell.setHorizontalAlignment(Element.ALIGN_CENTER);	
		 cell.setPhrase(new Phrase(value,font));
		return cell;
	}

	 public PdfPCell createCell(String value,com.lowagie.text.Font font,int align,int colspan){
		 PdfPCell cell = new PdfPCell();
		 cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		 cell.setHorizontalAlignment(align);	
		 cell.setColspan(colspan);
		 cell.setPhrase(new Phrase(value,font));
		return cell;
	}
	 public PdfPCell createCell(String value,com.lowagie.text.Font font,int align,int colspan,int border){
		 PdfPCell cell = new PdfPCell();
		 cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		 cell.setHorizontalAlignment(align);	
		 cell.setColspan(colspan);
		 cell.setPhrase(new Phrase(value,font));
		 cell.setBorder(border);
		return cell;
	}
	 
	 
	public PdfPCell createCell(String value,com.lowagie.text.Font font,int align,int colspan,boolean boderFlag){
		 PdfPCell cell = new PdfPCell();
		 cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		 cell.setHorizontalAlignment(align);	
		 cell.setColspan(colspan);
		 cell.setPhrase(new Phrase(value,font));
		 //cell.setPadding(3.0f);
		 cell.setPadding(3.0f);
		 if(!boderFlag){
			 cell.setBorder(0);
			 /*cell.setPaddingTop(15.0f);
			 cell.setPaddingBottom(8.0f);*/
			 cell.setPaddingTop(0f);
			 cell.setPaddingBottom(3.0f);
		 }
		return cell;
	}
	 public PdfPTable createTable(int colNumber){
		PdfPTable table = new PdfPTable(colNumber);
		try{
			table.setTotalWidth(maxWidth);
			table.setLockedWidth(true);
			table.setHorizontalAlignment(Element.ALIGN_CENTER);		
			table.getDefaultCell().setBorder(1);
		}catch(Exception e){
			e.printStackTrace();
		}
        return table;
	}
	 public PdfPTable createTable(float[] widths){
			PdfPTable table = new PdfPTable(widths);
			try{
				table.setTotalWidth(maxWidth);
				table.setLockedWidth(true);
				table.setHorizontalAlignment(Element.ALIGN_CENTER);		
				table.getDefaultCell().setBorder(1);
			}catch(Exception e){
				e.printStackTrace();
			}
	        return table;
		}
	
	 public PdfPTable createBlankTable(){
		 PdfPTable table = new PdfPTable(1);
		 table.getDefaultCell().setBorder(0);
		 table.addCell(createCell("", keyfont));		 
		 table.setSpacingAfter(20.0f);
		 table.setSpacingBefore(20.0f);
		 return table;
	 }
	 
	 public void generatePDF() throws Exception{
		/*PdfPTable table = createTable(4);
		table.addCell(createCell("学生信息列表：", keyfont,Element.ALIGN_LEFT,4,false));
			
		table.addCell(createCell("姓名", keyfont, Element.ALIGN_CENTER));
		table.addCell(createCell("年龄", keyfont, Element.ALIGN_CENTER));
		table.addCell(createCell("性别", keyfont, Element.ALIGN_CENTER));
		table.addCell(createCell("住址", keyfont, Element.ALIGN_CENTER));
		
		for(int i=0;i<5;i++){
			table.addCell(createCell("姓名"+i, textfont));
			table.addCell(createCell(i+15+"", textfont));
			table.addCell(createCell((i%2==0)?"男":"女", textfont));
			table.addCell(createCell("地址"+i, textfont));
		}*/
		 //document.setMargins(0.0f,0.0f, 0.0f, 0.0f);
		PdfPTable table0 = createTable(4);
		//Image image=Image.getInstance("D:\\1.png");
		table0.addCell(createCell(" ", keyfont,Element.ALIGN_CENTER,1,false));
		table0.addCell(createCell(" ", keyfont,Element.ALIGN_CENTER,1,false));
		table0.addCell(createCell(" ", keyfont,Element.ALIGN_CENTER,1,false));
		table0.addCell(createCellImage( ));
		
		table0.addCell(createCell("特瑞斯能源装备股份有限公司", keyfont,Element.ALIGN_RIGHT,4,0 ));
		
		table0.addCell(createCell("Terrence Energy Co., Ltd.", keyfont,Element.ALIGN_RIGHT,4,0 ));
		
		table0.addCell(createCell("销售部标准订单", headfont,Element.ALIGN_CENTER,4,false));
		document.add(table0);
		PdfPTable table = createTable(4);
		table.addCell(createCell("表单编号：YX002", keyfont,Element.ALIGN_RIGHT,4,false));
		
		table.addCell(createCell("订单编号", keyfont, Element.ALIGN_CENTER));
		table.addCell(createCell("2015-0012-tly", keyfont, Element.ALIGN_CENTER));
		table.addCell(createCell("时间", keyfont, Element.ALIGN_CENTER));
		table.addCell(createCell("2015-04-30", keyfont, Element.ALIGN_CENTER));
		
		
		table.addCell(createCell("订货单位", keyfont, Element.ALIGN_CENTER));
		table.addCell(createCell("161", keyfont, Element.ALIGN_CENTER));
		
		table.addCell(createCell("销售模式", keyfont, Element.ALIGN_CENTER));
		
		
		//加入嵌套表格
	    PdfPTable celltable = new PdfPTable(3);
	    celltable.addCell( createCell("直销", keyfont, Element.ALIGN_CENTER) );
	    celltable.addCell( createCell("非直销系数", keyfont, Element.ALIGN_CENTER) );
	    celltable.addCell( createCell("0", keyfont, Element.ALIGN_CENTER) );
	    PdfPCell cell = new PdfPCell(celltable);
	    table.addCell(cell);
	    
		table.addCell(createCell("气源", keyfont, Element.ALIGN_CENTER));
		table.addCell(createCell("161", keyfont, Element.ALIGN_CENTER));
		table.addCell(createCell("体系客户", keyfont, Element.ALIGN_CENTER));
		table.addCell(createCell("港华", keyfont, Element.ALIGN_CENTER));
		
		/*PdfPTable table2 = createTable(4);
		table.addCell(createCell("订单编号", keyfont, Element.ALIGN_CENTER));
		table.addCell(createCell("2015-0012-tly", keyfont, Element.ALIGN_CENTER));
		table.addCell(createCell("时间", keyfont, Element.ALIGN_CENTER));
		table.addCell(createCell("2015-04-30", keyfont, Element.ALIGN_CENTER));*/
		
		document.add(table);
		
		PdfPTable table2 = createTable(10);
		
		table2.addCell(createCell("序号", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("产品规格型号", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("分类", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("数量", keyfont, Element.ALIGN_CENTER));
		
		table2.addCell(createCell("销售单价", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("服务费", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("列表价", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("结算价", keyfont, Element.ALIGN_CENTER));
		
		table2.addCell(createCell("折扣", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("销售金额", keyfont, Element.ALIGN_CENTER));
		
		table2.addCell(createCell("1", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("17", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("D", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("17", keyfont, Element.ALIGN_CENTER));
		
		table2.addCell(createCell(" ", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("17", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("6", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("0", keyfont, Element.ALIGN_CENTER));
		
		table2.addCell(createCell("0", keyfont, Element.ALIGN_CENTER));
		table2.addCell(createCell("289", keyfont, Element.ALIGN_CENTER));
		
		document.add(table2);
		
		PdfPTable table3 = createTable(4);
		table3.addCell(createCell("共计人民币（大写）：", keyfont, Element.ALIGN_CENTER));
		table3.addCell(createCell("贰佰捌拾玖元整", keyfont,Element.ALIGN_LEFT,3,true));
		
		table3.addCell(createCell("其中包含国产PL产品", keyfont,Element.ALIGN_LEFT,4,true));
		document.add(table3);
		
		PdfPTable table5 = createTable(12);
		
		table5.addCell(createCell("PL3000", keyfont, Element.ALIGN_CENTER,3,true));
		table5.addCell(createCell("PL4200", keyfont, Element.ALIGN_CENTER,3,true));
		table5.addCell(createCell("SSV3500", keyfont, Element.ALIGN_CENTER,3,true));
		table5.addCell(createCell("(S)PL2000", keyfont, Element.ALIGN_CENTER,3,true));
		
		table5.addCell(createCell("数量", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell("单价", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell("列表价", keyfont, Element.ALIGN_CENTER));
		
		table5.addCell(createCell("数量", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell("单价", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell("列表价", keyfont, Element.ALIGN_CENTER));
		
		table5.addCell(createCell("数量", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell("单价", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell("列表价", keyfont, Element.ALIGN_CENTER));
		
		table5.addCell(createCell("数量", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell("单价", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell("列表价", keyfont, Element.ALIGN_CENTER));
		
		table5.addCell(createCell("2", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell("12.1", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell(" ", keyfont, Element.ALIGN_CENTER));
		
		table5.addCell(createCell("2", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell("12.1", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell(" ", keyfont, Element.ALIGN_CENTER));
		
		table5.addCell(createCell("2", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell("12.2", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell(" ", keyfont, Element.ALIGN_CENTER));
		
		table5.addCell(createCell("2", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell("12.3", keyfont, Element.ALIGN_CENTER));
		table5.addCell(createCell(" ", keyfont, Element.ALIGN_CENTER));
		
		document.add(table5);
		
		PdfPTable table6 = createTable(4);
		table6.addCell(createCell("国产PL产品合计金额：", keyfont, Element.ALIGN_CENTER));
		table6.addCell(createCell("16", keyfont,Element.ALIGN_LEFT,3,true));
		
		table6.addCell(createCell("*付款方式：", keyfont, Element.ALIGN_CENTER));
		table6.addCell(createCell("161", keyfont,Element.ALIGN_LEFT,3,true));
		
		table6.addCell(createCell("交货地点：", keyfont, Element.ALIGN_CENTER));
		table6.addCell(createCell("161", keyfont,Element.ALIGN_LEFT,3,true));
		
		table6.addCell(createCell("*运费承担：", keyfont, Element.ALIGN_CENTER));
		table6.addCell(createCell("需方承担", keyfont,Element.ALIGN_LEFT,3,true));
		
		table6.addCell(createCell("*运输方式：", keyfont, Element.ALIGN_CENTER));
		table6.addCell(createCell("铁路", keyfont,Element.ALIGN_LEFT,3,true));
		
		table6.addCell(createCell("产品包装：", keyfont, Element.ALIGN_CENTER));
		table6.addCell(createCell("纸箱", keyfont,Element.ALIGN_LEFT,3,true));
		
		table6.addCell(createCell("审核人:", keyfont, Element.ALIGN_CENTER));
		table6.addCell(createCell("管理员", keyfont,Element.ALIGN_LEFT,3,true));
		
		table6.addCell(createCell("其它约定事项：", keyfont, Element.ALIGN_CENTER));
		table6.addCell(createCell("161", keyfont,Element.ALIGN_LEFT,3,true));
		
		/*table6.addCell(createCell("单据状态:", keyfont, Element.ALIGN_CENTER,1,true));
		//加入嵌套表格
	    PdfPTable celltable6 = new PdfPTable(3);
	    celltable6.addCell( createCell("待审核", keyfont, Element.ALIGN_CENTER) );
	    celltable6.addCell( createCell("负责人签字:", keyfont, Element.ALIGN_CENTER) );
	    celltable6.addCell( createCell("刘鹏 ", keyfont, Element.ALIGN_CENTER) );
	    PdfPCell cell6 = new PdfPCell(celltable6);
	    table6.addCell(cell6);*/
		document.add(table6);
		PdfPTable table7 = createTable(4);
		
		table7.addCell(createCell("单据状态:", keyfont, Element.ALIGN_CENTER));
		table7.addCell(createCell("待审核", keyfont, Element.ALIGN_CENTER));
		table7.addCell(createCell("负责人签字:", keyfont, Element.ALIGN_CENTER));
		table7.addCell(createCell("刘鹏", keyfont, Element.ALIGN_CENTER));
		document.add(table7);
		
		document.close();
	 }
	 
	 public static void main(String[] args) throws Exception {
		 File file = new File("D:\\text016.pdf");
		 file.createNewFile();
		new PDFReport(file).generatePDF();	
		System.out.println("33");
	}
	
	
}
