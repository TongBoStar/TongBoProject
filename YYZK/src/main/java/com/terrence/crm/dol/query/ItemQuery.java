package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class ItemQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 项目主键ID
	 */
	private Integer id;
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
	 * 模块编码
	 */
	private String moduleCode;
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
	
	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
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
	public String getModuleCode() {
		return moduleCode;
	}
	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
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
}
