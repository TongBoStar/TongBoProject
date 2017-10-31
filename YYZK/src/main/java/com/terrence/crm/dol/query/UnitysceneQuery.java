package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class UnitysceneQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 唯一标识ID
	 */
	private Long id;
	/**
	 * 场景名称
	 */
	private String sceneName;
	/**
	 * 最低年龄
	 */
	private Integer minage;
	/**
	 * 最高年龄
	 */
	private Integer maxage;
	/**
	 * 是否可用
	 */
	private Integer fstatus;
	/**
	 * 场景代码
	 */
	private String sceneCode;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 创建人
	 */
	private Long createrUserId;
	/**
	 * 备注
	 */
	private String fmark;
	/**
	 * 图片位置
	 */
	private String resourceIcon;
	/**
	 * 场景序号
	 */
	private Integer fseq;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getSceneName(){
		return this.sceneName;
	}
	public void setSceneName(String sceneName){
		this.sceneName=sceneName;
	}
	public Integer getMinage(){
		return this.minage;
	}
	public void setMinage(Integer minage){
		this.minage=minage;
	}
	public Integer getMaxage(){
		return this.maxage;
	}
	public void setMaxage(Integer maxage){
		this.maxage=maxage;
	}
	public Integer getFstatus(){
		return this.fstatus;
	}
	public void setFstatus(Integer fstatus){
		this.fstatus=fstatus;
	}
	public String getSceneCode(){
		return this.sceneCode;
	}
	public void setSceneCode(String sceneCode){
		this.sceneCode=sceneCode;
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
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}
	public String getResourceIcon(){
		return this.resourceIcon;
	}
	public void setResourceIcon(String resourceIcon){
		this.resourceIcon=resourceIcon;
	}
	public Integer getFseq(){
		return this.fseq;
	}
	public void setFseq(Integer fseq){
		this.fseq=fseq;
	}

}
