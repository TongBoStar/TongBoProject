package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class YqkitemQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键唯一标识
	 */
	private Long id;
	/**
	 * 模块名称
	 */
	private String itemclassName;
	/**
	 * 父级ID
	 */
	private Integer parentId;
	/**
	 * 图标路径
	 */
	private String itemicon;
	/**
	 * 级别
	 */
	private Integer flevel;
	/**
	 * 描述
	 */
	private String fdesc;
	/**
	 * 创建人
	 */
	private Long createUserId;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 专辑类别
	 */
	private String itemType ;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getItemclassName(){
		return this.itemclassName;
	}
	public void setItemclassName(String itemclassName){
		this.itemclassName=itemclassName;
	}
	public Integer getParentId(){
		return this.parentId;
	}
	public void setParentId(Integer parentId){
		this.parentId=parentId;
	}
	public String getItemicon(){
		return this.itemicon;
	}
	public void setItemicon(String itemicon){
		this.itemicon=itemicon;
	}
	public Integer getFlevel(){
		return this.flevel;
	}
	public void setFlevel(Integer flevel){
		this.flevel=flevel;
	}
	public String getFdesc(){
		return this.fdesc;
	}
	public void setFdesc(String fdesc){
		this.fdesc=fdesc;
	}
	public Long getCreateUserId(){
		return this.createUserId;
	}
	public void setCreateUserId(Long createUserId){
		this.createUserId=createUserId;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public String getItemType() {
		return itemType;
	}
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

}
