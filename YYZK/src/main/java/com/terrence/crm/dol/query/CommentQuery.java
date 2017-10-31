package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class CommentQuery extends BaseQuery implements java.io.Serializable {
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

}
