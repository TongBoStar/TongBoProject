package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class YybomQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 唯一标识
	 */
	private Long id;
	/**
	 * 父级物料id
	 */
	private Long pid;
	/**
	 * 子级物料id
	 */
	private Long cid;
	/**
	 * 数量
	 */
	private Float fqty;
	/**
	 * 备注
	 */
	private String fmark;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 创建人
	 */
	private Long createUserId;
	/**
	 * 父级物料编码
	 */
	private String pitemCode;
	/**
	 * 子级物料编码
	 */
	private String citemCode;
	/**
	 * 单位 用于查询结果
	 */
	private String funit;
	
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public Long getPid(){
		return this.pid;
	}
	public void setPid(Long pid){
		this.pid=pid;
	}
	public Long getCid(){
		return this.cid;
	}
	public void setCid(Long cid){
		this.cid=cid;
	}
	public Float getFqty(){
		return this.fqty;
	}
	public void setFqty(Float fqty){
		this.fqty=fqty;
	}
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public Long getCreateUserId(){
		return this.createUserId;
	}
	public void setCreateUserId(Long createUserId){
		this.createUserId=createUserId;
	}
	public String getPitemCode(){
		return this.pitemCode;
	}
	public void setPitemCode(String pitemCode){
		this.pitemCode=pitemCode;
	}
	public String getCitemCode(){
		return this.citemCode;
	}
	public void setCitemCode(String citemCode){
		this.citemCode=citemCode;
	}

}
