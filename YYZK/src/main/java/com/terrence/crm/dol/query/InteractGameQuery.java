package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class InteractGameQuery extends BaseQuery implements java.io.Serializable {
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
	 * 图标
	 */
	private String interactIcon;
	/**
	 * 互动答对后奖励玩儿的游戏
	 */
	private String gameaward;
	/**
	 * 互动答对后奖励玩儿的游戏包名
	 */
	private String gameawardpackage;
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

}
