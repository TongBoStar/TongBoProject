package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class ActivityItem extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	/**
	 * 活动项目名称
	 */
	private String activityItemName;
	/**
	 * 开始时间
	 */
	private String startTime;
	/**
	 * 结束时间
	 */
	private String endTime;
	/**
	 * 有效期
	 */
	private String expiryDate;
	/**
	 * 商家名称
	 */
	private Integer orgId;
	/**
	 * 现价
	 */
	private Integer priceAux;
	/**
	 * 原价
	 */
	private Integer pricePlan;
	/**
	 * 领取地点
	 */
	private String takeAddress;
	/**
	 * 活动规则
	 */
	private String activityRole;
	/**
	 * 活动说明
	 */
	private String activityDesc;
	/**
	 * 活动类型
	 */
	private Integer activityType;
	/**
	 * 人数限制
	 */
	private Integer userLimit;
	/**
	 * 单人次数限制
	 */
	private Integer timesLimit;
	/**
	 * 总单数限制
	 */
	private Integer orderLimit;
	/**
	 * 活动状态
	 */
	private Integer activityItemStatus;
	/**
	 * 支付方式 1微信支付 2到店支付
	 */
	private Integer payType;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 修改时间
	 */
	private String modifyTime;
	/**
	 * 商家信息
	 */
	private Organization organization;
	
	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public String getActivityItemName(){
		return this.activityItemName;
	}
	public void setActivityItemName(String activityItemName){
		this.activityItemName=activityItemName;
	}
	public String getStartTime(){
		return this.startTime;
	}
	public void setStartTime(String startTime){
		this.startTime=startTime;
	}
	public String getEndTime(){
		return this.endTime;
	}
	public void setEndTime(String endTime){
		this.endTime=endTime;
	}
	public String getExpiryDate(){
		return this.expiryDate;
	}
	public void setExpiryDate(String expiryDate){
		this.expiryDate=expiryDate;
	}
	public Integer getOrgId(){
		return this.orgId;
	}
	public void setOrgId(Integer orgId){
		this.orgId=orgId;
	}
	public Integer getPriceAux(){
		return this.priceAux;
	}
	public void setPriceAux(Integer priceAux){
		this.priceAux=priceAux;
	}
	public Integer getPricePlan(){
		return this.pricePlan;
	}
	public void setPricePlan(Integer pricePlan){
		this.pricePlan=pricePlan;
	}
	public String getTakeAddress(){
		return this.takeAddress;
	}
	public void setTakeAddress(String takeAddress){
		this.takeAddress=takeAddress;
	}
	public String getActivityRole(){
		return this.activityRole;
	}
	public void setActivityRole(String activityRole){
		this.activityRole=activityRole;
	}
	public String getActivityDesc(){
		return this.activityDesc;
	}
	public void setActivityDesc(String activityDesc){
		this.activityDesc=activityDesc;
	}
	public Integer getActivityType(){
		return this.activityType;
	}
	public void setActivityType(Integer activityType){
		this.activityType=activityType;
	}
	public Integer getUserLimit(){
		return this.userLimit;
	}
	public void setUserLimit(Integer userLimit){
		this.userLimit=userLimit;
	}
	public Integer getTimesLimit(){
		return this.timesLimit;
	}
	public void setTimesLimit(Integer timesLimit){
		this.timesLimit=timesLimit;
	}
	public Integer getOrderLimit(){
		return this.orderLimit;
	}
	public void setOrderLimit(Integer orderLimit){
		this.orderLimit=orderLimit;
	}
	public Integer getActivityItemStatus(){
		return this.activityItemStatus;
	}
	public void setActivityItemStatus(Integer activityItemStatus){
		this.activityItemStatus=activityItemStatus;
	}
	public Integer getPayType(){
		return this.payType;
	}
	public void setPayType(Integer payType){
		this.payType=payType;
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
	public Organization getOrganization() {
		return organization;
	}
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("ActivityItemName",getActivityItemName())
			.append("StartTime",getStartTime())
			.append("EndTime",getEndTime())
			.append("ExpiryDate",getExpiryDate())
			.append("OrgId",getOrgId())
			.append("PriceAux",getPriceAux())
			.append("PricePlan",getPricePlan())
			.append("TakeAddress",getTakeAddress())
			.append("ActivityRole",getActivityRole())
			.append("ActivityDesc",getActivityDesc())
			.append("ActivityType",getActivityType())
			.append("UserLimit",getUserLimit())
			.append("TimesLimit",getTimesLimit())
			.append("OrderLimit",getOrderLimit())
			.append("ActivityItemStatus",getActivityItemStatus())
			.append("PayType",getPayType())
			.append("CreateTime",getCreateTime())
			.append("ModifyTime",getModifyTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getActivityItemName())
			.append(getStartTime())
			.append(getEndTime())
			.append(getExpiryDate())
			.append(getOrgId())
			.append(getPriceAux())
			.append(getPricePlan())
			.append(getTakeAddress())
			.append(getActivityRole())
			.append(getActivityDesc())
			.append(getActivityType())
			.append(getUserLimit())
			.append(getTimesLimit())
			.append(getOrderLimit())
			.append(getActivityItemStatus())
			.append(getPayType())
			.append(getCreateTime())
			.append(getModifyTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof ActivityItem == false) return false;
		if(this == obj) return true;
		ActivityItem other = (ActivityItem)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getActivityItemName(),other.getActivityItemName())
			.append(getStartTime(),other.getStartTime())
			.append(getEndTime(),other.getEndTime())
			.append(getExpiryDate(),other.getExpiryDate())
			.append(getOrgId(),other.getOrgId())
			.append(getPriceAux(),other.getPriceAux())
			.append(getPricePlan(),other.getPricePlan())
			.append(getTakeAddress(),other.getTakeAddress())
			.append(getActivityRole(),other.getActivityRole())
			.append(getActivityDesc(),other.getActivityDesc())
			.append(getActivityType(),other.getActivityType())
			.append(getUserLimit(),other.getUserLimit())
			.append(getTimesLimit(),other.getTimesLimit())
			.append(getOrderLimit(),other.getOrderLimit())
			.append(getActivityItemStatus(),other.getActivityItemStatus())
			.append(getPayType(),other.getPayType())
			.append(getCreateTime(),other.getCreateTime())
			.append(getModifyTime(),other.getModifyTime())
			.isEquals();
		}

}
