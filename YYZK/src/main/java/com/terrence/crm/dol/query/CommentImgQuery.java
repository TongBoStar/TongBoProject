package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class CommentImgQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 评论的ID
	 */
	private Long commentId;
	/**
	 * 图片路径
	 */
	private String imgPath;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public Long getCommentId(){
		return this.commentId;
	}
	public void setCommentId(Long commentId){
		this.commentId=commentId;
	}
	public String getImgPath(){
		return this.imgPath;
	}
	public void setImgPath(String imgPath){
		this.imgPath=imgPath;
	}

}
