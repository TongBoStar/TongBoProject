package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class InteractGameentryQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 互动的ID
	 */
	private Long gameId;
	/**
	 * 资源路径
	 */
	private String resImg;
	/**
	 * 对应数字
	 */
	private Integer equalNumber;
	/**
	 * 标签名称
	 */
	private String tagName;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public Long getGameId(){
		return this.gameId;
	}
	public void setGameId(Long gameId){
		this.gameId=gameId;
	}
	public String getResImg(){
		return this.resImg;
	}
	public void setResImg(String resImg){
		this.resImg=resImg;
	}
	public Integer getEqualNumber(){
		return this.equalNumber;
	}
	public void setEqualNumber(Integer equalNumber){
		this.equalNumber=equalNumber;
	}
	public String getTagName(){
		return this.tagName;
	}
	public void setTagName(String tagName){
		this.tagName=tagName;
	}

}
