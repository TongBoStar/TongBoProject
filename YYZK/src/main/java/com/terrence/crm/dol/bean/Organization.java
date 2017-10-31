package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Organization extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
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

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
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
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("OrgName",getOrgName())
			.append("OrgAddress",getOrgAddress())
			.append("OrgCharger",getOrgCharger())
			.append("OrgChargerTel",getOrgChargerTel())
			.append("OrgUrl",getOrgUrl())
			.append("OrgLicensePath",getOrgLicensePath())
			.append("OrgDesc",getOrgDesc())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getOrgName())
			.append(getOrgAddress())
			.append(getOrgCharger())
			.append(getOrgChargerTel())
			.append(getOrgUrl())
			.append(getOrgLicensePath())
			.append(getOrgDesc())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Organization == false) return false;
		if(this == obj) return true;
		Organization other = (Organization)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getOrgName(),other.getOrgName())
			.append(getOrgAddress(),other.getOrgAddress())
			.append(getOrgCharger(),other.getOrgCharger())
			.append(getOrgChargerTel(),other.getOrgChargerTel())
			.append(getOrgUrl(),other.getOrgUrl())
			.append(getOrgLicensePath(),other.getOrgLicensePath())
			.append(getOrgDesc(),other.getOrgDesc())
			.isEquals();
		}

}
