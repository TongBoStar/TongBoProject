package com.terrence.cn.test.wxmms;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class SendMessage {
	
	//文本
	private String content;
	
	//图片
	private CommonsMultipartFile file;
	private String imageUrl;
	
	
	private List<String> contents;
	private List<CommonsMultipartFile> files;
	private List<String> imageUrls;
	private String showCoverPic = "1";	//是否显示封面
	
	private List<String> authers;
	private List<String> titles;
	private List<String> contentSourceUrls;
	private List<String> digests;
	private String twUrl;	//tu wen url
	
	private String type;
	private String typeDesc;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	public List<String> getContents() {
		return contents;
	}
	public void setContents(List<String> contents) {
		this.contents = contents;
	}
	public List<CommonsMultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<CommonsMultipartFile> files) {
		this.files = files;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTypeDesc() {
		if(Contants.SEND_MSG_TEXT.equals(type))
			typeDesc = "文本";
		if(Contants.SEND_MSG_IMAGE.equals(type))
			typeDesc = "图片";
		if(Contants.SEND_MSG_TEXT_IMAGE.equals(type))
			typeDesc = "图文";
		return typeDesc;
	}
	public void setTypeDesc(String typeDesc) {
		this.typeDesc = typeDesc;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public List<String> getImageUrls() {
		if(null == imageUrls)
			imageUrls = new ArrayList<String>();
		return imageUrls;
	}
	public void setImageUrls(List<String> imageUrls) {
		this.imageUrls = imageUrls;
	}
	public String getShowCoverPic() {
		return showCoverPic;
	}
	public void setShowCoverPic(String showCoverPic) {
		this.showCoverPic = showCoverPic;
	}
	public List<String> getAuthers() {
		if(null == authers)
			authers = new ArrayList<String>();
		return authers;
	}
	public void setAuthers(List<String> authers) {
		this.authers = authers;
	}
	public List<String> getTitles() {
		if(null == titles)
			titles = new ArrayList<String>();
		return titles;
	}
	public void setTitles(List<String> titles) {
		this.titles = titles;
	}
	public List<String> getContentSourceUrls() {
		if(null == contentSourceUrls)
			contentSourceUrls = new ArrayList<String>();
		return contentSourceUrls;
	}
	public void setContentSourceUrls(List<String> contentSourceUrls) {
		this.contentSourceUrls = contentSourceUrls;
	}
	public List<String> getDigests() {
		if(null == digests)
			digests = new ArrayList<String>();
		return digests;
	}
	public void setDigests(List<String> digests) {
		this.digests = digests;
	}
	public String getTwUrl() {
		return twUrl;
	}
	public void setTwUrl(String twUrl) {
		this.twUrl = twUrl;
	}
	
}
