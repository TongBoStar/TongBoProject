package com.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * 文件操作类
 * 
 * @author hf.cao
 *
 */
public class FileHelper {

	/**
	 * 检查文件是否存在
	 * 
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public static boolean existFile(String fileName) throws IOException {
		File file = new File(fileName);
		if (!file.exists()) {
			throw new IOException("文件未找到:" + fileName);
		}
		return file.exists();
	}

	/**
	 * 
	 * 删除文件或空目录
	 * 如果目录下有文件，则目录无法删除
	 * @param fileName
	 * @throws IOException 
	 * 
	 */
	public static void deleteFile(String fileName){
		File file = new File(fileName);
//		if (!file.exists()) {
//			throw new IOException("文件未找到:" + fileName);
//		}
		file.delete();
	}
	
	/**
	 * 递归删除目录下的所有文件及子目录下所有文件
	 * @param dir
	 * @return
	 */
	public static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            //递归删除目录中的子目录下
            for (int i=0; i<children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        // 目录此时为空，可以删除
        return dir.delete();
    }

	/**
	 * 创建目录(多级)
	 *
	 * @param dir
	 */
	public static void mkdirs(String dir) {
		String dirTemp = dir;
		File dirPath = new File(dirTemp);
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
	}

	/**
	 * 创建目录
	 * 
	 * @param dir
	 */
	public static void mkdir(String dir) {
		String dirTemp = dir;
		File dirPath = new File(dirTemp);
		if (!dirPath.exists()) {
			dirPath.mkdir();
		}
	}

	/**
	 * Java文件操作 获取文件扩展名
	 * 
	 * @param filename
	 * @return
	 */
	public static String getExtensionName(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			int dot = filename.lastIndexOf('.');
			if ((dot > -1) && (dot < (filename.length() - 1))) {
				return filename.substring(dot + 1);
			}
		}
		return filename;
	}

	/**
	 * Java文件操作 获取不带扩展名的文件名
	 * 
	 * @param filename
	 * @return
	 */
	public static String getFileNameNoEx(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			int dot = filename.lastIndexOf('.');
			if ((dot > -1) && (dot < (filename.length()))) {
				return filename.substring(0, dot);
			}
		}
		return filename;
	}
	
	/**
	 * 文件是否是office文件
	 * @param filename
	 * @return
	 */
	public static Boolean isOffice(String filename){
		String extensionName = getExtensionName(filename).toLowerCase();
		List<String> list = new ArrayList<String>();
		list.add("doc");
		list.add("docx");
		list.add("xls");
		list.add("xlsx");
		list.add("ppt");
		list.add("pptx");
		if(list.contains(extensionName)){
			return true;
		}else{
			return false;
		}
	}
	
	public static Boolean isPdf(String filename){
		String extensionName = getExtensionName(filename).toLowerCase();
		List<String> list = new ArrayList<String>();
		list.add("pdf");
		if(list.contains(extensionName)){
			return true;
		}else{
			return false;
		}
	}

	public static void tree(File f, int level) {
		String preStr = "";// 缩进量
		for (int i = 0; i < level; i++) {
			if (i == level - 1)
				preStr = preStr + "┗";
			else
				preStr = preStr + "*";// 级别 - 代表这个目下下地子文件夹
		}
		File[] childs = f.listFiles();// 返回一个抽象路径名数组，这些路径名表示此抽象路径名所表示目录中地文件
		for (int i = 0; i < childs.length; i++) {
			System.out.println(preStr + childs[i].getName());// 打印子文件地名字
			if (childs[i].isDirectory()) { // 测试此抽象路径名表示地文件能否是一个目录
				tree(childs[i], level + 1);
			}// 假如子目录下还有子目录，递归子目录调用此方法
		}
	}

	public static FileInfo getFileInfo(File f) {
		FileInfo fileInfo = new FileInfo();
		fileInfo.setType(FileTypeHelper.getFileByFile(f));
		fileInfo.setSize(f.length() + "");
		fileInfo.setName(f.getName());
		return fileInfo;
	}

	/**
	 * 重命名文件
	 * @param resFilePath
	 * @param newFileName
	 * @return
	 */
	public static boolean renameFile(String resFilePath, String newFileName) { 
		File resFile = new File(resFilePath);
		String newFilePath = resFile.getParent()+"/"+newFileName;
        File newFile = new File(newFilePath); 
        return resFile.renameTo(newFile); 
	}
	
	/**  
     * 递归查找文件  
     * @param baseDirName  查找的文件夹路径  
     * @param targetFileName  需要查找的文件名  
     * @param fileList  查找到的文件集合  
     */  
    public static void findFiles(String baseDirName, String targetFileName, List fileList) {   
      
    	File baseDir = new File(baseDirName);		// 创建一个File对象
		if (!baseDir.exists() || !baseDir.isDirectory()) {	// 判断目录是否存在
			System.out.println("文件查找失败：" + baseDirName + "不是一个目录！");
		}
        String tempName = null;   
        //判断目录是否存在   
        File tempFile;
    	File[] files = baseDir.listFiles();
    	for (int i = 0; i < files.length; i++) {
			tempFile = files[i];
			if(tempFile.isDirectory()){
				findFiles(tempFile.getAbsolutePath(), targetFileName, fileList);
			}else if(tempFile.isFile()){
				tempName = tempFile.getName();
				if(wildcardMatch(targetFileName, tempName)){
					// 匹配成功，将文件名添加到结果集
					fileList.add(tempFile.getAbsoluteFile());
				}
			}
		}
    }   
       
    /**  
     * 通配符匹配  
     * @param pattern    通配符模式  
     * @param str    待匹配的字符串  
     * @return    匹配成功则返回true，否则返回false  
     */  
    private static boolean wildcardMatch(String pattern, String str) {   
        int patternLength = pattern.length();   
        int strLength = str.length();   
        int strIndex = 0;   
        char ch;   
        for (int patternIndex = 0; patternIndex < patternLength; patternIndex++) {   
            ch = pattern.charAt(patternIndex);   
            if (ch == '*') {   
                //通配符星号*表示可以匹配任意多个字符   
                while (strIndex < strLength) {   
                    if (wildcardMatch(pattern.substring(patternIndex + 1),   
                            str.substring(strIndex))) {   
                        return true;   
                    }   
                    strIndex++;   
                }   
            } else if (ch == '?') {   
                //通配符问号?表示匹配任意一个字符   
                strIndex++;   
                if (strIndex > strLength) {   
                    //表示str中已经没有字符匹配?了。   
                    return false;   
                }   
            } else {   
                if ((strIndex >= strLength) || (ch != str.charAt(strIndex))) {   
                    return false;   
                }   
                strIndex++;   
            }   
        }   
        return (strIndex == strLength);   
    } 
	
	public static void main(String[] args) throws IOException {
		// File f = new File("C:/资料");// 指定文件位置
		// System.out.println(f.getName());// 打印在这个文件下地文件夹;
		// tree(f, 1);// 方法!进入子文件夹中 并打印子文件名
		// System.out.println("["+toTreeGridJson(treeList(f,1))+"]");
//		mkdir("D:\\资料\\图书\\");
//		System.out.println("aaaaaaaaaaaaa");
//		System.out.println(isOffice("产品研发流程图1.doc2"));
		
//		deleteFile("D:\\测试\\新建文件夹 (2)\\1111.txt");
//		deleteDir(new File("D:\\测试\\新建文件夹 (2)\\"));
//		System.out.println("删除");
		
//		renameFile("D:\\测试文档1\\","测试文档sss");
		
//		String baseDIR = "D:\\software\\tomcat7\\webapps\\TerrenceInfo\\lucene\\doc";    
//        //    找扩展名为txt的文件   
//        String fileName = "segments*";    
//        List resultList = new ArrayList();
//        findFiles(baseDIR, fileName,resultList);   
//        System.out.println(resultList.size()+"==================");
		
		renameFile("d:\\abc\\aaa.txt", "bcd.txt");
		System.out.println("--------------");
	}
}
