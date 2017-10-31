package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class AdminImagesQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 唯一标识ID
	 */
	private Long id;
	/**
	 * 上传的图片的路径
	 */
	private String imgPath;
	/**
	 * 图片名称
	 */
	private String imgName;
	/**
	 * 上传时间
	 */
	private String crateTime;
	/**
	 * 用户的ID号
	 */
	private Long adminId;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getImgPath(){
		return this.imgPath;
	}
	public void setImgPath(String imgPath){
		this.imgPath=imgPath;
	}
	public String getImgName(){
		return this.imgName;
	}
	public void setImgName(String imgName){
		this.imgName=imgName;
	}
	public String getCrateTime(){
		return this.crateTime;
	}
	public void setCrateTime(String crateTime){
		this.crateTime=crateTime;
	}
	public Long getAdminId(){
		return this.adminId;
	}
	public void setAdminId(Long adminId){
		this.adminId=adminId;
	}

}
