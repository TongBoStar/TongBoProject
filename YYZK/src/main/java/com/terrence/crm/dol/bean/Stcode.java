package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Stcode extends BaseEntity implements java.io.Serializable {
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
	 * 经度
	 */
	private Double lng;
	/**
	 * 纬度
	 */
	private Double lat;
	/**
	 * 更新后的地址
	 */
	private String fupaddress;
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
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public String getFupaddress() {
		return fupaddress;
	}
	public void setFupaddress(String fupaddress) {
		this.fupaddress = fupaddress;
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
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("StCode",getStCode())
			.append("SerialNumber",getSerialNumber())
			.append("CreateTime",getCreateTime())
			.append("CreaterId",getCreaterId())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getStCode())
			.append(getSerialNumber())
			.append(getCreateTime())
			.append(getCreaterId())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Stcode == false) return false;
		if(this == obj) return true;
		Stcode other = (Stcode)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getStCode(),other.getStCode())
			.append(getSerialNumber(),other.getSerialNumber())
			.append(getCreateTime(),other.getCreateTime())
			.append(getCreaterId(),other.getCreaterId())
			.isEquals();
		}

}
