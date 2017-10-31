package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class StcodeQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	/**
	 * 依云书童序列号
	 */
	private String stCode;
	/**
	 * 出厂序列号
	 */
	private String serialNumber;
	/**
	 * 依云书童序列号查询
	 */
	private String stCodeQuery;
	/**
	 * 出厂序列号查询
	 */
	private String serialNumberQuery;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 创建人
	 */
	private Long createrId;
	/**
	 * 使用人
	 */
	private String username;
	/**
	 * 手机号
	 */
	private String telNumber;
	/**
	 * 地址
	 */
	private String faddress;
	/**
	 * 备注
	 */
	private String fmark;
	/**
	 * 颜色
	 */
	private Integer fcolor;
	/**
	 * 数量
	 */
	private Integer fqty;
	/**
	 * 是否需要发票
	 */
	private Integer isinvoice;
	/**
	 * 发票抬头
	 */
	private String invoiceHead;
	/**
	 * 快递单号
	 */
	private String tracknumber;
	/**
	 * 金额
	 */
	private Float famount;
	/**
	 * 快递费
	 */
	private Float trackamount;
	/**
	 * 赠品
	 */
	private Integer giveaway;
	/**
	 * 回访记录
	 */
	private String feedback;
	/**
	 * 后续跟踪
	 */
	private String flowup;
	/**
	 * 售后记录
	 */
	private String customerservice;
	/**
	 * 详细地址
	 */
	private String fadressdetail;
	/**
	 * 品质
	 */
	private String quality;
	/**
	 * 发货日期
	 */
	private String sendTime;
	/**
	 * 发货日期起始
	 */
	private String sendTimeStart;
	/**
	 * 发货日期结束
	 */
	private String sendTimeEnd;
	/**
	 * 条形码编号
	 */
	private String barcode;
	/**
	 * 代理商
	 */
	private String agentName;
	/**
	 * 是否人工添加的
	 */
	private Integer sadd;
	
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getStCode(){
		return this.stCode;
	}
	public void setStCode(String stCode){
		this.stCode=stCode;
	}
	public String getSerialNumber(){
		return this.serialNumber;
	}
	public void setSerialNumber(String serialNumber){
		this.serialNumber=serialNumber;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public Long getCreaterId(){
		return this.createrId;
	}
	public void setCreaterId(Long createrId){
		this.createrId=createrId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTelNumber() {
		return telNumber;
	}
	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}
	public String getFaddress() {
		return faddress;
	}
	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}
	public String getFmark() {
		return fmark;
	}
	public void setFmark(String fmark) {
		this.fmark = fmark;
	}
	public String getStCodeQuery() {
		return stCodeQuery;
	}
	public void setStCodeQuery(String stCodeQuery) {
		this.stCodeQuery = stCodeQuery;
	}
	public String getSerialNumberQuery() {
		return serialNumberQuery;
	}
	public void setSerialNumberQuery(String serialNumberQuery) {
		this.serialNumberQuery = serialNumberQuery;
	}
	public Integer getFcolor() {
		return fcolor;
	}
	public void setFcolor(Integer fcolor) {
		this.fcolor = fcolor;
	}
	public Integer getFqty() {
		return fqty;
	}
	public void setFqty(Integer fqty) {
		this.fqty = fqty;
	}
	public Integer getIsinvoice() {
		return isinvoice;
	}
	public void setIsinvoice(Integer isinvoice) {
		this.isinvoice = isinvoice;
	}
	public String getInvoiceHead() {
		return invoiceHead;
	}
	public void setInvoiceHead(String invoiceHead) {
		this.invoiceHead = invoiceHead;
	}
	public String getTracknumber() {
		return tracknumber;
	}
	public void setTracknumber(String tracknumber) {
		this.tracknumber = tracknumber;
	}
	public Float getFamount() {
		return famount;
	}
	public void setFamount(Float famount) {
		this.famount = famount;
	}
	public Float getTrackamount() {
		return trackamount;
	}
	public void setTrackamount(Float trackamount) {
		this.trackamount = trackamount;
	}
	public Integer getGiveaway() {
		return giveaway;
	}
	public void setGiveaway(Integer giveaway) {
		this.giveaway = giveaway;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public String getFlowup() {
		return flowup;
	}
	public void setFlowup(String flowup) {
		this.flowup = flowup;
	}
	public String getCustomerservice() {
		return customerservice;
	}
	public void setCustomerservice(String customerservice) {
		this.customerservice = customerservice;
	}
	public String getFadressdetail() {
		return fadressdetail;
	}
	public void setFadressdetail(String fadressdetail) {
		this.fadressdetail = fadressdetail;
	}
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public String getSendTimeStart() {
		return sendTimeStart;
	}
	public void setSendTimeStart(String sendTimeStart) {
		this.sendTimeStart = sendTimeStart;
	}
	public String getSendTimeEnd() {
		return sendTimeEnd;
	}
	public void setSendTimeEnd(String sendTimeEnd) {
		this.sendTimeEnd = sendTimeEnd;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public String getAgentName() {
		return agentName;
	}
	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}
	public Integer getSadd() {
		return sadd;
	}
	public void setSadd(Integer sadd) {
		this.sadd = sadd;
	}

}
