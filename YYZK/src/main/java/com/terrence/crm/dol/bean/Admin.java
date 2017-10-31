/*
 * 
 */
package com.terrence.crm.dol.bean;

import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.google.common.collect.Lists;
import com.terrence.core.dol.bean.Menu;
import com.terrence.core.dol.bean.MenuOperate;
import com.terrence.core.dol.bean.Role;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.base.utils.ConvertUtils;
import com.terrence.crm.dol.bean.Authority;
/**
 * 管理员基础类
 * 
 * @version 1.0
 */
@Entity
public class Admin extends BaseEntity implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -47654182622843436L;
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * adminId       db_column: adminId 
     */	
	@Id
	private java.lang.Long adminId;
    /**
     * loginName       db_column: loginName 
     */	
	private java.lang.String loginName;
    /**
     * password       db_column: password 
     */	
	private java.lang.String password;
    /**
     * createdTime       db_column: createdTime 
     */	
	private String createdTime;
    /**
     * modifiedTime       db_column: modifiedTime 
     */	
	private String modifiedTime;
    /**
     * 0 正常              1 锁定       db_column: status 
     */	
	private java.lang.Integer status;
	private java.lang.Integer type;
	private java.lang.String email;
	private Long orgId;
	private String telNumber;
	private String idCard;
	private Integer idType;
	private String wxCode;
	private String headerUrl;
	private Integer stars;
	private Integer orders;
	private Double avprice;
	private Integer sex;
	private String country;
	private String province;
	private String city;
	private String area;
	/**
	 * 守时评分
	 */
	private Float timeScore;
	/**
	 * 技能评分
	 */
	private Float artScore;
	/**
	 * 服务评分
	 */
	private Float serviceScore;
	/**
	 * 技能模块
	 */
	private String moduleCode;
	/**
	 * 所属机构
	 */
	private Organization organization;
	/**
	 * 用户编号
	 */
	private String adminCode;
	
	private List<Menu> authorityList = Lists.newArrayList();
	private List<MenuOperate> menuOperateList = Lists.newArrayList();//操作按钮控制
	private List<Authority> authorityListTrue = Lists.newArrayList();
	private String adminName;
	private String lastLoginTime;
	private List<Long> roleIdList = Lists.newArrayList();
	private List<Role> roleList = Lists.newArrayList();
	private List<Map<String, Object>> rolesTreeList = Lists.newArrayList();
	//columns END
	/**
	 * 图片JSON
	 */
	private String filesJson;
	private String zfbCode;//支付宝账号
	private String ylCard;//银联卡号
	private String ylCardType;//银联卡类型即所属银行
	private String wxCard ;//微信账号
	private String fremark;//审核理由
	private String examineTime;//审核时间
	private Integer isdel;//是否删除
	private Integer issaleagree;//是否同意了销售协议
	private Long upUserId;//上级业务员ID
	private String upUserName;//上级业务员ID
	private String saleagreeTime;//销售协议签订时间
	public Admin(){
	}

	public Admin( java.lang.Long adminId ){
		this.adminId = adminId;
	}

	public void setAdminId(java.lang.Long value) {
		this.adminId = value;
	}
	
	public java.lang.Long getAdminId() {
		return this.adminId;
	}
	public void setLoginName(java.lang.String value) {
		this.loginName = value;
	}
	
	public java.lang.String getLoginName() {
		return this.loginName;
	}
	public void setPassword(java.lang.String value) {
		this.password = value;
	}
	
	public java.lang.String getPassword() {
		return this.password;
	}
	
	
	public void setCreatedTime(String value) {
		this.createdTime = value;
	}
	
	public String getCreatedTime() {
		return this.createdTime;
	}
	
	public void setModifiedTime(String value) {
		this.modifiedTime = value;
	}
	
	public String getModifiedTime() {
		return this.modifiedTime;
	}
	public void setStatus(java.lang.Integer value) {
		this.status = value;
	}
	
	public java.lang.Integer getStatus() {
		return this.status;
	}
	
	private List<AdminRole> adminRoles = Lists.newArrayList();
	public void setAdminRoles(List<AdminRole> adminRole){
		this.adminRoles = adminRole;
	}
	
	public List<AdminRole> getAdminRoles() {
		return adminRoles;
	}

	public List<Map<String, Object>> getRolesTreeList() {
		return rolesTreeList;
	}

	public void setRolesTreeList(List<Map<String, Object>> rolesTreeList) {
		this.rolesTreeList = rolesTreeList;
	}

	public Float getTimeScore() {
		return timeScore;
	}

	public void setTimeScore(Float timeScore) {
		this.timeScore = timeScore;
	}

	public Float getArtScore() {
		return artScore;
	}

	public void setArtScore(Float artScore) {
		this.artScore = artScore;
	}

	public Float getServiceScore() {
		return serviceScore;
	}

	public void setServiceScore(Float serviceScore) {
		this.serviceScore = serviceScore;
	}

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("AdminId",getAdminId())
			.append("LoginName",getLoginName())
			.append("Password",getPassword())
			.append("CreatedTime",getCreatedTime())
			.append("ModifiedTime",getModifiedTime())
			.append("Status",getStatus())
			.append("adminName",getStatus())
			.append("lastLoginTime",getStatus())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getAdminId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Admin == false) return false;
		if(this == obj) return true;
		Admin other = (Admin)obj;
		return new EqualsBuilder()
			.append(getAdminId(),other.getAdminId())
			.isEquals();
	}
	
	@Transient
	public String getRoleIds() {
		return ConvertUtils.convertElementPropertyToString(adminRoles, "roleId", ", ");
	}
	
	

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public void setRoleIdList(List<Long> roleIdList) {
		this.roleIdList = roleIdList;
	}

	public List<Long> getRoleIdList() {
		return roleIdList;
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public String getRoleNames() {
		return ConvertUtils.convertElementPropertyToString(roleList, "roleName", ", ");
	}

	public java.lang.Integer getType() {
		return type;
	}

	public void setType(java.lang.Integer type) {
		this.type = type;
	}

	public java.lang.String getEmail() {
		return email;
	}

	public void setEmail(java.lang.String email) {
		this.email = email;
	}

	public List<Menu> getAuthorityList() {
		return authorityList;
	}

	public void setAuthorityList(List<Menu> authorityList) {
		this.authorityList = authorityList;
	}

	public List<MenuOperate> getMenuOperateList() {
		return menuOperateList;
	}

	public void setMenuOperateList(List<MenuOperate> menuOperateList) {
		this.menuOperateList = menuOperateList;
	}

	public List<Authority> getAuthorityListTrue() {
		return authorityListTrue;
	}

	public void setAuthorityListTrue(List<Authority> authorityListTrue) {
		this.authorityListTrue = authorityListTrue;
	}

	public Long getOrgId() {
		return orgId;
	}

	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}

	public String getTelNumber() {
		return telNumber;
	}

	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public Integer getIdType() {
		return idType;
	}

	public void setIdType(Integer idType) {
		this.idType = idType;
	}

	public String getWxCode() {
		return wxCode;
	}

	public void setWxCode(String wxCode) {
		this.wxCode = wxCode;
	}

	public String getHeaderUrl() {
		return headerUrl;
	}

	public void setHeaderUrl(String headerUrl) {
		this.headerUrl = headerUrl;
	}

	public Integer getStars() {
		return stars;
	}

	public void setStars(Integer stars) {
		this.stars = stars;
	}

	public Integer getOrders() {
		return orders;
	}

	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	public Double getAvprice() {
		return avprice;
	}

	public void setAvprice(Double avprice) {
		this.avprice = avprice;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public String getFilesJson() {
		return filesJson;
	}

	public void setFilesJson(String filesJson) {
		this.filesJson = filesJson;
	}

	public String getAdminCode() {
		return adminCode;
	}

	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
	}

	public String getZfbCode() {
		return zfbCode;
	}

	public void setZfbCode(String zfbCode) {
		this.zfbCode = zfbCode;
	}

	public String getYlCard() {
		return ylCard;
	}

	public void setYlCard(String ylCard) {
		this.ylCard = ylCard;
	}

	public String getYlCardType() {
		return ylCardType;
	}

	public void setYlCardType(String ylCardType) {
		this.ylCardType = ylCardType;
	}

	public String getWxCard() {
		return wxCard;
	}

	public void setWxCard(String wxCard) {
		this.wxCard = wxCard;
	}

	public String getFremark() {
		return fremark;
	}

	public void setFremark(String fremark) {
		this.fremark = fremark;
	}

	public String getExamineTime() {
		return examineTime;
	}

	public void setExamineTime(String examineTime) {
		this.examineTime = examineTime;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	public Integer getIssaleagree() {
		return issaleagree;
	}

	public void setIssaleagree(Integer issaleagree) {
		this.issaleagree = issaleagree;
	}

	public Long getUpUserId() {
		return upUserId;
	}

	public void setUpUserId(Long upUserId) {
		this.upUserId = upUserId;
	}

	public String getUpUserName() {
		return upUserName;
	}

	public void setUpUserName(String upUserName) {
		this.upUserName = upUserName;
	}

	public String getSaleagreeTime() {
		return saleagreeTime;
	}

	public void setSaleagreeTime(String saleagreeTime) {
		this.saleagreeTime = saleagreeTime;
	}
}
