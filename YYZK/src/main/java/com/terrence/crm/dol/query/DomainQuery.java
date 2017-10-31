package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class DomainQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	/**
	 * 领域名称
	 */
	private String domainName;
	/**
	 * 领域图标
	 */
	private String domainIcon;
	/**
	 * 领域序号
	 */
	private Integer domainNo;
	/**
	 * 领域标识符
	 */
	private String domainCode;
	/**
	 * 领域级别
	 */
	private Integer domainLevel;
	/**
	 * 领域描述
	 */
	private String domainDesc;

	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public String getDomainName(){
		return this.domainName;
	}
	public void setDomainName(String domainName){
		this.domainName=domainName;
	}
	public String getDomainIcon(){
		return this.domainIcon;
	}
	public void setDomainIcon(String domainIcon){
		this.domainIcon=domainIcon;
	}
	public Integer getDomainNo(){
		return this.domainNo;
	}
	public void setDomainNo(Integer domainNo){
		this.domainNo=domainNo;
	}
	public String getDomainCode(){
		return this.domainCode;
	}
	public void setDomainCode(String domainCode){
		this.domainCode=domainCode;
	}
	public Integer getDomainLevel(){
		return this.domainLevel;
	}
	public void setDomainLevel(Integer domainLevel){
		this.domainLevel=domainLevel;
	}
	public String getDomainDesc(){
		return this.domainDesc;
	}
	public void setDomainDesc(String domainDesc){
		this.domainDesc=domainDesc;
	}

}
