package com.terrence.crm.common.util;

import java.awt.Color;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

public class PdfPTableTest {
public static void main(String[] args) throws DocumentException, IOException {
	/*PdfPTable table=new PdfPTable(3);
	PdfPCell cell =new PdfPCell(new Paragraph("你好"));
	cell.setColspan(3);
	
	table.addCell(cell);
	
	table.addCell("1.1");
	table.addCell("2.1");
	table.addCell("3.1");
	
	table.addCell("1.2");
	table.addCell("2.2");
	table.addCell("3.2");*/
	//TableDemo2.createPdf(RESULT);
	File file = new File("D:\\text6.pdf");
	 file.createNewFile();
	 
	Document document = new Document(PageSize.A4);
	//document.add(table);
	PdfWriter.getInstance(document, 
			new FileOutputStream(file));
	document.open();
	
	PdfPTable table=createTable6();
	document.add(table);
	
	/*PdfPTable table=new PdfPTable(3);//列数
	PdfPCell cell =new PdfPCell(new Paragraph("你好"));
	cell.setColspan(3);//占3列
	
	table.addCell(cell);
	
	table.addCell("1.1");
	table.addCell("2.1");
	table.addCell("3.1");
	
	table.addCell("1.2");
	table.addCell("2.2");
	table.addCell("3.2");
	
	cell =new PdfPCell(new Paragraph("你好2"));
	cell.setBorderColor(new Color(255, 0, 0));
	table.addCell(cell);//3列中的第一列
	
	cell=new PdfPCell(new Paragraph("你好3"));
	cell.setColspan(2);//3该显示 第二列 设置将其占2列
	cell.setBackgroundColor( new Color(0xC0, 0xC0, 0xC0) );
	table.addCell(cell);
	
	document.add(table);//80%
	
	table.setWidthPercentage(100);//100%
	document.add(table);
	
	table.setWidthPercentage(50);//50%
	table.setHorizontalAlignment(Element.ALIGN_RIGHT);
	document.add(table);
	
	table.setHorizontalAlignment(Element.ALIGN_LEFT);
	document.add(table);*/
	
	
	document.close();
	
	System.out.println("1");
	
}



/**表格嵌套举例*/
public static PdfPTable createTable6() throws DocumentException {
    PdfPTable table = new PdfPTable(3);
    
    table.setTotalWidth(new float[]{ 144, 72, 72 });
    table.setLockedWidth(true);
    
    PdfPCell cell;
    cell = new PdfPCell(new Phrase("Table 5"));
    cell.setColspan(3);
    cell.setBorderWidth(0);//设置表格的边框宽度为0
    //cell.setLeft(100);
    table.addCell(cell);
    
    //加入嵌套表格
    PdfPTable celltable = new PdfPTable(2);
    celltable.addCell("qiantao11");
    celltable.addCell("qiantao12");
    
    cell = new PdfPCell(celltable);
    //cell.setRowspan(2);
    cell.setBorderWidth(1);//设置表格的边框宽度为1
    cell.setPadding(10);//设置表格与上一个表格的填充为10
    
    table.addCell(cell);
    
    table.addCell("row 1; cell 1");
    table.addCell("row 1; cell 2");
    table.addCell("row 2; cell 1");
    table.addCell("row 2; cell 2");
    
    return table;
}

public static final String RESULT = "c:\\TableDemo2.pdf";

public static void createPdf(String filename)
    throws IOException, DocumentException {
    // step 1
    Document document = new Document();
    // step 2
    PdfWriter.getInstance(document, new FileOutputStream(filename));
    // step 3
    document.open();
    // step 4
    PdfPTable table = createTable1();
    document.add(table);
    table = createTable2();
    table.setSpacingBefore(5);
    table.setSpacingAfter(5);
    document.add(table);
    table = createTable3();
    document.add(table);
    table = createTable4();
    table.setSpacingBefore(5);
    table.setSpacingAfter(5);
    document.add(table);
    table = createTable5();
    document.add(table);
    // step 5
    document.close();
}

/**setWidths()函数举例*/
public static PdfPTable createTable1() throws DocumentException {
    PdfPTable table = new PdfPTable(3);
    table.setWidthPercentage(288 / 5.23f);
    table.setWidths(new int[]{2, 1, 1});
    PdfPCell cell;
    cell = new PdfPCell(new Phrase("Table 1"));
    cell.setColspan(3);
    table.addCell(cell);
    cell = new PdfPCell(new Phrase("Cell with rowspan 2"));
    //cell.setRowspan(2);
    table.addCell(cell);
    table.addCell("row 1; cell 1");
    table.addCell("row 1; cell 2");
    table.addCell("row 2; cell 1");
    table.addCell("row 2; cell 2");
    return table;
}

/**setWidths()函数举例*/
public static PdfPTable createTable2() throws DocumentException {
    PdfPTable table = new PdfPTable(3);
    table.setTotalWidth(288);
    table.setLockedWidth(true);
    table.setWidths(new float[]{2, 1, 1});
    PdfPCell cell;
    cell = new PdfPCell(new Phrase("Table 2"));
    cell.setColspan(3);
    table.addCell(cell);
    cell = new PdfPCell(new Phrase("Cell with rowspan 2"));
    //cell.setRowspan(2);
    table.addCell(cell);
    table.addCell("row 1; cell 1");
    table.addCell("row 1; cell 2");
    table.addCell("row 2; cell 1");
    table.addCell("row 2; cell 2");
    return table;
}

/**合并单元格setColspan()函数举例*/
public static PdfPTable createTable3() throws DocumentException {
    PdfPTable table = new PdfPTable(new float[]{ 2, 1, 1 });
    table.setWidthPercentage(85f);
    PdfPCell cell;
    cell = new PdfPCell(new Phrase("Table 3"));
    cell.setColspan(3);
    table.addCell(cell);
    
    cell = new PdfPCell(new Phrase("Cell with rowspan 2"));
    //cell.setRowspan(2);
    table.addCell(cell);
    
    table.addCell("row 1; cell 1");
    table.addCell("row 1; cell 2");
    table.addCell("row 2; cell 1");
    table.addCell("row 2; cell 2");
    return table;
}

/**setWidthPercentage()方法举例*/
public static PdfPTable createTable4() throws DocumentException {
    PdfPTable table = new PdfPTable(3);
    Rectangle rect = new Rectangle(523, 770);
    //rect表示PageSize页面的大小，主要用于检测各列宽度之各是否超过边界，如果超过，则按比例重新赋值
    table.setWidthPercentage(new float[]{ 144, 72, 72 }, rect);
    PdfPCell cell;
    cell = new PdfPCell(new Phrase("Table 4"));
    cell.setColspan(3);
    table.addCell(cell);
    cell = new PdfPCell(new Phrase("Cell with rowspan 2"));
    //cell.setRowspan(2);
    table.addCell(cell);
    table.addCell("row 1; cell 1");
    table.addCell("row 1; cell 2");
    table.addCell("row 2; cell 1");
    table.addCell("row 2; cell 2");
    return table;
}

/**setTotalWidth()方法举例*/
public static PdfPTable createTable5() throws DocumentException {
    PdfPTable table = new PdfPTable(3);
    table.setTotalWidth(new float[]{ 144, 72, 72 });
    table.setLockedWidth(true);
    PdfPCell cell;
    cell = new PdfPCell(new Phrase("Table 5"));
    cell.setColspan(3);
    table.addCell(cell);
    cell = new PdfPCell(new Phrase("Cell with rowspan 2"));
    //cell.setRowspan(2);
    table.addCell(cell);
    table.addCell("row 1; cell 1");
    table.addCell("row 1; cell 2");
    table.addCell("row 2; cell 1");
    table.addCell("row 2; cell 2");
    return table;
}
}
