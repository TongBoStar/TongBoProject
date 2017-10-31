package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Yyinventory extends BaseEntity implements java.io.Serializable {
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
	 * 总数量
	 */
	private Float fqtyall;
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
	 * 物料规格
	 */
	private String itemMode;
	
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
	public String getItemMode() {
		return itemMode;
	}
	public void setItemMode(String itemMode) {
		this.itemMode = itemMode;
	}
	public Float getFqtyall() {
		return fqtyall;
	}
	public void setFqtyall(Float fqtyall) {
		this.fqtyall = fqtyall;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("YyItemId",getYyItemId())
			.append("Fqty",getFqty())
			.append("Fbatchno",getFbatchno())
			.append("CreateTime",getCreateTime())
			.append("CreateUserId",getCreateUserId())
			.append("ItemCode",getItemCode())
			.append("ItemName",getItemName())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getYyItemId())
			.append(getFqty())
			.append(getFbatchno())
			.append(getCreateTime())
			.append(getCreateUserId())
			.append(getItemCode())
			.append(getItemName())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Yyinventory == false) return false;
		if(this == obj) return true;
		Yyinventory other = (Yyinventory)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getYyItemId(),other.getYyItemId())
			.append(getFqty(),other.getFqty())
			.append(getFbatchno(),other.getFbatchno())
			.append(getCreateTime(),other.getCreateTime())
			.append(getCreateUserId(),other.getCreateUserId())
			.append(getItemCode(),other.getItemCode())
			.append(getItemName(),other.getItemName())
			.isEquals();
		}

}
