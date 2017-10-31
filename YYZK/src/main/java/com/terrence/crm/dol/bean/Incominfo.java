package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Incominfo extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键标识
	 */
	private Long id;
	/**
	 * 云趣成员ID
	 */
	private Long adminId;
	/**
	 * 下单人微信号
	 */
	private String orderWxCode;
	/**
	 * 云趣成员编号
	 */
	private String adminCode;
	/**
	 * 书童序列号
	 */
	private String stseqCode;
	/**
	 * 归属人ID
	 */
	private Long belongUserId;
	/**
	 * 归属人名称
	 */
	private String belongUserName;
	/**
	 * 成员级别
	 */
	private Integer flevel;
	/**
	 * 订单编号
	 */
	private String orderCode;
	/**
	 * 下单时间
	 */
	private String orderTime;
	/**
	 * 下单人
	 */
	private String orderUser;
	/**
	 * 订单状态 1进行中 2无效 3完成
	 */
	private Integer orderStatus;
	/**
	 * 订单金额
	 */
	private Float orderAmount;
	/**
	 * 客户满意度
	 */
	private Float customStatis;
	/**
	 * 签收日期
	 */
	private String receiptDate;
	/**
	 * 积分
	 */
	private Float fscore;
	/**
	 * 固定奖励
	 */
	private Float fixAwards;
	/**
	 * 客户满意奖励
	 */
	private Float customAwards;
	/**
	 * 一级推荐奖励
	 */
	private Float firstAwards;
	/**
	 * 二级推荐奖励
	 */
	private Float secondAwards;
	/**
	 * 累计收益
	 */
	private Float totalAmount;
	/**
	 * 已提现金额
	 */
	private Float hadCashAmount;
	/**
	 * 待提现金额
	 */
	private Float waitCashAmount;
	/**
	 * 可提现金额
	 */
	private Float canCashAmount;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 上级人云趣编号
	 */
	private String upAdminCode;
	/**
	 * 订单来源 1淘宝 2微信商城 3京东 4 其他
	 */
	private Integer orderSource;
	/**
	 * 单据来源 1一级销售人 2下级分成
	 */
	private Integer incomSource;
	
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public Long getAdminId(){
		return this.adminId;
	}
	public void setAdminId(Long adminId){
		this.adminId=adminId;
	}
	public String getAdminCode(){
		return this.adminCode;
	}
	public void setAdminCode(String adminCode){
		this.adminCode=adminCode;
	}
	public String getStseqCode(){
		return this.stseqCode;
	}
	public void setStseqCode(String stseqCode){
		this.stseqCode=stseqCode;
	}
	public Long getBelongUserId(){
		return this.belongUserId;
	}
	public void setBelongUserId(Long belongUserId){
		this.belongUserId=belongUserId;
	}
	public String getBelongUserName(){
		return this.belongUserName;
	}
	public void setBelongUserName(String belongUserName){
		this.belongUserName=belongUserName;
	}
	public Integer getFlevel(){
		return this.flevel;
	}
	public void setFlevel(Integer flevel){
		this.flevel=flevel;
	}
	public String getOrderCode(){
		return this.orderCode;
	}
	public void setOrderCode(String orderCode){
		this.orderCode=orderCode;
	}
	public String getOrderTime(){
		return this.orderTime;
	}
	public void setOrderTime(String orderTime){
		this.orderTime=orderTime;
	}
	public String getOrderUser(){
		return this.orderUser;
	}
	public void setOrderUser(String orderUser){
		this.orderUser=orderUser;
	}
	public Integer getOrderStatus(){
		return this.orderStatus;
	}
	public void setOrderStatus(Integer orderStatus){
		this.orderStatus=orderStatus;
	}
	public Float getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(Float orderAmount) {
		this.orderAmount = orderAmount;
	}
	public Float getCustomStatis() {
		return customStatis;
	}
	public void setCustomStatis(Float customStatis) {
		this.customStatis = customStatis;
	}
	public String getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}
	public Float getFscore() {
		return fscore;
	}
	public void setFscore(Float fscore) {
		this.fscore = fscore;
	}
	public Float getFixAwards() {
		return fixAwards;
	}
	public void setFixAwards(Float fixAwards) {
		this.fixAwards = fixAwards;
	}
	public Float getCustomAwards() {
		return customAwards;
	}
	public void setCustomAwards(Float customAwards) {
		this.customAwards = customAwards;
	}
	public Float getFirstAwards() {
		return firstAwards;
	}
	public void setFirstAwards(Float firstAwards) {
		this.firstAwards = firstAwards;
	}
	public Float getSecondAwards() {
		return secondAwards;
	}
	public void setSecondAwards(Float secondAwards) {
		this.secondAwards = secondAwards;
	}
	public Float getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Float totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Float getHadCashAmount() {
		return hadCashAmount;
	}
	public void setHadCashAmount(Float hadCashAmount) {
		this.hadCashAmount = hadCashAmount;
	}
	public Float getWaitCashAmount() {
		return waitCashAmount;
	}
	public void setWaitCashAmount(Float waitCashAmount) {
		this.waitCashAmount = waitCashAmount;
	}
	public Float getCanCashAmount() {
		return canCashAmount;
	}
	public void setCanCashAmount(Float canCashAmount) {
		this.canCashAmount = canCashAmount;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getOrderWxCode() {
		return orderWxCode;
	}
	public void setOrderWxCode(String orderWxCode) {
		this.orderWxCode = orderWxCode;
	}
	public String getUpAdminCode() {
		return upAdminCode;
	}
	public void setUpAdminCode(String upAdminCode) {
		this.upAdminCode = upAdminCode;
	}
	public Integer getOrderSource() {
		return orderSource;
	}
	public void setOrderSource(Integer orderSource) {
		this.orderSource = orderSource;
	}
	public Integer getIncomSource() {
		return incomSource;
	}
	public void setIncomSource(Integer incomSource) {
		this.incomSource = incomSource;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("AdminId",getAdminId())
			.append("AdminCode",getAdminCode())
			.append("StseqCode",getStseqCode())
			.append("BelongUserId",getBelongUserId())
			.append("BelongUserName",getBelongUserName())
			.append("Flevel",getFlevel())
			.append("OrderCode",getOrderCode())
			.append("OrderTime",getOrderTime())
			.append("OrderUser",getOrderUser())
			.append("OrderStatus",getOrderStatus())
			.append("OrderAmount",getOrderAmount())
			.append("CustomStatis",getCustomStatis())
			.append("ReceiptDate",getReceiptDate())
			.append("Fscore",getFscore())
			.append("FixAwards",getFixAwards())
			.append("CustomAwards",getCustomAwards())
			.append("FirstAwards",getFirstAwards())
			.append("SecondAwards",getSecondAwards())
			.append("TotalAmount",getTotalAmount())
			.append("HadCashAmount",getHadCashAmount())
			.append("WaitCashAmount",getWaitCashAmount())
			.append("CanCashAmount",getCanCashAmount())
			.append("CreateTime",getCreateTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getAdminId())
			.append(getAdminCode())
			.append(getStseqCode())
			.append(getBelongUserId())
			.append(getBelongUserName())
			.append(getFlevel())
			.append(getOrderCode())
			.append(getOrderTime())
			.append(getOrderUser())
			.append(getOrderStatus())
			.append(getOrderAmount())
			.append(getCustomStatis())
			.append(getReceiptDate())
			.append(getFscore())
			.append(getFixAwards())
			.append(getCustomAwards())
			.append(getFirstAwards())
			.append(getSecondAwards())
			.append(getTotalAmount())
			.append(getHadCashAmount())
			.append(getWaitCashAmount())
			.append(getCanCashAmount())
			.append(getCreateTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Incominfo == false) return false;
		if(this == obj) return true;
		Incominfo other = (Incominfo)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getAdminId(),other.getAdminId())
			.append(getAdminCode(),other.getAdminCode())
			.append(getStseqCode(),other.getStseqCode())
			.append(getBelongUserId(),other.getBelongUserId())
			.append(getBelongUserName(),other.getBelongUserName())
			.append(getFlevel(),other.getFlevel())
			.append(getOrderCode(),other.getOrderCode())
			.append(getOrderTime(),other.getOrderTime())
			.append(getOrderUser(),other.getOrderUser())
			.append(getOrderStatus(),other.getOrderStatus())
			.append(getOrderAmount(),other.getOrderAmount())
			.append(getCustomStatis(),other.getCustomStatis())
			.append(getReceiptDate(),other.getReceiptDate())
			.append(getFscore(),other.getFscore())
			.append(getFixAwards(),other.getFixAwards())
			.append(getCustomAwards(),other.getCustomAwards())
			.append(getFirstAwards(),other.getFirstAwards())
			.append(getSecondAwards(),other.getSecondAwards())
			.append(getTotalAmount(),other.getTotalAmount())
			.append(getHadCashAmount(),other.getHadCashAmount())
			.append(getWaitCashAmount(),other.getWaitCashAmount())
			.append(getCanCashAmount(),other.getCanCashAmount())
			.append(getCreateTime(),other.getCreateTime())
			.isEquals();
		}

}
