package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class ModuleImgQuery extends BaseQuery implements java.io.Serializable {
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

}
