package com.terrence.core.dol.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;

import com.base.BaseAction;
import com.base.flexpaper.DocConverterHelper;
import com.file.FileHelper;


@Scope("prototype")
@Namespace("/fileupload")
public class FileUploadAction extends BaseAction{

	private static final long serialVersionUID = -4224226105524852251L;
	
	private File  file;
	private String name;
	private String filename;
	private String type;
	private String filePath;
	private String code;
	private String revision;//版次
	
    @Action(value="uploadHeadPic")
    public void uploadHeadPic() throws IOException{
    	String path = ServletActionContext.getServletContext().getRealPath("/upload");
    	// 判断文件夹是否存在,如果不存在则创建文件夹
    	File uploadFile = new File(path); 
    	if (!uploadFile.exists()) {
    		uploadFile.mkdir();
    	}
    	if(null!=file){
    		String fileName = java.util.UUID.randomUUID().toString();
    		String newName = fileName+ name.substring(name.lastIndexOf("."));
    		FileInputStream inputStream = new FileInputStream(file);
    		@SuppressWarnings("resource")
			FileOutputStream outputStream = new FileOutputStream(path+ System.getProperty("file.separator") + newName);
    		byte[] buf = new byte[1024];
    		int length = 0;
    		while ((length = inputStream.read(buf)) != -1) {
    		outputStream.write(buf, 0, length);
    		}
    		inputStream.close();
    		outputStream.flush();
    		response.getWriter().print("{\"oldName\":\""+name+"\",\"newName\":\""+fileName+name.substring(name.lastIndexOf("."))+"\",\"resPath\":\"upload\\\\"+(newName)+"\"}");
    	}
    }
    @Action(value="uploadMenuIcon")
    public void uploadMenuIcon() throws IOException{
    	String path = ServletActionContext.getServletContext().getRealPath("/upload");
    	// 判断文件夹是否存在,如果不存在则创建文件夹
    	File uploadFile = new File(path); 
    	if (!uploadFile.exists()) {
    		uploadFile.mkdir();
    	}
    	if(null!=file){
    		String tempName = java.util.UUID.randomUUID().toString();
    		String newName = tempName+ filename.substring(filename.lastIndexOf("."));
    		FileInputStream inputStream = new FileInputStream(file);
    		@SuppressWarnings("resource")
			FileOutputStream outputStream = new FileOutputStream(path+ System.getProperty("file.separator") + newName);
    		byte[] buf = new byte[1024];
    		int length = 0;
    		while ((length = inputStream.read(buf)) != -1) {
    		outputStream.write(buf, 0, length);
    		}
    		inputStream.close();
    		outputStream.flush();
    		response.getWriter().print("{\"oldName\":\""+filename+"\",\"newName\":\""+tempName+filename.substring(filename.lastIndexOf("."))+"\",\"resPath\":\"upload/"+(newName)+"\"}");
    	}
    }
    @Action(value="uploadsecond")
    public void uploadsecond() throws IOException{
    	String path = ServletActionContext.getServletContext().getRealPath("/arvoice");
    	// 判断文件夹是否存在,如果不存在则创建文件夹
    	File uploadFile = new File(path); 
    	if (!uploadFile.exists()) {
    		uploadFile.mkdir();
    	}
    	if(null!=file){
    		String tempName = java.util.UUID.randomUUID().toString();
    		String newName = tempName+ filename.substring(filename.lastIndexOf("."));
    		FileInputStream inputStream = new FileInputStream(file);
    		@SuppressWarnings("resource")
			FileOutputStream outputStream = new FileOutputStream(path+ System.getProperty("file.separator") + newName);
    		byte[] buf = new byte[1024];
    		int length = 0;
    		while ((length = inputStream.read(buf)) != -1) {
    		outputStream.write(buf, 0, length);
    		}
    		inputStream.close();
    		outputStream.flush();
    		response.getWriter().print("{\"oldName\":\""+filename+"\",\"newName\":\""+tempName+filename.substring(filename.lastIndexOf("."))+"\",\"resPath\":\"upload/"+(newName)+"\"}");
    	}
    }
    /**
     * 文档模块上传
     * 不应该有什么耦合，后期再修改吧
     * 通过webuploder传参有乱码
     * @throws IOException 
     */
    @Action(value="uploadDocRulesFile")
    public void uploadDocRulesFile() throws IOException{
    	//创建目录
    	String folderPath = request.getSession().getServletContext().getRealPath("")+"\\标准体系\\";
    	FileHelper.mkdirs(folderPath);
    	
    	//String fileName = FileHelper.getFileNameNoEx(name)+"_"+revision+"."+FileHelper.getExtensionName(name);
    	String fileName = UUID.randomUUID()+"."+FileHelper.getExtensionName(name).toLowerCase();
    	String oldName = FileHelper.getFileNameNoEx(name)+"."+FileHelper.getExtensionName(name).toLowerCase();
    	String filePath = folderPath+fileName;
    	
    	if(null!=file){
    		FileInputStream inputStream = new FileInputStream(file);
    		@SuppressWarnings("resource")
			FileOutputStream outputStream = new FileOutputStream(filePath);
    		byte[] buf = new byte[1024];
    		int length = 0;
    		while ((length = inputStream.read(buf)) != -1) {
    		outputStream.write(buf, 0, length);
    		}
    		inputStream.close();
    		outputStream.flush();
    		String fileType = FileHelper.getExtensionName(fileName);
    		//如果是office文档转pdf
    		if(FileHelper.isOffice(fileName) || FileHelper.isPdf(fileName)){
    			(new DocConverterHelper(filePath)).conver();
    		}
    		response.getWriter().print("{\"oldName\":\""+oldName+"\",\"newName\":\""+fileName+"\",\"type\":\""+FileHelper.getExtensionName(fileName)+"\",\"size\":\""+file.length()+"\"}");
    	}
    }
    
    @Action(value="uploadDocFile")
    public void uploadDocFile() throws IOException{
    	
    }


	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	public String getRevision() {
		return revision;
	}

	public void setRevision(String revision) {
		this.revision = revision;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
}