package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class HelpvideoQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String videoName;
	/**
	 * 链接地址
	 */
	private String videoUrl;
	/**
	 * 详细说明
	 */
	private String videoDetail;
	/**
	 * 备注
	 */
	private String fmark;
	/**
	 * 序号
	 */
	private Integer fseq;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getVideoName(){
		return this.videoName;
	}
	public void setVideoName(String videoName){
		this.videoName=videoName;
	}
	public String getVideoUrl(){
		return this.videoUrl;
	}
	public void setVideoUrl(String videoUrl){
		this.videoUrl=videoUrl;
	}
	public String getVideoDetail(){
		return this.videoDetail;
	}
	public void setVideoDetail(String videoDetail){
		this.videoDetail=videoDetail;
	}
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}
	public Integer getFseq(){
		return this.fseq;
	}
	public void setFseq(Integer fseq){
		this.fseq=fseq;
	}

}
