package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class IostoreDetail extends BaseEntity implements java.io.Serializable {
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
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("Fid",getFid())
			.append("ItemCode",getItemCode())
			.append("ItemName",getItemName())
			.append("ItemMode",getItemMode())
			.append("Funit",getFunit())
			.append("Fqty",getFqty())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getFid())
			.append(getItemCode())
			.append(getItemName())
			.append(getItemMode())
			.append(getFunit())
			.append(getFqty())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof IostoreDetail == false) return false;
		if(this == obj) return true;
		IostoreDetail other = (IostoreDetail)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getFid(),other.getFid())
			.append(getItemCode(),other.getItemCode())
			.append(getItemName(),other.getItemName())
			.append(getItemMode(),other.getItemMode())
			.append(getFunit(),other.getFunit())
			.append(getFqty(),other.getFqty())
			.isEquals();
		}

}
