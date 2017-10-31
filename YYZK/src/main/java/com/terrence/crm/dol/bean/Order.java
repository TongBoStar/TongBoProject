package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;

@Entity
public class Order extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 订单编号
	 */
	private String orderCode;
	/**
	 * 项目ID
	 */
	private Integer itemId;
	/**
	 * 微信中的产品ID
	 */
	private String wxProductId;
	/**
	 * 服务形式：1上门 2到店
	 */
	private Integer serviceType;
	/**
	 * 服务地址
	 */
	private String serviceAddress;
	/**
	 * 下单用户的ID
	 */
	private Integer userId;
	/**
	 * 用户手机号码
	 */
	private String userTel;
	/**
	 * 预约时间
	 */
	private String fixTime;
	/**
	 * 下单时间
	 */
	private String createTime;
	/**
	 * 支付时间
	 */
	private String payTime;
	/**
	 * 订单状态：1待支付2待服务3完成4待评价5售后
	 */
	private Integer orderStatus;
	/**
	 * 修改时间
	 */
	private String modifyTime;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 接收服务的人的名称
	 */
	private String serviceReceiver;
	/**
	 * 项目信息
	 */
	private Item item;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getOrderCode(){
		return this.orderCode;
	}
	public void setOrderCode(String orderCode){
		this.orderCode=orderCode;
	}
	public Integer getItemId(){
		return this.itemId;
	}
	public void setItemId(Integer itemId){
		this.itemId=itemId;
	}
	public Integer getServiceType(){
		return this.serviceType;
	}
	public void setServiceType(Integer serviceType){
		this.serviceType=serviceType;
	}
	public String getServiceAddress(){
		return this.serviceAddress;
	}
	public void setServiceAddress(String serviceAddress){
		this.serviceAddress=serviceAddress;
	}
	public Integer getUserId(){
		return this.userId;
	}
	public void setUserId(Integer userId){
		this.userId=userId;
	}
	public String getUserTel(){
		return this.userTel;
	}
	public void setUserTel(String userTel){
		this.userTel=userTel;
	}
	public String getFixTime(){
		return this.fixTime;
	}
	public void setFixTime(String fixTime){
		this.fixTime=fixTime;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public String getPayTime(){
		return this.payTime;
	}
	public void setPayTime(String payTime){
		this.payTime=payTime;
	}
	public Integer getOrderStatus(){
		return this.orderStatus;
	}
	public void setOrderStatus(Integer orderStatus){
		this.orderStatus=orderStatus;
	}
	public String getModifyTime(){
		return this.modifyTime;
	}
	public void setModifyTime(String modifyTime){
		this.modifyTime=modifyTime;
	}
	public String getRemark(){
		return this.remark;
	}
	public void setRemark(String remark){
		this.remark=remark;
	}
	public String getServiceReceiver(){
		return this.serviceReceiver;
	}
	public void setServiceReceiver(String serviceReceiver){
		this.serviceReceiver=serviceReceiver;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
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
			.append("OrderCode",getOrderCode())
			.append("ItemId",getItemId())
			.append("ServiceType",getServiceType())
			.append("ServiceAddress",getServiceAddress())
			.append("UserId",getUserId())
			.append("UserTel",getUserTel())
			.append("FixTime",getFixTime())
			.append("CreateTime",getCreateTime())
			.append("PayTime",getPayTime())
			.append("OrderStatus",getOrderStatus())
			.append("ModifyTime",getModifyTime())
			.append("Remark",getRemark())
			.append("ServiceReceiver",getServiceReceiver())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getOrderCode())
			.append(getItemId())
			.append(getServiceType())
			.append(getServiceAddress())
			.append(getUserId())
			.append(getUserTel())
			.append(getFixTime())
			.append(getCreateTime())
			.append(getPayTime())
			.append(getOrderStatus())
			.append(getModifyTime())
			.append(getRemark())
			.append(getServiceReceiver())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Order == false) return false;
		if(this == obj) return true;
		Order other = (Order)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getOrderCode(),other.getOrderCode())
			.append(getItemId(),other.getItemId())
			.append(getServiceType(),other.getServiceType())
			.append(getServiceAddress(),other.getServiceAddress())
			.append(getUserId(),other.getUserId())
			.append(getUserTel(),other.getUserTel())
			.append(getFixTime(),other.getFixTime())
			.append(getCreateTime(),other.getCreateTime())
			.append(getPayTime(),other.getPayTime())
			.append(getOrderStatus(),other.getOrderStatus())
			.append(getModifyTime(),other.getModifyTime())
			.append(getRemark(),other.getRemark())
			.append(getServiceReceiver(),other.getServiceReceiver())
			.isEquals();
		}

}
