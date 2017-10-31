/*
 * 
 */
package com.terrence.crm.dol.query;
import java.io.Serializable;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.terrence.crm.dol.base.BaseQuery;
/**
 * 管理员查询类
 * @version 1.0
 */
public class AdminQuery extends BaseQuery implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3664899496765192490L;
	/** adminId */
	private java.lang.Long adminId;
	/** loginName */
	private java.lang.String loginName;
	/** password */
	private java.lang.String password;
	/** createdTime */
	private java.util.Date createdTimeBegin;
	private java.util.Date createdTimeEnd;
	/** modifiedTime */
	private java.util.Date modifiedTimeBegin;
	private java.util.Date modifiedTimeEnd;
	private java.util.Date lastLoginTimeBegin;
	private java.util.Date lastLoginTimeEnd;
	/** 0 正常              1 锁定 */
	private java.lang.Integer status;
	private java.lang.Integer type;
	private String adminName;
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
	 * 用户编号
	 */
	private String adminCode;
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
	public java.lang.Long getAdminId() {
		return this.adminId;
	}
	
	public void setAdminId(java.lang.Long value) {
		this.adminId = value;
	}

	public java.lang.String getLoginName() {
		return this.loginName;
	}
	
	public void setLoginName(java.lang.String value) {
		this.loginName = value;
	}
	
	public java.lang.String getPassword() {
		return this.password;
	}

	public java.lang.Integer getType() {
		return type;
	}

	public void setType(java.lang.Integer type) {
		this.type = type;
	}

	public void setPassword(java.lang.String value) {
		this.password = value;
	}
	
	public java.util.Date getCreatedTimeBegin() {
		return this.createdTimeBegin;
	}
	
	public void setCreatedTimeBegin(java.util.Date value) {
		this.createdTimeBegin = value;
	}	
	
	public java.util.Date getCreatedTimeEnd() {
		return this.createdTimeEnd;
	}
	
	public void setCreatedTimeEnd(java.util.Date value) {
		this.createdTimeEnd = value;
	}
	
	public java.util.Date getModifiedTimeBegin() {
		return this.modifiedTimeBegin;
	}
	
	public void setModifiedTimeBegin(java.util.Date value) {
		this.modifiedTimeBegin = value;
	}	
	
	public java.util.Date getModifiedTimeEnd() {
		return this.modifiedTimeEnd;
	}
	
	public void setModifiedTimeEnd(java.util.Date value) {
		this.modifiedTimeEnd = value;
	}
	
	public java.lang.Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(java.lang.Integer value) {
		this.status = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public java.util.Date getLastLoginTimeBegin() {
		return lastLoginTimeBegin;
	}

	public void setLastLoginTimeBegin(java.util.Date lastLoginTimeBegin) {
		this.lastLoginTimeBegin = lastLoginTimeBegin;
	}

	public java.util.Date getLastLoginTimeEnd() {
		return lastLoginTimeEnd;
	}

	public void setLastLoginTimeEnd(java.util.Date lastLoginTimeEnd) {
		this.lastLoginTimeEnd = lastLoginTimeEnd;
	}

	public java.lang.String getEmail() {
		return email;
	}

	public void setEmail(java.lang.String email) {
		this.email = email;
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

