package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class ModuleImg extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	/**
	 * 模块ID
	 */
	private Integer moduleId;
	/**
	 * 模块标识
	 */
	private String moduleCode;
	/**
	 * 轮播图名称
	 */
	private String moduleImgName;
	/**
	 * 轮播图地址
	 */
	private String imgPath;
	/**
	 * 指向的链接地址
	 */
	private String toUrl;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 修改时间
	 */
	private String modifyTime;
	/**
	 * 模块信息
	 */
	private Module module;
	
	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getModuleId(){
		return this.moduleId;
	}
	public void setModuleId(Integer moduleId){
		this.moduleId=moduleId;
	}
	public String getModuleCode(){
		return this.moduleCode;
	}
	public void setModuleCode(String moduleCode){
		this.moduleCode=moduleCode;
	}
	public String getModuleImgName(){
		return this.moduleImgName;
	}
	public void setModuleImgName(String moduleImgName){
		this.moduleImgName=moduleImgName;
	}
	public String getImgPath(){
		return this.imgPath;
	}
	public void setImgPath(String imgPath){
		this.imgPath=imgPath;
	}
	public String getToUrl(){
		return this.toUrl;
	}
	public void setToUrl(String toUrl){
		this.toUrl=toUrl;
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
	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("ModuleId",getModuleId())
			.append("ModuleCode",getModuleCode())
			.append("ModuleImgName",getModuleImgName())
			.append("ImgPath",getImgPath())
			.append("ToUrl",getToUrl())
			.append("CreateTime",getCreateTime())
			.append("ModifyTime",getModifyTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getModuleId())
			.append(getModuleCode())
			.append(getModuleImgName())
			.append(getImgPath())
			.append(getToUrl())
			.append(getCreateTime())
			.append(getModifyTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof ModuleImg == false) return false;
		if(this == obj) return true;
		ModuleImg other = (ModuleImg)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getModuleId(),other.getModuleId())
			.append(getModuleCode(),other.getModuleCode())
			.append(getModuleImgName(),other.getModuleImgName())
			.append(getImgPath(),other.getImgPath())
			.append(getToUrl(),other.getToUrl())
			.append(getCreateTime(),other.getCreateTime())
			.append(getModifyTime(),other.getModifyTime())
			.isEquals();
		}

}
