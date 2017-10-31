package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Gameinfo extends BaseEntity implements java.io.Serializable {
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
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("GameName",getGameName())
			.append("GamePackage",getGamePackage())
			.append("GameType",getGameType())
			.append("Isad",getIsad())
			.append("CreateUserId",getCreateUserId())
			.append("CreateTime",getCreateTime())
			.append("Isrecommend",getIsrecommend())
			.append("Fmark",getFmark())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getGameName())
			.append(getGamePackage())
			.append(getGameType())
			.append(getIsad())
			.append(getCreateUserId())
			.append(getCreateTime())
			.append(getIsrecommend())
			.append(getFmark())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Gameinfo == false) return false;
		if(this == obj) return true;
		Gameinfo other = (Gameinfo)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getGameName(),other.getGameName())
			.append(getGamePackage(),other.getGamePackage())
			.append(getGameType(),other.getGameType())
			.append(getIsad(),other.getIsad())
			.append(getCreateUserId(),other.getCreateUserId())
			.append(getCreateTime(),other.getCreateTime())
			.append(getIsrecommend(),other.getIsrecommend())
			.append(getFmark(),other.getFmark())
			.isEquals();
		}

}
