package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class TuringtestQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 测试模块名称
	 */
	private String modelName;
	/**
	 * 测试记录内容
	 */
	private String fanswer;
	/**
	 * 问的问题
	 */
	private String fask;
	/**
	 * 是否正常
	 */
	private Integer fstatus;
	/**
	 * 测试时间
	 */
	private String createTime;
	/**
	 * 回复的原始记录
	 */
	private String fcontent;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getModelName(){
		return this.modelName;
	}
	public void setModelName(String modelName){
		this.modelName=modelName;
	}
	public String getFanswer(){
		return this.fanswer;
	}
	public void setFanswer(String fanswer){
		this.fanswer=fanswer;
	}
	public String getFask(){
		return this.fask;
	}
	public void setFask(String fask){
		this.fask=fask;
	}
	public Integer getFstatus(){
		return this.fstatus;
	}
	public void setFstatus(Integer fstatus){
		this.fstatus=fstatus;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public String getFcontent(){
		return this.fcontent;
	}
	public void setFcontent(String fcontent){
		this.fcontent=fcontent;
	}

}
