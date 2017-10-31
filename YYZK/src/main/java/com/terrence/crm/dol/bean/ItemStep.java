package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class ItemStep extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	/**
	 * 步骤名称
	 */
	private String stepName;
	/**
	 * 步骤序号
	 */
	private Integer stepNo;
	/**
	 * 所属项目ID
	 */
	private Integer itemId;
	/**
	 * 所需物品
	 */
	private String stepNeeds;
	/**
	 * 步骤内容
	 */
	private String stepContent;
	/**
	 * 所需时长
	 */
	private Integer stepTimes;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 修改时间
	 */
	private String modifyTime;
	/**
	 * 项目信息
	 */
	private Item item;
	
	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getStepName(){
		return this.stepName;
	}
	public void setStepName(String stepName){
		this.stepName=stepName;
	}
	public Integer getStepNo(){
		return this.stepNo;
	}
	public void setStepNo(Integer stepNo){
		this.stepNo=stepNo;
	}
	public Integer getItemId(){
		return this.itemId;
	}
	public void setItemId(Integer itemId){
		this.itemId=itemId;
	}
	public String getStepNeeds(){
		return this.stepNeeds;
	}
	public void setStepNeeds(String stepNeeds){
		this.stepNeeds=stepNeeds;
	}
	public String getStepContent(){
		return this.stepContent;
	}
	public void setStepContent(String stepContent){
		this.stepContent=stepContent;
	}
	public Integer getStepTimes(){
		return this.stepTimes;
	}
	public void setStepTimes(Integer stepTimes){
		this.stepTimes=stepTimes;
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
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("StepName",getStepName())
			.append("StepNo",getStepNo())
			.append("ItemId",getItemId())
			.append("StepNeeds",getStepNeeds())
			.append("StepContent",getStepContent())
			.append("StepTimes",getStepTimes())
			.append("CreateTime",getCreateTime())
			.append("ModifyTime",getModifyTime())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getStepName())
			.append(getStepNo())
			.append(getItemId())
			.append(getStepNeeds())
			.append(getStepContent())
			.append(getStepTimes())
			.append(getCreateTime())
			.append(getModifyTime())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof ItemStep == false) return false;
		if(this == obj) return true;
		ItemStep other = (ItemStep)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getStepName(),other.getStepName())
			.append(getStepNo(),other.getStepNo())
			.append(getItemId(),other.getItemId())
			.append(getStepNeeds(),other.getStepNeeds())
			.append(getStepContent(),other.getStepContent())
			.append(getStepTimes(),other.getStepTimes())
			.append(getCreateTime(),other.getCreateTime())
			.append(getModifyTime(),other.getModifyTime())
			.isEquals();
		}

}
