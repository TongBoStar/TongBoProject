package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class IostoreQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 唯一标识
	 */
	private Long id;
	/**
	 * 物料代码
	 */
	private String itemCode;
	/**
	 * 入库数量
	 */
	private Integer fqty;
	/**
	 * 入库时间
	 */
	private String createTime;
	/**
	 * 出库人
	 */
	private Long createUserId;
	/**
	 * 序列号
	 */
	private String fseqno;
	/**
	 * 入库类型 1.产品入库 2.零件入库
	 */
	private Integer ftype;
	/**
	 * 批次号
	 */
	private String fbatchno;
	/**
	 * 1 入库 2 出库
	 */
	private Integer dataType;
	/**
	 * 物料名称
	 */
	private String itemName;
	/**
	 * 物料单位
	 */
	private String funit;
	/**
	 * 物料规格
	 */
	private String itemMode;
	/**
	 * 备注
	 */
	private String fmark;
	/**
	 * 单号
	 */
	private String fbillno;
	/**
	 * 序列号
	 */
	private String serialNumber;
	
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getItemCode(){
		return this.itemCode;
	}
	public void setItemCode(String itemCode){
		this.itemCode=itemCode;
	}
	public Integer getFqty(){
		return this.fqty;
	}
	public void setFqty(Integer fqty){
		this.fqty=fqty;
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
	public String getFseqno(){
		return this.fseqno;
	}
	public void setFseqno(String fseqno){
		this.fseqno=fseqno;
	}
	public Integer getFtype(){
		return this.ftype;
	}
	public void setFtype(Integer ftype){
		this.ftype=ftype;
	}
	public String getFbatchno(){
		return this.fbatchno;
	}
	public void setFbatchno(String fbatchno){
		this.fbatchno=fbatchno;
	}
	public Integer getDataType(){
		return this.dataType;
	}
	public void setDataType(Integer dataType){
		this.dataType=dataType;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getFunit() {
		return funit;
	}
	public void setFunit(String funit) {
		this.funit = funit;
	}
	public String getItemMode() {
		return itemMode;
	}
	public void setItemMode(String itemMode) {
		this.itemMode = itemMode;
	}
	public String getFmark() {
		return fmark;
	}
	public void setFmark(String fmark) {
		this.fmark = fmark;
	}
	public String getFbillno() {
		return fbillno;
	}
	public void setFbillno(String fbillno) {
		this.fbillno = fbillno;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

}
