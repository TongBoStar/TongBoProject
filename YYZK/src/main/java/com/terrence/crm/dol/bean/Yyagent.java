package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Yyagent extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 代理商名称
	 */
	private String agentName;
	/**
	 * 代理商单位名称
	 */
	private String compName;
	/**
	 * 加入时间
	 */
	private String regTime;
	/**
	 * 规模大小 1小规模 2中规模 3大规模
	 */
	private Integer fscope;
	/**
	 * 微信号
	 */
	private String wxCode;
	/**
	 * 手机号
	 */
	private String telNumber;
	/**
	 * 代理状态 0 未激活 1 激活
	 */
	private Integer fstatus;
	/**
	 * 上级代理名称
	 */
	private String upagent;
	/**
	 * 备注
	 */
	private String fmark;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getAgentName(){
		return this.agentName;
	}
	public void setAgentName(String agentName){
		this.agentName=agentName;
	}
	public String getCompName(){
		return this.compName;
	}
	public void setCompName(String compName){
		this.compName=compName;
	}
	public String getRegTime(){
		return this.regTime;
	}
	public void setRegTime(String regTime){
		this.regTime=regTime;
	}
	public Integer getFscope(){
		return this.fscope;
	}
	public void setFscope(Integer fscope){
		this.fscope=fscope;
	}
	public String getWxCode(){
		return this.wxCode;
	}
	public void setWxCode(String wxCode){
		this.wxCode=wxCode;
	}
	public String getTelNumber(){
		return this.telNumber;
	}
	public void setTelNumber(String telNumber){
		this.telNumber=telNumber;
	}
	public Integer getFstatus(){
		return this.fstatus;
	}
	public void setFstatus(Integer fstatus){
		this.fstatus=fstatus;
	}
	public String getUpagent(){
		return this.upagent;
	}
	public void setUpagent(String upagent){
		this.upagent=upagent;
	}
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("AgentName",getAgentName())
			.append("CompName",getCompName())
			.append("RegTime",getRegTime())
			.append("Fscope",getFscope())
			.append("WxCode",getWxCode())
			.append("TelNumber",getTelNumber())
			.append("Fstatus",getFstatus())
			.append("Upagent",getUpagent())
			.append("Fmark",getFmark())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getAgentName())
			.append(getCompName())
			.append(getRegTime())
			.append(getFscope())
			.append(getWxCode())
			.append(getTelNumber())
			.append(getFstatus())
			.append(getUpagent())
			.append(getFmark())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Yyagent == false) return false;
		if(this == obj) return true;
		Yyagent other = (Yyagent)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getAgentName(),other.getAgentName())
			.append(getCompName(),other.getCompName())
			.append(getRegTime(),other.getRegTime())
			.append(getFscope(),other.getFscope())
			.append(getWxCode(),other.getWxCode())
			.append(getTelNumber(),other.getTelNumber())
			.append(getFstatus(),other.getFstatus())
			.append(getUpagent(),other.getUpagent())
			.append(getFmark(),other.getFmark())
			.isEquals();
		}

}
