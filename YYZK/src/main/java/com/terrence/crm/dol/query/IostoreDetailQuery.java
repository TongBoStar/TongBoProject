package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class IostoreDetailQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 表头ID
	 */
	private Long fid;
	/**
	 * 物料代码
	 */
	private String itemCode;
	/**
	 * 物料名称
	 */
	private String itemName;
	/**
	 * 规格型号
	 */
	private String itemMode;
	/**
	 * 单位
	 */
	private String funit;
	/**
	 * 数量
	 */
	private Float fqty;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public Long getFid(){
		return this.fid;
	}
	public void setFid(Long fid){
		this.fid=fid;
	}
	public String getItemCode(){
		return this.itemCode;
	}
	public void setItemCode(String itemCode){
		this.itemCode=itemCode;
	}
	public String getItemName(){
		return this.itemName;
	}
	public void setItemName(String itemName){
		this.itemName=itemName;
	}
	public String getItemMode(){
		return this.itemMode;
	}
	public void setItemMode(String itemMode){
		this.itemMode=itemMode;
	}
	public String getFunit(){
		return this.funit;
	}
	public void setFunit(String funit){
		this.funit=funit;
	}
	public Float getFqty(){
		return this.fqty;
	}
	public void setFqty(Float fqty){
		this.fqty=fqty;
	}

}
