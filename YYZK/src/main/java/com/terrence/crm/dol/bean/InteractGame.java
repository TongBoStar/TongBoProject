package com.terrence.crm.dol.bean;
import java.util.List;

import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class InteractGame extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 互动游戏名称
	 */
	private String fname;
	/**
	 * 互动内容
	 */
	private String fcontent;
	/**
	 * 互动游戏类型 1判断对错 2连连看
	 */
	private Integer ftype;
	/**
	 * 答案
	 */
	private String fanswer;
	/**
	 * 图标
	 */
	private String interactIcon;
	/**
	 * 互动描述
	 */
	private String fdesc;
	/**
	 * 创建人ID
	 */
	private Long createrId;
	/**
	 * 创建时间
	 */
	private String createDate;
	/**
	 * 互动答对后奖励玩儿的游戏
	 */
	private String gameaward;
	/**
	 * 互动答对后奖励玩儿的游戏包名
	 */
	private String gameawardpackage;
	/**
	 * 互动内容明细
	 */
	private List<InteractGameentry> interactGameentries;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getFname(){
		return this.fname;
	}
	public void setFname(String fname){
		this.fname=fname;
	}
	public String getFcontent(){
		return this.fcontent;
	}
	public void setFcontent(String fcontent){
		this.fcontent=fcontent;
	}
	public Integer getFtype(){
		return this.ftype;
	}
	public void setFtype(Integer ftype){
		this.ftype=ftype;
	}
	public String getFanswer(){
		return this.fanswer;
	}
	public void setFanswer(String fanswer){
		this.fanswer=fanswer;
	}
	public String getFdesc(){
		return this.fdesc;
	}
	public void setFdesc(String fdesc){
		this.fdesc=fdesc;
	}
	public Long getCreaterId(){
		return this.createrId;
	}
	public void setCreaterId(Long createrId){
		this.createrId=createrId;
	}
	public String getCreateDate(){
		return this.createDate;
	}
	public void setCreateDate(String createDate){
		this.createDate=createDate;
	}
	public List<InteractGameentry> getInteractGameentries() {
		return interactGameentries;
	}
	public void setInteractGameentries(List<InteractGameentry> interactGameentries) {
		this.interactGameentries = interactGameentries;
	}
	public String getInteractIcon() {
		return interactIcon;
	}
	public void setInteractIcon(String interactIcon) {
		this.interactIcon = interactIcon;
	}
	public String getGameaward() {
		return gameaward;
	}
	public void setGameaward(String gameaward) {
		this.gameaward = gameaward;
	}
	public String getGameawardpackage() {
		return gameawardpackage;
	}
	public void setGameawardpackage(String gameawardpackage) {
		this.gameawardpackage = gameawardpackage;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("Fname",getFname())
			.append("Fcontent",getFcontent())
			.append("Ftype",getFtype())
			.append("Fanswer",getFanswer())
			.append("Fdesc",getFdesc())
			.append("CreaterId",getCreaterId())
			.append("CreateDate",getCreateDate())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getFname())
			.append(getFcontent())
			.append(getFtype())
			.append(getFanswer())
			.append(getFdesc())
			.append(getCreaterId())
			.append(getCreateDate())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof InteractGame == false) return false;
		if(this == obj) return true;
		InteractGame other = (InteractGame)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getFname(),other.getFname())
			.append(getFcontent(),other.getFcontent())
			.append(getFtype(),other.getFtype())
			.append(getFanswer(),other.getFanswer())
			.append(getFdesc(),other.getFdesc())
			.append(getCreaterId(),other.getCreaterId())
			.append(getCreateDate(),other.getCreateDate())
			.isEquals();
		}

}
