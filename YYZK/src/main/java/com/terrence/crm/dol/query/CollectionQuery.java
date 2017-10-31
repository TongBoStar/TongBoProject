package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class CollectionQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	/**
	 * 项目ID
	 */
	private Integer itemId;
	/**
	 * 收藏用户ID
	 */
	private Integer userId;
	/**
	 * 收藏时间
	 */
	private String createTime;

	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getItemId(){
		return this.itemId;
	}
	public void setItemId(Integer itemId){
		this.itemId=itemId;
	}
	public Integer getUserId(){
		return this.userId;
	}
	public void setUserId(Integer userId){
		this.userId=userId;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}

}
