package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class ActivityInfoQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 活动名称
	 */
	private String activityName;
	/**
	 * 活动类型1打折2立减3立变4新人专享5秒杀6抽奖7组团
	 */
	private Integer activityType;
	/**
	 * 活动开始时间
	 */
	private String startTime;
	/**
	 * 活动结束时间
	 */
	private String endTime;
	/**
	 * 活动价格，1折扣率2立减金额3立变金额4专享价5秒杀价6空7空
	 */
	private Integer activityPrice;
	/**
	 * 单数限制
	 */
	private Integer orderLimit;
	/**
	 * 人数限制12345不限制，6:10 7:3
	 */
	private Integer userLimit;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 修改时间
	 */
	private String modifyTime;
	/**
	 * 有效期
	 */
	private String expiryDate;
	
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getActivityName(){
		return this.activityName;
	}
	public void setActivityName(String activityName){
		this.activityName=activityName;
	}
	public Integer getActivityType(){
		return this.activityType;
	}
	public void setActivityType(Integer activityType){
		this.activityType=activityType;
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
	public Integer getActivityPrice(){
		return this.activityPrice;
	}
	public void setActivityPrice(Integer activityPrice){
		this.activityPrice=activityPrice;
	}
	public Integer getOrderLimit(){
		return this.orderLimit;
	}
	public void setOrderLimit(Integer orderLimit){
		this.orderLimit=orderLimit;
	}
	public Integer getUserLimit(){
		return this.userLimit;
	}
	public void setUserLimit(Integer userLimit){
		this.userLimit=userLimit;
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
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

}
