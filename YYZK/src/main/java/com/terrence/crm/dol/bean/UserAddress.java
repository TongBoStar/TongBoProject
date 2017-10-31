package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class UserAddress extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer id;
	/**
	 * 用户ID
	 */
	private Integer userId;
	/**
	 * 详细地址
	 */
	private String addressName;
	/**
	 * 国家
	 */
	private String country;
	/**
	 * 省份
	 */
	private String province;
	/**
	 * 城市
	 */
	private String city;
	/**
	 * 区
	 */
	private String district;
	/**
	 * 街道
	 */
	private String street;
	/**
	 * 邮编
	 */
	private String postCode;
	/**
	 * 经度
	 */
	private Integer longitude;
	/**
	 * 纬度
	 */
	private Integer latitude;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 修改时间
	 */
	private String modifyTime;
	/**
	 * 用户名称
	 */
	private String userName;
	
	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getUserId(){
		return this.userId;
	}
	public void setUserId(Integer userId){
		this.userId=userId;
	}
	public String getAddressName(){
		return this.addressName;
	}
	public void setAddressName(String addressName){
		this.addressName=addressName;
	}
	public String getCountry(){
		return this.country;
	}
	public void setCountry(String country){
		this.country=country;
	}
	public String getProvince(){
		return this.province;
	}
	public void setProvince(String province){
		this.province=province;
	}
	public String getCity(){
		return this.city;
	}
	public void setCity(String city){
		this.city=city;
	}
	public String getDistrict(){
		return this.district;
	}
	public void setDistrict(String district){
		this.district=district;
	}
	public String getStreet(){
		return this.street;
	}
	public void setStreet(String street){
		this.street=street;
	}
	public String getPostCode(){
		return this.postCode;
	}
	public void setPostCode(String postCode){
		this.postCode=postCode;
	}
	public Integer getLongitude(){
		return this.longitude;
	}
	public void setLongitude(Integer longitude){
		this.longitude=longitude;
	}
	public Integer getLatitude(){
		return this.latitude;
	}
	public void setLatitude(Integer latitude){
		this.latitude=latitude;
	}
	public String getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public String getModifyTime(){
		return this.modifyTime;
	}
	public void setModifyTime(String modifyTime){
		this.modifyTime=modifyTime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("UserId",getUserId())
			.append("AddressName",getAddressName())
			.append("Country",getCountry())
			.append("Province",getProvince())
			.append("City",getCity())
			.append("District",getDistrict())
			.append("Street",getStreet())
			.append("PostCode",getPostCode())
			.append("Longitude",getLongitude())
			.append("Latitude",getLatitude())
			.append("CreateTime",getCreateTime())
			.append("ModifyTime",getModifyTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getUserId())
			.append(getAddressName())
			.append(getCountry())
			.append(getProvince())
			.append(getCity())
			.append(getDistrict())
			.append(getStreet())
			.append(getPostCode())
			.append(getLongitude())
			.append(getLatitude())
			.append(getCreateTime())
			.append(getModifyTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof UserAddress == false) return false;
		if(this == obj) return true;
		UserAddress other = (UserAddress)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getUserId(),other.getUserId())
			.append(getAddressName(),other.getAddressName())
			.append(getCountry(),other.getCountry())
			.append(getProvince(),other.getProvince())
			.append(getCity(),other.getCity())
			.append(getDistrict(),other.getDistrict())
			.append(getStreet(),other.getStreet())
			.append(getPostCode(),other.getPostCode())
			.append(getLongitude(),other.getLongitude())
			.append(getLatitude(),other.getLatitude())
			.append(getCreateTime(),other.getCreateTime())
			.append(getModifyTime(),other.getModifyTime())
			.isEquals();
		}

}
