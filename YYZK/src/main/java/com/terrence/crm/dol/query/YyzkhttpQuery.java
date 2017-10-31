package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class YyzkhttpQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	/**
	 * 控制模块
	 */
	private String actionModule;
	/**
	 * 类型
	 */
	private Integer ftype;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getActionModule(){
		return this.actionModule;
	}
	public void setActionModule(String actionModule){
		this.actionModule=actionModule;
	}
	public Integer getFtype(){
		return this.ftype;
	}
	public void setFtype(Integer ftype){
		this.ftype=ftype;
	}

}
