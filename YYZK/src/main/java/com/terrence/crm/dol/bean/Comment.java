package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;

@Entity
public class Comment extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 进行评论的用户
	 */
	private Integer userForId;
	/**
	 * 被评论的手艺人的ID
	 */
	private Integer userToId;
	/**
	 * 订单ID
	 */
	private Integer orderId;
	/**
	 * 项目ID
	 */
	private Integer itemId;
	/**
	 * 评论内容
	 */
	private String commentContent;
	/**
	 * 星级
	 */
	private Integer stars;
	/**
	 * 评论时间
	 */
	private String createTime;
	/**
	 * 修改时间
	 */
	private String modifyTime;
	/**
	 * 评价人名称
	 */
	private String userForName;
	/**
	 * 手艺人名称
	 */
	private String userToName;
	/**
	 * 订单编号
	 */
	private String orderCode;
	/**
	 * 项目信息
	 */
	private Item item;
	/**
	 * 评论图片
	 */
	private Long imgs;
	
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public Integer getUserForId(){
		return this.userForId;
	}
	public void setUserForId(Integer userForId){
		this.userForId=userForId;
	}
	public Integer getUserToId(){
		return this.userToId;
	}
	public void setUserToId(Integer userToId){
		this.userToId=userToId;
	}
	public Integer getOrderId(){
		return this.orderId;
	}
	public void setOrderId(Integer orderId){
		this.orderId=orderId;
	}
	public Integer getItemId(){
		return this.itemId;
	}
	public void setItemId(Integer itemId){
		this.itemId=itemId;
	}
	public String getCommentContent(){
		return this.commentContent;
	}
	public void setCommentContent(String commentContent){
		this.commentContent=commentContent;
	}
	public Integer getStars(){
		return this.stars;
	}
	public void setStars(Integer stars){
		this.stars=stars;
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
	public String getUserForName() {
		return userForName;
	}
	public void setUserForName(String userForName) {
		this.userForName = userForName;
	}
	public String getUserToName() {
		return userToName;
	}
	public void setUserToName(String userToName) {
		this.userToName = userToName;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public Long getImgs() {
		return imgs;
	}
	public void setImgs(Long imgs) {
		this.imgs = imgs;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("UserForId",getUserForId())
			.append("UserToId",getUserToId())
			.append("OrderId",getOrderId())
			.append("ItemId",getItemId())
			.append("CommentContent",getCommentContent())
			.append("Stars",getStars())
			.append("CreateTime",getCreateTime())
			.append("ModifyTime",getModifyTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getUserForId())
			.append(getUserToId())
			.append(getOrderId())
			.append(getItemId())
			.append(getCommentContent())
			.append(getStars())
			.append(getCreateTime())
			.append(getModifyTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Comment == false) return false;
		if(this == obj) return true;
		Comment other = (Comment)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getUserForId(),other.getUserForId())
			.append(getUserToId(),other.getUserToId())
			.append(getOrderId(),other.getOrderId())
			.append(getItemId(),other.getItemId())
			.append(getCommentContent(),other.getCommentContent())
			.append(getStars(),other.getStars())
			.append(getCreateTime(),other.getCreateTime())
			.append(getModifyTime(),other.getModifyTime())
			.isEquals();
		}

}
