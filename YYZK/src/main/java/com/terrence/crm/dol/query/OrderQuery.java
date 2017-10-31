package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class OrderQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	/**
	 * 订单编号
	 */
	private String orderCode;
	/**
	 * 项目ID
	 */
	private Integer itemId;
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
	 * 微信中的产品ID
	 */
	private String wxProductId;
	
	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
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
	public String getWxProductId() {
		return wxProductId;
	}
	public void setWxProductId(String wxProductId) {
		this.wxProductId = wxProductId;
	}

}
