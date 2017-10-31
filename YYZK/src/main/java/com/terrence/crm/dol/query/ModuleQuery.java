package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class ModuleQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	/**
	 * 模块名称
	 */
	private String moduleName;
	/**
	 * 模块编码
	 */
	private String moduleCode;
	/**
	 * 模块级别,最多三级
	 */
	private Integer moduleLevel;
	/**
	 * 父级ID
	 */
	private Integer moduleParentId;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 修改时间
	 */
	private String modifyTime;
	/**
	 * 模块图片
	 */
	private String moduleIcon;
	/**
	 * 模块描述
	 */
	private String moduleDesc;
	/**
	 * 链接地址
	 */
	private String linkUrl;
	
	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public String getModuleName(){
		return this.moduleName;
	}
	public void setModuleName(String moduleName){
		this.moduleName=moduleName;
	}
	public Integer getModuleLevel(){
		return this.moduleLevel;
	}
	public void setModuleLevel(Integer moduleLevel){
		this.moduleLevel=moduleLevel;
	}
	public Integer getModuleParentId(){
		return this.moduleParentId;
	}
	public void setModuleParentId(Integer moduleParentId){
		this.moduleParentId=moduleParentId;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public String getModifyTime(){
		return this.modifyTime;
	}
	public void setModifyTime(String modifyTime){
		this.modifyTime=modifyTime;
	}
	public String getModuleDesc(){
		return this.moduleDesc;
	}
	public void setModuleDesc(String moduleDesc){
		this.moduleDesc=moduleDesc;
	}
	public String getModuleIcon() {
		return moduleIcon;
	}
	public void setModuleIcon(String moduleIcon) {
		this.moduleIcon = moduleIcon;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	public String getModuleCode() {
		return moduleCode;
	}
	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

}
