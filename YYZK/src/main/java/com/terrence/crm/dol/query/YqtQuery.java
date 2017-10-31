package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class YqtQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 名称
	 */
	private String fname;
	/**
	 * 类别 1故事 2儿歌 3童话 4国学
	 */
	private Integer ftype;
	/**
	 * 时长
	 */
	private Integer times;
	/**
	 * 资源图标
	 */
	private String resIcon;
	/**
	 * 资源地址
	 */
	private String resourceUrl;
	/**
	 * 描述
	 */
	private String fdesc;
	/**
	 * 创建人
	 */
	private Long createrId;
	/**
	 * 创建时间
	 */
	private String createDate;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getFname(){
		return this.fname;
	}
	public void setFname(String fname){
		this.fname=fname;
	}
	public Integer getFtype(){
		return this.ftype;
	}
	public void setFtype(Integer ftype){
		this.ftype=ftype;
	}
	public Integer getTimes(){
		return this.times;
	}
	public void setTimes(Integer times){
		this.times=times;
	}
	public String getResIcon(){
		return this.resIcon;
	}
	public void setResIcon(String resIcon){
		this.resIcon=resIcon;
	}
	public String getResourceUrl(){
		return this.resourceUrl;
	}
	public void setResourceUrl(String resourceUrl){
		this.resourceUrl=resourceUrl;
	}
	public String getFdesc(){
		return this.fdesc;
	}
	public void setFdesc(String fdesc){
		this.fdesc=fdesc;
	}
	public Long getCreaterId(){
		return this.createrId;
	}
	public void setCreaterId(Long createrId){
		this.createrId=createrId;
	}
	public String getCreateDate(){
		return this.createDate;
	}
	public void setCreateDate(String createDate){
		this.createDate=createDate;
	}

}
