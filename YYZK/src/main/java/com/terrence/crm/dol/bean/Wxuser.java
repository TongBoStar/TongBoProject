package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Wxuser extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 名称
	 */
	private String nickname;
	/**
	 * 微信号
	 */
	private String wxCode;
	/**
	 * 头像
	 */
	private String headerurl;
	/**
	 * 省
	 */
	private String province;
	/**
	 * 市
	 */
	private String city;
	/**
	 * 性别
	 */
	private Integer sex;
	private String fmark;
	/**
	 * 真实名称
	 */
	private String username;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getNickname(){
		return this.nickname;
	}
	public void setNickname(String nickname){
		this.nickname=nickname;
	}
	public String getWxCode(){
		return this.wxCode;
	}
	public void setWxCode(String wxCode){
		this.wxCode=wxCode;
	}
	public String getHeaderurl(){
		return this.headerurl;
	}
	public void setHeaderurl(String headerurl){
		this.headerurl=headerurl;
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
	public Integer getSex(){
		return this.sex;
	}
	public void setSex(Integer sex){
		this.sex=sex;
	}
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}
	public String getUsername(){
		return this.username;
	}
	public void setUsername(String username){
		this.username=username;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("Nickname",getNickname())
			.append("WxCode",getWxCode())
			.append("Headerurl",getHeaderurl())
			.append("Province",getProvince())
			.append("City",getCity())
			.append("Sex",getSex())
			.append("Fmark",getFmark())
			.append("Username",getUsername())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getNickname())
			.append(getWxCode())
			.append(getHeaderurl())
			.append(getProvince())
			.append(getCity())
			.append(getSex())
			.append(getFmark())
			.append(getUsername())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Wxuser == false) return false;
		if(this == obj) return true;
		Wxuser other = (Wxuser)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getNickname(),other.getNickname())
			.append(getWxCode(),other.getWxCode())
			.append(getHeaderurl(),other.getHeaderurl())
			.append(getProvince(),other.getProvince())
			.append(getCity(),other.getCity())
			.append(getSex(),other.getSex())
			.append(getFmark(),other.getFmark())
			.append(getUsername(),other.getUsername())
			.isEquals();
		}

}
