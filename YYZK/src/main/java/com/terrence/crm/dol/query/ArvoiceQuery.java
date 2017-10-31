package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class ArvoiceQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 唯一标识ID
	 */
	private Long id;
	/**
	 * 音频名称
	 */
	private String voiceName;
	/**
	 * 音频路径
	 */
	private String voicePath;
	/**
	 * 别名
	 */
	private String actionName;
	/**
	 * 备注
	 */
	private String fmark;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getVoiceName(){
		return this.voiceName;
	}
	public void setVoiceName(String voiceName){
		this.voiceName=voiceName;
	}
	public String getVoicePath(){
		return this.voicePath;
	}
	public void setVoicePath(String voicePath){
		this.voicePath=voicePath;
	}
	public String getActionName(){
		return this.actionName;
	}
	public void setActionName(String actionName){
		this.actionName=actionName;
	}
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}

}
