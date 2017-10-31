package com.terrence.crm.dol.bean;
import java.util.List;

import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;

@Entity
public class Item extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 项目主键ID
	 */
	private Long id;
	/**
	 * 项目名称
	 */
	private String itemName;
	/**
	 * 手艺人ID
	 */
	private Long itemUserId;
	/**
	 * 项目现在的单价
	 */
	private Integer itemPriceAux;
	/**
	 * 项目原价
	 */
	private Integer itemPricePlan;
	/**
	 * 项目计算单位
	 */
	private String itemUnit;
	/**
	 * 所需时长
	 */
	private Integer consumTimes;
	/**
	 * 服务形式 1上门 2到店
	 */
	private Integer serviceType;
	/**
	 * 项目归属模块
	 */
	private Integer moduleId;
	/**
	 * 项目简介
	 */
	private String itemDesc;
	/**
	 * 交费方式 1线上付款2线下付款
	 */
	private Integer feeType;
	/**
	 * 活动类型
	 */
	private Integer activityId;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 修改时间
	 */
	private String modifyTime;
	/**
	 * 手艺人信息
	 */
	private Admin admin;
	/**
	 * 模块信息
	 */
	private Module module;
	/**
	 * 活动信息
	 */
	private ActivityInfo activityInfo;
	/**
	 * 项目图片信息
	 */
	private List<ItemImgs> itemImgs;
	/**
	 * 项目步骤信息
	 */
	private List<ItemStep> itemSteps;
	/**
	 * 手艺人名称
	 */
	private String itemUserName;
	/**
	 * 收藏数
	 */
	private Long loves;
	/**
	 * 评论数
	 */
	private Long comments;
	/**
	 * 下单数
	 */
	private Long orders;
	/**
	 * 首页图片
	 */
	private String indexImg;
	/**
	 * 保持时间
	 */
	private Integer keepTimes;
	/**
	 * 科目代号
	 */
	private String subjectCode;
	/**
	 * 微信中的产品ID
	 */
	private String wxProductId;
	
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getItemName(){
		return this.itemName;
	}
	public void setItemName(String itemName){
		this.itemName=itemName;
	}
	public Long getItemUserId(){
		return this.itemUserId;
	}
	public void setItemUserId(Long itemUserId){
		this.itemUserId=itemUserId;
	}
	public Integer getItemPriceAux(){
		return this.itemPriceAux;
	}
	public void setItemPriceAux(Integer itemPriceAux){
		this.itemPriceAux=itemPriceAux;
	}
	public Integer getItemPricePlan(){
		return this.itemPricePlan;
	}
	public void setItemPricePlan(Integer itemPricePlan){
		this.itemPricePlan=itemPricePlan;
	}
	public String getItemUnit(){
		return this.itemUnit;
	}
	public void setItemUnit(String itemUnit){
		this.itemUnit=itemUnit;
	}
	public Integer getConsumTimes(){
		return this.consumTimes;
	}
	public void setConsumTimes(Integer consumTimes){
		this.consumTimes=consumTimes;
	}
	public Integer getServiceType(){
		return this.serviceType;
	}
	public void setServiceType(Integer serviceType){
		this.serviceType=serviceType;
	}
	public Integer getModuleId(){
		return this.moduleId;
	}
	public void setModuleId(Integer moduleId){
		this.moduleId=moduleId;
	}
	public String getItemDesc(){
		return this.itemDesc;
	}
	public void setItemDesc(String itemDesc){
		this.itemDesc=itemDesc;
	}
	public Integer getFeeType(){
		return this.feeType;
	}
	public void setFeeType(Integer feeType){
		this.feeType=feeType;
	}
	public Integer getActivityId(){
		return this.activityId;
	}
	public void setActivityId(Integer activityId){
		this.activityId=activityId;
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
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
	}
	public ActivityInfo getActivityInfo() {
		return activityInfo;
	}
	public void setActivityInfo(ActivityInfo activityInfo) {
		this.activityInfo = activityInfo;
	}
	public List<ItemImgs> getItemImgs() {
		return itemImgs;
	}
	public void setItemImgs(List<ItemImgs> itemImgs) {
		this.itemImgs = itemImgs;
	}
	public List<ItemStep> getItemSteps() {
		return itemSteps;
	}
	public void setItemSteps(List<ItemStep> itemSteps) {
		this.itemSteps = itemSteps;
	}
	public String getItemUserName() {
		return itemUserName;
	}
	public void setItemUserName(String itemUserName) {
		this.itemUserName = itemUserName;
	}
	public Long getLoves() {
		return loves;
	}
	public void setLoves(Long loves) {
		this.loves = loves;
	}
	public Long getComments() {
		return comments;
	}
	public void setComments(Long comments) {
		this.comments = comments;
	}
	public Long getOrders() {
		return orders;
	}
	public void setOrders(Long orders) {
		this.orders = orders;
	}
	public String getIndexImg() {
		return indexImg;
	}
	public void setIndexImg(String indexImg) {
		this.indexImg = indexImg;
	}
	public Integer getKeepTimes() {
		return keepTimes;
	}
	public void setKeepTimes(Integer keepTimes) {
		this.keepTimes = keepTimes;
	}
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getWxProductId() {
		return wxProductId;
	}
	public void setWxProductId(String wxProductId) {
		this.wxProductId = wxProductId;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("ItemName",getItemName())
			.append("ItemUserId",getItemUserId())
			.append("ItemPriceAux",getItemPriceAux())
			.append("ItemPricePlan",getItemPricePlan())
			.append("ItemUnit",getItemUnit())
			.append("ConsumTimes",getConsumTimes())
			.append("ServiceType",getServiceType())
			.append("ModuleId",getModuleId())
			.append("ItemDesc",getItemDesc())
			.append("FeeType",getFeeType())
			.append("ActivityId",getActivityId())
			.append("CreateTime",getCreateTime())
			.append("ModifyTime",getModifyTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getItemName())
			.append(getItemUserId())
			.append(getItemPriceAux())
			.append(getItemPricePlan())
			.append(getItemUnit())
			.append(getConsumTimes())
			.append(getServiceType())
			.append(getModuleId())
			.append(getItemDesc())
			.append(getFeeType())
			.append(getActivityId())
			.append(getCreateTime())
			.append(getModifyTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Item == false) return false;
		if(this == obj) return true;
		Item other = (Item)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getItemName(),other.getItemName())
			.append(getItemUserId(),other.getItemUserId())
			.append(getItemPriceAux(),other.getItemPriceAux())
			.append(getItemPricePlan(),other.getItemPricePlan())
			.append(getItemUnit(),other.getItemUnit())
			.append(getConsumTimes(),other.getConsumTimes())
			.append(getServiceType(),other.getServiceType())
			.append(getModuleId(),other.getModuleId())
			.append(getItemDesc(),other.getItemDesc())
			.append(getFeeType(),other.getFeeType())
			.append(getActivityId(),other.getActivityId())
			.append(getCreateTime(),other.getCreateTime())
			.append(getModifyTime(),other.getModifyTime())
			.isEquals();
		}

}
