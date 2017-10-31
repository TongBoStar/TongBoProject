package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class YyitemQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 唯一标识ID
	 */
	private Long id;
	/**
	 * 物料名称
	 */
	private String itemName;
	/**
	 * 规格型号
	 */
	private String itemMode;
	/**
	 * 价格
	 */
	private Float fprice;
	/**
	 * 备注
	 */
	private String fmark;
	/**
	 * 物料编码
	 */
	private String itemCode;
	/**
	 * 物料编码查询用
	 */
	private String itemCodeQuery;
	/**
	 * 状态 0禁用1使用
	 */
	private Integer fstatus;
	/**
	 * 物料类型
	 */
	private Integer ftype;
	/**
	 * 供应商
	 */
	private String supplier;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 创建人
	 */
	private Long createUserId;
	/**
	 * 材料
	 */
	private String fmaterial;
	/**
	 * 单位
	 */
	private String funit;
	/**
	 * 标准
	 */
	private String fstandard;
	/**
	 * 安全库存
	 */
	private Float safeinventory;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
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
	public Float getFprice(){
		return this.fprice;
	}
	public void setFprice(Float fprice){
		this.fprice=fprice;
	}
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}
	public String getItemCode(){
		return this.itemCode;
	}
	public void setItemCode(String itemCode){
		this.itemCode=itemCode;
	}
	public Integer getFstatus(){
		return this.fstatus;
	}
	public void setFstatus(Integer fstatus){
		this.fstatus=fstatus;
	}
	public Integer getFtype(){
		return this.ftype;
	}
	public void setFtype(Integer ftype){
		this.ftype=ftype;
	}
	public String getSupplier(){
		return this.supplier;
	}
	public void setSupplier(String supplier){
		this.supplier=supplier;
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
	public String getFmaterial(){
		return this.fmaterial;
	}
	public void setFmaterial(String fmaterial){
		this.fmaterial=fmaterial;
	}
	public String getFunit(){
		return this.funit;
	}
	public void setFunit(String funit){
		this.funit=funit;
	}
	public String getFstandard(){
		return this.fstandard;
	}
	public void setFstandard(String fstandard){
		this.fstandard=fstandard;
	}
	public Float getSafeinventory(){
		return this.safeinventory;
	}
	public void setSafeinventory(Float safeinventory){
		this.safeinventory=safeinventory;
	}
	public String getItemCodeQuery() {
		return itemCodeQuery;
	}
	public void setItemCodeQuery(String itemCodeQuery) {
		this.itemCodeQuery = itemCodeQuery;
	}

}
