package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class ItemImgsQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	/**
	 * 项目ID
	 */
	private Integer itemId;
	/**
	 * 照片名称
	 */
	private String imgName;
	/**
	 * 照片地址
	 */
	private String imgPath;
	/**
	 * 是否首页显示
	 */
	private Integer showIndexStatus;
	/**
	 * 是否显示
	 */
	private Integer showStatus;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 修改时间
	 */
	private String modifyTime;

	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getItemId(){
		return this.itemId;
	}
	public void setItemId(Integer itemId){
		this.itemId=itemId;
	}
	public String getImgName(){
		return this.imgName;
	}
	public void setImgName(String imgName){
		this.imgName=imgName;
	}
	public String getImgPath(){
		return this.imgPath;
	}
	public void setImgPath(String imgPath){
		this.imgPath=imgPath;
	}
	public Integer getShowIndexStatus(){
		return this.showIndexStatus;
	}
	public void setShowIndexStatus(Integer showIndexStatus){
		this.showIndexStatus=showIndexStatus;
	}
	public Integer getShowStatus(){
		return this.showStatus;
	}
	public void setShowStatus(Integer showStatus){
		this.showStatus=showStatus;
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
