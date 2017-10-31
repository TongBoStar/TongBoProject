package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Yybom extends BaseEntity implements java.io.Serializable {
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
	/**
	 * 物料名称 用于查询结果
	 */
	private String citemName;
	/**
	 * 规格 用于查询结果
	 */
	private String citemMode;
	
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
	public String getFunit() {
		return funit;
	}
	public void setFunit(String funit) {
		this.funit = funit;
	}
	public String getCitemName() {
		return citemName;
	}
	public void setCitemName(String citemName) {
		this.citemName = citemName;
	}
	public String getCitemMode() {
		return citemMode;
	}
	public void setCitemMode(String citemMode) {
		this.citemMode = citemMode;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("Pid",getPid())
			.append("Cid",getCid())
			.append("Fqty",getFqty())
			.append("Fmark",getFmark())
			.append("CreateTime",getCreateTime())
			.append("CreateUserId",getCreateUserId())
			.append("PitemCode",getPitemCode())
			.append("CitemCode",getCitemCode())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getPid())
			.append(getCid())
			.append(getFqty())
			.append(getFmark())
			.append(getCreateTime())
			.append(getCreateUserId())
			.append(getPitemCode())
			.append(getCitemCode())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Yybom == false) return false;
		if(this == obj) return true;
		Yybom other = (Yybom)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getPid(),other.getPid())
			.append(getCid(),other.getCid())
			.append(getFqty(),other.getFqty())
			.append(getFmark(),other.getFmark())
			.append(getCreateTime(),other.getCreateTime())
			.append(getCreateUserId(),other.getCreateUserId())
			.append(getPitemCode(),other.getPitemCode())
			.append(getCitemCode(),other.getCitemCode())
			.isEquals();
		}

}
