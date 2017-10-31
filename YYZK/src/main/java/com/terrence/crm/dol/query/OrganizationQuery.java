package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class OrganizationQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	/**
	 * 机构名称
	 */
	private String orgName;
	/**
	 * 机构地址
	 */
	private String orgAddress;
	/**
	 * 机构负责人
	 */
	private String orgCharger;
	/**
	 * 机构负责人电话
	 */
	private String orgChargerTel;
	/**
	 * 机构网址
	 */
	private String orgUrl;
	/**
	 * 机构营业证书路径
	 */
	private String orgLicensePath;
	/**
	 * 机构描述
	 */
	private String orgDesc;

	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public String getOrgName(){
		return this.orgName;
	}
	public void setOrgName(String orgName){
		this.orgName=orgName;
	}
	public String getOrgAddress(){
		return this.orgAddress;
	}
	public void setOrgAddress(String orgAddress){
		this.orgAddress=orgAddress;
	}
	public String getOrgCharger(){
		return this.orgCharger;
	}
	public void setOrgCharger(String orgCharger){
		this.orgCharger=orgCharger;
	}
	public String getOrgChargerTel(){
		return this.orgChargerTel;
	}
	public void setOrgChargerTel(String orgChargerTel){
		this.orgChargerTel=orgChargerTel;
	}
	public String getOrgUrl(){
		return this.orgUrl;
	}
	public void setOrgUrl(String orgUrl){
		this.orgUrl=orgUrl;
	}
	public String getOrgLicensePath(){
		return this.orgLicensePath;
	}
	public void setOrgLicensePath(String orgLicensePath){
		this.orgLicensePath=orgLicensePath;
	}
	public String getOrgDesc(){
		return this.orgDesc;
	}
	public void setOrgDesc(String orgDesc){
		this.orgDesc=orgDesc;
	}

}
