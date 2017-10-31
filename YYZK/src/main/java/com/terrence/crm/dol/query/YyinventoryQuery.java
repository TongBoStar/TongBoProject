package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class YyinventoryQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 唯一标识ID
	 */
	private Long id;
	/**
	 * 物料ID
	 */
	private Long yyItemId;
	/**
	 * 数量
	 */
	private Float fqty;
	/**
	 * 批次号
	 */
	private String fbatchno;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 创建人
	 */
	private Long createUserId;
	/**
	 * 物料编码
	 */
	private String itemCode;
	/**
	 * 物料名称
	 */
	private String itemName;
	/**
	 * 备注
	 */
	private String fmark;
	/**
	 * 物料编码
	 */
	private String itemCodeQuery;
	/**
	 * 物料名称
	 */
	private String itemNameQuery;
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public Long getYyItemId(){
		return this.yyItemId;
	}
	public void setYyItemId(Long yyItemId){
		this.yyItemId=yyItemId;
	}
	public Float getFqty(){
		return this.fqty;
	}
	public void setFqty(Float fqty){
		this.fqty=fqty;
	}
	public String getFbatchno(){
		return this.fbatchno;
	}
	public void setFbatchno(String fbatchno){
		this.fbatchno=fbatchno;
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
	public String getFmark() {
		return fmark;
	}
	public void setFmark(String fmark) {
		this.fmark = fmark;
	}
	public String getItemCodeQuery() {
		return itemCodeQuery;
	}
	public void setItemCodeQuery(String itemCodeQuery) {
		this.itemCodeQuery = itemCodeQuery;
	}
	public String getItemNameQuery() {
		return itemNameQuery;
	}
	public void setItemNameQuery(String itemNameQuery) {
		this.itemNameQuery = itemNameQuery;
	}

}
