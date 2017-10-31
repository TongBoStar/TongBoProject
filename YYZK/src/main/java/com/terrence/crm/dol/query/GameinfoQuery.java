package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class GameinfoQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 游戏名称
	 */
	private String gameName;
	/**
	 * 游戏包名
	 */
	private String gamePackage;
	/**
	 * 游戏类型
	 */
	private String gameType;
	/**
	 * 是否有广告
	 */
	private Integer isad;
	/**
	 * 创建人
	 */
	private Long createUserId;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 是否推荐
	 */
	private Integer isrecommend;
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
	public String getGameName(){
		return this.gameName;
	}
	public void setGameName(String gameName){
		this.gameName=gameName;
	}
	public String getGamePackage(){
		return this.gamePackage;
	}
	public void setGamePackage(String gamePackage){
		this.gamePackage=gamePackage;
	}
	public String getGameType(){
		return this.gameType;
	}
	public void setGameType(String gameType){
		this.gameType=gameType;
	}
	public Integer getIsad(){
		return this.isad;
	}
	public void setIsad(Integer isad){
		this.isad=isad;
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
	public Integer getIsrecommend(){
		return this.isrecommend;
	}
	public void setIsrecommend(Integer isrecommend){
		this.isrecommend=isrecommend;
	}
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}

}
