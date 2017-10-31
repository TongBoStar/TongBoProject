package com.base.flexpaper;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;
import com.file.PropertiesHelper;

public class DocConverterHelper {
	Logger log = Logger.getLogger(DocConverterHelper.class.getName());
	
	private static final int environment = 1;// 环境 1：windows 2:linux
    private String fileString;// (只涉及pdf2swf路径问题)
    private String outputPath = "";// 输入路径 ，如果不设置就输出在默认的位置
    private String fileName;
    private File pdfFile;
    private File swfFile;
    private File docFile;
    
    public DocConverterHelper(String fileString) {
    	ini(fileString);
	}
    
    /**
     * 重新设置file
     *
     * @param fileString
     */
    public void setFile(String fileString) {
        ini(fileString);
    }
	/**
     * 初始化
     *
     * @param fileString
     */
    private void ini(String fileString) {
        this.fileString = fileString;
        fileName = fileString.substring(0, fileString.lastIndexOf("."));
        docFile = new File(fileString);
        pdfFile = new File(fileName + ".pdf");
        swfFile = new File(fileName + ".swf");
    }
    
    /**
     * 转为PDF
     *
     * @param file
     */
    private void doc2pdf() throws Exception {
        if (docFile.exists()) {
            if (!pdfFile.exists()) {
                try {
                	OpenOfficeConnection connection = new SocketOpenOfficeConnection(8100);
                	log.debug("开始转换......");
                    connection.connect();
                    DocumentConverter converter = new OpenOfficeDocumentConverter(connection);
                    converter.convert(docFile, pdfFile);
                    // close the connection
                    connection.disconnect();
                    System.out.println("****pdf转换成功，PDF输出：" + pdfFile.getPath()+ "****");
                } catch (java.net.ConnectException e) {
                    e.printStackTrace();
                    System.out.println("****swf转换器异常，openoffice服务未启动！****");
                    throw e;
                } catch (com.artofsolving.jodconverter.openoffice.connection.OpenOfficeException e) {
                    e.printStackTrace();
                    System.out.println("****swf转换器异常，读取转换文件失败****");
                    throw e;
                } catch (Exception e) {
                    e.printStackTrace();
                    throw e;
                }
            } else {
                System.out.println("****已经转换为pdf，不需要再进行转化****");
            }
        } else {
            System.out.println("****swf转换器异常，需要转换的文档不存在，无法转换****");
        }
    }
    
    /** 
     * 转换成 swf
     */  
    @SuppressWarnings("unused")
    private void pdf2swf() throws Exception {
        Runtime r = Runtime.getRuntime();
        if (!swfFile.exists()) {
            if (pdfFile.exists()) {
                if (environment == 1) {// windows环境处理
                    try {
                    	String swftoolsPath=PropertiesHelper.GetValueByKey("application.properties", "pdf2swf.path");
                    	swftoolsPath = swftoolsPath+"/pdf2swf.exe";
                    	String xpdfPath = PropertiesHelper.GetValueByKey("application.properties", "pdf2swf.xpdf.path");
                    	//不加双引号可能会截断
                    	//双空格的话 也需要特殊处理
                    	//No font in show
                    	//参考：http://blog.csdn.net/YangRuiHong/article/details/8978934
                    	//String command = swftoolsPath+" "+ pdfFile.getPath().replaceAll(" ","\" \"") + " -o "+ swfFile.getPath().replaceAll(" ","\" \"") + " -f -T 9 -t -s storeallcharacters";
                    	List<String> command=new ArrayList<String>();
                        command.add(swftoolsPath);
                        command.add("\""+ pdfFile.getPath()+"\"");
                        command.add("-o");
                        command.add("\""+ swfFile.getPath()+"\"");
                        command.add("-f");
                        command.add("-T");
                        command.add("9");
                        command.add("-t");
                        command.add("-s");
                        command.add("storeallcharacters");
                        command.add("-s");
                        command.add("languagedir="+xpdfPath);
                        command.add("-s");
                        command.add("poly2bitmap");
                        Process p=new ProcessBuilder(command).start();  
                    	
                        //Process p = r.exec(swftoolsPath+" \""+ pdfFile.getPath().replace(" ", "\" \"") + "\" -o \""+ swfFile.getPath().replace(" ", "\" \"") + "\" -f -T 9 -t -s storeallcharacters");
//                    	Process p = r.exec(command);
                        
                    	System.out.println("开始转换pdf......");
                        System.out.println("执行命令："+command.toString());
                        System.out.print(loadStream(p.getInputStream()));
                        System.err.print(loadStream(p.getErrorStream()));
                        System.out.print(loadStream(p.getInputStream()));
                        System.err.println("****swf转换成功，文件输出：" + swfFile.getPath() + "****");
                        //暂时不删除pdf
//                        if (pdfFile.exists()) {
//                            pdfFile.delete();
//                        }

                    } catch (IOException e) {
                        e.printStackTrace();
                        throw e;
                    }
                } else if (environment == 2) {// linux环境处理
                    try {
                        Process p = r.exec("pdf2swf " + pdfFile.getPath() + " -o " + swfFile.getPath() + " -T 9");
                        System.out.print(loadStream(p.getInputStream()));
                        System.err.print(loadStream(p.getErrorStream()));
                        System.err.println("****swf转换成功，文件输出：" + swfFile.getPath() + "****");
                        if (pdfFile.exists()) {
                            pdfFile.delete();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        throw e;
                    }
                }
            } else {
                System.out.println("****pdf不存在,无法转换****");
            }
        } else {
            System.out.println("****swf已经存在不需要转换****");
        }
    }
    
    static String loadStream(InputStream in) throws IOException {
        int ptr = 0;
        in = new BufferedInputStream(in);
//        StringBuffer buffer = new StringBuffer();
//
//        while ((ptr = in.read()) != -1) {
//            buffer.append((char) ptr);
//        }
        BufferedInputStream bis = new BufferedInputStream(in);
        BufferedReader reader = new BufferedReader (new InputStreamReader(bis));
		//之所以用BufferedReader,而不是直接用BufferedInputStream读取,是因为BufferedInputStream是InputStream的间接子类,
		//InputStream的read方法读取的是一个byte,而一个中文占两个byte,所以可能会出现读到半个汉字的情况,就是乱码.
		//BufferedReader继承自Reader,该类的read方法读取的是char,所以无论如何不会出现读个半个汉字的.
        StringBuffer result = new StringBuffer();
        while (reader.ready()) {
            result.append((char)reader.read());
        }
		//System.out.println(result.toString());
		reader.close();
        

        return result.toString();
    }
    /**
     * 转换主方法
     */
    @SuppressWarnings("unused")
    public boolean conver() {
        if (swfFile.exists()) {
            log.debug("该文件已经转换为swf");
            return true;
        }
        if (environment == 1) {
            log.debug("当前设置运行环境windows");
        } else {
            log.debug("当前设置运行环境linux");
        }
        try {
        	if(!pdfFile.exists()){
        		doc2pdf();
                pdf2swf();
        	}else{
        		pdf2swf();
        	}
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        if (swfFile.exists()) {
            return true;
        } else {
            return false;
        }
    }
 
    /**
     * 返回文件路径
     *
     * @param s
     */
    public String getswfPath() {
        if (swfFile.exists()) {
            String tempString = swfFile.getPath();
            tempString = tempString.replaceAll("\\\\", "/");
            return tempString;
        } else {
            return "";
        }
    }
    /** 
     * 设置输出路径 
     */
    public void setOutputPath(String outputPath) {
        this.outputPath = outputPath;
        if (!outputPath.equals("")) {
            String realName = fileName.substring(fileName.lastIndexOf("/"),
                    fileName.lastIndexOf("."));
            if (outputPath.charAt(outputPath.length()) == '/') {
                swfFile = new File(outputPath + realName + ".swf");
            } else {
                swfFile = new File(outputPath + realName + ".swf");
            }
        }
    }
}