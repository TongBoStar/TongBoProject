package com.terrence.crm.common.util;

import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.rtf.RtfWriter2;
import java.awt.Color;
import java.io.FileOutputStream;
import java.io.IOException;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;

public class exportword {
	/*
	 * static void processCell(HSSFCell cell, int value, HSSFCellStyle style) {
	 * cell.setCellValue(value); cell.setCellStyle(style); }
	 * 
	 * static void processCell(HSSFCell cell, String value, HSSFCellStyle style)
	 * { HSSFRichTextString _value = new HSSFRichTextString(value);
	 * cell.setCellValue(_value); cell.setCellStyle(style); }
	 * 
	 * private HSSFWorkbook generateWorkbook(String type) { Connection conn =
	 * null; try { conn = TodayConnection.getConnection(); Statement stmt =
	 * conn.createStatement(); String sql = null; if (type == null ||
	 * type.equals("")) { sql = "select * from telNumber order by id desc"; }
	 * else { sql = "select * from telNumber where counseling ='" + type +
	 * "' order by id desc"; } ResultSet rs = stmt.executeQuery(sql);
	 * 
	 * HSSFWorkbook workbook = new HSSFWorkbook(); HSSFSheet sheet =
	 * workbook.createSheet("导出数据");
	 * 
	 * HSSFRow row = sheet.createRow((short) 0); row.setHeight((short) (15 *
	 * 32)); HSSFCell[] headArray = new HSSFCell[7]; String[] headTitles = new
	 * String[] { "No.", "姓名", "电话", "公司名称", "咨询项目", "备注", "时间" };
	 * 
	 * HSSFCellStyle style = workbook.createCellStyle(); // 这里解决背景颜色
	 * style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
	 * style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	 * 
	 * style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	 * style.setBottomBorderColor(HSSFColor.BLACK.index);
	 * style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	 * style.setLeftBorderColor(HSSFColor.BLACK.index);
	 * style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	 * style.setRightBorderColor(HSSFColor.BLACK.index);
	 * style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	 * style.setTopBorderColor(HSSFColor.BLACK.index);
	 * style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	 * 
	 * // 字体 HSSFFont font = workbook.createFont();
	 * font.setFontHeightInPoints((short) 12); font.setFontName("Courier New");
	 * font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); style.setFont(font);
	 * 
	 * for (int i = 0; i < headArray.length; i++) { headArray[i] =
	 * row.createCell((short)i); headArray[i].setCellStyle(style);
	 * HSSFRichTextString value = new HSSFRichTextString(headTitles[i]);
	 * headArray[i].setCellValue(value); }
	 * 
	 * HSSFCellStyle styleData = workbook.createCellStyle();
	 * styleData.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	 * styleData.setBottomBorderColor(HSSFColor.BLACK.index);
	 * styleData.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	 * styleData.setLeftBorderColor(HSSFColor.BLACK.index);
	 * styleData.setBorderRight(HSSFCellStyle.BORDER_THIN);
	 * styleData.setRightBorderColor(HSSFColor.BLACK.index);
	 * styleData.setBorderTop(HSSFCellStyle.BORDER_THIN);
	 * styleData.setTopBorderColor(HSSFColor.BLACK.index);
	 * styleData.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 字体 HSSFFont font1
	 * = workbook.createFont(); font1.setFontHeightInPoints((short) 12);
	 * font1.setFontName("Courier New"); styleData.setFont(font1);
	 * 
	 * // 循环查询的所有记录把每一行写入worksheet里面 int no = 1; short rowNo = 1;
	 * 
	 * HSSFRow dataRow = sheet.createRow(rowNo++); dataRow.setHeight((short) (12
	 * * 32)); processCell(dataRow.createCell((short)0), no++, styleData);
	 * processCell(dataRow.createCell((short)1), "测试", styleData);
	 * processCell(dataRow.createCell((short)2), "测试", styleData);
	 * processCell(dataRow.createCell((short)3), "测试", styleData);
	 * processCell(dataRow.createCell((short)4), "测试", styleData);
	 * processCell(dataRow.createCell((short)5),"测试", styleData);
	 * processCell(dataRow.createCell((short)6), "测试", styleData);
	 * 
	 * 
	 * // 调整宽度 short[] widths = new short[] { 5, 15, 18, 22, 13, 50, 30 }; for
	 * (short k = 0; k < 7; k++) { sheet.setColumnWidth((short)k,
	 * (short)(widths[k] * 256)); }
	 * 
	 * return workbook; } catch (Exception e) { } finally { }// END OF PROGRAMM
	 * 
	 * return null; }
	 */

	public void createDocContext(String file) throws DocumentException,
			IOException {
		// 设置纸张大小
		Document document = new Document(PageSize.A4);
		// 建立一个书写器(Writer)与document对象关联，通过书写器(Writer)可以将文档写入到磁盘中
		RtfWriter2.getInstance(document, new FileOutputStream(file));
		document.open();
		// 设置中文字体
		BaseFont bfChinese = BaseFont.createFont("STSongStd-Light",
				"UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
		// 标题字体风格
		Font titleFont = new Font(bfChinese, 12, Font.BOLD);
		// 正文字体风格
		Font contextFont = new Font(bfChinese, 10, Font.NORMAL);
		Paragraph title = new Paragraph("标题");
		// 设置标题格式对齐方式
		title.setAlignment(Element.ALIGN_CENTER);
		//title.setFont(titleFont);
		document.add(title);

		String contextString = "iText是一个能够快速产生PDF文件的java类库。"
				+ " \n"// 换行
				+ "iText的java类对于那些要产生包含文本，"
				+ "表格，图形的只读文档是很有用的。它的类库尤其与java Servlet有很好的给合。"
				+ "使用iText与PDF能够使你正确的控制Servlet的输出。";
		Paragraph context = new Paragraph(contextString);
		// 正文格式左对齐
		context.setAlignment(Element.ALIGN_LEFT);
		//context.setFont(contextFont);
		// 离上一段落（标题）空的行数
		context.setSpacingBefore(5);
		// 设置第一行空的列数
		context.setFirstLineIndent(20);
		document.add(context);

		// 利用类FontFactory结合Font和Color可以设置各种各样字体样式
		/**
		 * Font.UNDERLINE 下划线，Font.BOLD 粗体
		 */
		Paragraph underline = new Paragraph("下划线的实现", FontFactory.getFont(
				FontFactory.HELVETICA_BOLDOBLIQUE, 18, Font.UNDERLINE,
				new Color(0, 0, 255)));
		document.add(underline);

		// 设置 Table 表格
		Table aTable = new Table(3);
		int width[] = { 25, 25, 50 };
		aTable.setWidths(width);// 设置每列所占比例
		aTable.setWidth(90); // 占页面宽度 90%

		aTable.setAlignment(Element.ALIGN_CENTER);// 居中显示
		aTable.setAlignment(Element.ALIGN_MIDDLE);// 纵向居中显示
		
		aTable.setAutoFillEmptyCells(true); // 自动填满
		aTable.setBorderWidth(1); // 边框宽度
		aTable.setBorderColor(new Color(0, 125, 255)); // 边框颜色
		
		aTable.setPadding(0);// 衬距，看效果就知道什么意思了
		aTable.setSpacing(0);// 即单元格之间的间距
		aTable.setBorder(2);// 边框

		// 设置表头
		/**
		 * cell.setHeader(true);是将该单元格作为表头信息显示； cell.setColspan(3);指定了该单元格占3列；
		 * 为表格添加表头信息时，要注意的是一旦表头信息添加完了之后， \ 必须调用
		 * endHeaders()方法，否则当表格跨页后，表头信息不会再显示
		 */
		Cell haderCell = new Cell("表格表头");
		haderCell.setHeader(true);
		haderCell.setColspan(3);
		aTable.addCell(haderCell);
		aTable.endHeaders();

		Font fontChinese = new Font(bfChinese, 12, Font.NORMAL, Color.GREEN);
		Cell cell = new Cell(new Phrase(" 3*3", fontChinese));
		cell.setVerticalAlignment(Element.ALIGN_TOP);
		
		cell.setBorderColor(new Color(255, 0, 0));
		
		cell.setRowspan(1);
		
		aTable.addCell(cell);

		aTable.addCell(new Cell("#1"));
		aTable.addCell(new Cell("#2"));
		//aTable.addCell(new Cell("#3"));
		//aTable.addCell(new Cell("#4"));
		
		
		Cell cell3 = new Cell(new Phrase("一行三列数据", fontChinese));
		
		cell3.setColspan(3);
		
		cell3.setVerticalAlignment(Element.ALIGN_CENTER);
		aTable.addCell(cell3);

		document.add(aTable);
		document.add(new Paragraph("\n"));
		
		
		
		Table aTable2 = new Table(4);
		
		Cell cell2 = new Cell(new Phrase(" 3*3", fontChinese));
		
		cell2.setRowspan(1);
		
		aTable2.addCell(cell2);
		Cell cell21 = new Cell(new Phrase(" 3*3", fontChinese));
		
		Cell cell22 = new Cell(new Phrase(" 3*3", fontChinese));
		
		aTable2.addCell( cell21);
		aTable2.addCell( cell22);
		document.add(aTable2);
		
		// 添加图片
		// Image
		// img=Image.getInstance("http://127.0.0.1:8080/testSystem/images/1_r1_c1.png");
		// img.setAbsolutePosition(0, 0);
		// img.setAlignment(Image.RIGHT);//设置图片显示位置
		// img.scaleAbsolute(12,35);//直接设定显示尺寸
		// img.scalePercent(50);//表示显示的大小为原尺寸的50%
		// img.scalePercent(25, 12);//图像高宽的显示比例
		// img.setRotation(30);//图像旋转一定角度
		// document.add(img);

		document.close();
	}

	public static void main(String[] args) {
		exportword b = new exportword();
		try {
			b.createDocContext("d:/demo1.doc");
			System.out.println("1");
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
