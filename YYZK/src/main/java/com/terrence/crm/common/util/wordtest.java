package com.terrence.crm.common.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.rtf.RtfWriter2;
import com.steema.teechart.drawing.Color;

public class wordtest {
	public static void main(String[] args) throws Exception {
		// 创建word文档
		Document document = new Document(PageSize.A4); // 输入word文档
		document.setMargins(30.0f, 30.0f, 10.0f, 10.0f);
		// 
		String uploadFileFileName="D:\\text013.doc";
		//
		RtfWriter2.getInstance(document, new FileOutputStream(uploadFileFileName));
		// 
		document.open(); // 中文字体
		BaseFont bfChinese =
		// 
		BaseFont.createFont("STSongStd-Light", "UniGB-UCS2-H",
		// 
				BaseFont.NOT_EMBEDDED);
		Font fontChinese = new Font(bfChinese, 12,
		// 
				Font.BOLD);
		Table table = new Table(4, 4);
		// 在表格末尾添加图片
		Image png = Image.getInstance("D:\\1.png");
		document.add(png);// 分页
		
		Paragraph paragraph = new Paragraph("销售部标准订单", fontChinese);
		paragraph.setAlignment(Paragraph.ALIGN_CENTER);
		document.add(paragraph);
		
		Paragraph paragraph2 = new Paragraph("表单编号：YX002");
		paragraph2.setAlignment(Paragraph.ALIGN_RIGHT);
		document.add(paragraph2);
		
		table.setBorderWidth(2);
		table.setBorderColor(new Color(0, 0, 0));
		table.setPadding(5);
		table.setSpacing(0);
		table.setAutoFillEmptyCells(true);
		
		com.lowagie.text.Cell cell = new com.lowagie.text.Cell(new Paragraph(
				"姓名", fontChinese));
		table.addCell(cell);
		cell = new com.lowagie.text.Cell("1");
		table.addCell(cell);
		//
		cell = new com.lowagie.text.Cell(new Paragraph("性别", fontChinese));
		table.addCell(cell);
		cell = new com.lowagie.text.Cell("2");
		table.addCell(cell);
		cell = new com.lowagie.text.Cell(new Paragraph("年龄", fontChinese));
		//
		table.addCell(cell);
		cell = new com.lowagie.text.Cell("3");
		table.addCell(cell);
		cell = new com.lowagie.text.Cell(new Paragraph("政治面貌", fontChinese));
		table.addCell(cell);
		cell = new com.lowagie.text.Cell("4");
		table.addCell(cell);
		cell = new com.lowagie.text.Cell(new Paragraph("职务", fontChinese));
		table.addCell(cell);
		cell = new com.lowagie.text.Cell("5");
		table.addCell(cell);
		cell = new com.lowagie.text.Cell(new Paragraph("工资", fontChinese));
		table.addCell(cell);
		/*cell = new com.lowagie.text.Cell("");
		//
		cell.setColspan(5);
		table.addCell(cell);*/
		//
		cell = new com.lowagie.text.Cell(new Paragraph("住址", fontChinese));
		table.addCell(cell);
		cell = new com.lowagie.text.Cell("6");
		cell.setColspan(3);
		table.addCell(cell);

		cell = new com.lowagie.text.Cell(new Paragraph("\n\n\n教育背景:\n\n\n",
				fontChinese));
		cell.setVerticalAlignment(com.lowagie.text.Cell.ALIGN_CENTER);
		cell.setHorizontalAlignment(com.lowagie.text.Cell.ALIGN_CENTER);
		table.addCell(cell);
		cell = new com.lowagie.text.Cell("7");
		cell.setVerticalAlignment(com.lowagie.text.Cell.ALIGN_CENTER);
		cell.setHorizontalAlignment(com.lowagie.text.Cell.ALIGN_CENTER);
		cell.setColspan(3);
		table.addCell(cell);
		cell = new com.lowagie.text.Cell(new Paragraph("\n\n\n工作经历\n\n\n",
				fontChinese));
		//
		cell.setVerticalAlignment(com.lowagie.text.Cell.ALIGN_CENTER);
		cell.setHorizontalAlignment(com.lowagie.text.Cell.ALIGN_CENTER);
		table.addCell(cell);
		
		cell = new com.lowagie.text.Cell("8");
		cell.setVerticalAlignment(com.lowagie.text.Cell.ALIGN_CENTER);
		cell.setHorizontalAlignment(com.lowagie.text.Cell.ALIGN_CENTER);
		cell.setColspan(3);
		table.addCell(cell);
		
		cell = new com.lowagie.text.Cell(new Paragraph(
				"\n\n\n\n\t\t\t\t\t（盖章）年月日\n\n\n", fontChinese));
		cell.setVerticalAlignment(com.lowagie.text.Cell.ALIGN_CENTER);
		cell.setHorizontalAlignment(com.lowagie.text.Cell.ALIGN_CENTER);
		table.addCell(cell);
		
		/*cell.setColspan(4);
		table.addCell(cell);*/
		
		
		document.add(table);
		
		Table table2 = new Table(4);
		com.lowagie.text.Cell cell2 = new com.lowagie.text.Cell(new Paragraph(
				"姓名", fontChinese));
		table2.addCell(cell2);
		cell2 = new com.lowagie.text.Cell("1");
		table2.addCell(cell2);
		//
		cell2 = new com.lowagie.text.Cell(new Paragraph("性别", fontChinese));
		
		
		cell2.setRowspan(1);
		table2.addCell(cell2);
		
		table2.addCell(new Cell("#1"));
		table2.addCell(new Cell("#2"));
		
		/*cell2 = new com.lowagie.text.Cell("2");
		table2.addCell(cell2);*/
		
		//加入嵌套表格
	    /*Table celltable = new Table(3,1);
	    celltable.addCell( "直销");
	    celltable.addCell("非直销系数" );
	    celltable.addCell( "0" );
	    
	    celltable.setAutoFillEmptyCells(true);
	    
	    cell2= new  com.lowagie.text.Cell(celltable);
	    
	    table2.setAutoFillEmptyCells(true);*/
		
	    /*table2.addCell(cell2, 1, 3);
	    cell2 = new com.lowagie.text.Cell(new Paragraph(
				"姓名000", fontChinese));
	    table2.addCell(cell2);
	    //table2.addCell(cell2);
*/	    
	    
	    cell2 = new com.lowagie.text.Cell(new Paragraph(
				"姓名", fontChinese));
		table2.addCell(cell2);
		cell2 = new com.lowagie.text.Cell("1");
		table2.addCell(cell2);
		//
		cell2 = new com.lowagie.text.Cell(new Paragraph("性别", fontChinese));
		table2.addCell(cell2);
		cell2 = new com.lowagie.text.Cell(new Paragraph("性别", fontChinese));
		table2.addCell(cell2);
		
	    document.add(table2);
		
 		//document.newPage();
		document.close();
		System.out.println("1");

	}
}
