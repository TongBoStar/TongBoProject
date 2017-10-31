package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;

@Entity
public class Module extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
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
	 * 模块描述
	 */
	private String moduleDesc;
	/**
	 * 模块图片
	 */
	private String moduleIcon;
	/**
	 * 父级模块信息
	 */
	private Module module;
	/**
	 * 链接地址
	 */
	private String linkUrl;
	
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
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
	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
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
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("ModuleName",getModuleName())
			.append("ModuleLevel",getModuleLevel())
			.append("ModuleParentId",getModuleParentId())
			.append("CreateTime",getCreateTime())
			.append("ModifyTime",getModifyTime())
			.append("ModuleDesc",getModuleDesc())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getModuleName())
			.append(getModuleLevel())
			.append(getModuleParentId())
			.append(getCreateTime())
			.append(getModifyTime())
			.append(getModuleDesc())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Module == false) return false;
		if(this == obj) return true;
		Module other = (Module)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getModuleName(),other.getModuleName())
			.append(getModuleLevel(),other.getModuleLevel())
			.append(getModuleParentId(),other.getModuleParentId())
			.append(getCreateTime(),other.getCreateTime())
			.append(getModifyTime(),other.getModifyTime())
			.append(getModuleDesc(),other.getModuleDesc())
			.isEquals();
		}

}
