package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class YiyunupdateQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 更新的表名称
	 */
	private String ftable;
	/**
	 * 更新的对象的ID号
	 */
	private Long fid;
	/**
	 * 更新人ID
	 */
	private Long createrId;
	/**
	 * 更新时间
	 */
	private String createTime;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getFtable(){
		return this.ftable;
	}
	public void setFtable(String ftable){
		this.ftable=ftable;
	}
	public Long getFid(){
		return this.fid;
	}
	public void setFid(Long fid){
		this.fid=fid;
	}
	public Long getCreaterId(){
		return this.createrId;
	}
	public void setCreaterId(Long createrId){
		this.createrId=createrId;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}

}
