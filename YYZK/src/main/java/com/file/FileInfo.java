package com.file;

import java.io.File;
import java.util.List;

public class FileInfo {

	private List<FileInfo> children;//子文件或文件夹
	private File file;
	private String name;
	private String size;
	private String type;
	
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public List<FileInfo> getChildren() {
		return children;
	}
	public void setChildren(List<FileInfo> children) {
		this.children = children;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}