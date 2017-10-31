package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class UnityobjQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键标识ID
	 */
	private Long id;
	/**
	 * 场景标识
	 */
	private String sceneCode;
	/**
	 * 对象名称
	 */
	private String objName;
	/**
	 * 备注描述
	 */
	private String fmark;
	/**
	 * 英文名称
	 */
	private String enName;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 创建人
	 */
	private Long createrUserId;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getSceneCode(){
		return this.sceneCode;
	}
	public void setSceneCode(String sceneCode){
		this.sceneCode=sceneCode;
	}
	public String getObjName(){
		return this.objName;
	}
	public void setObjName(String objName){
		this.objName=objName;
	}
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}
	public String getEnName(){
		return this.enName;
	}
	public void setEnName(String enName){
		this.enName=enName;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public Long getCreaterUserId(){
		return this.createrUserId;
	}
	public void setCreaterUserId(Long createrUserId){
		this.createrUserId=createrUserId;
	}

}
