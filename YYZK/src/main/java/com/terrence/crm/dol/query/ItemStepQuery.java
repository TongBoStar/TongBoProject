package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class ItemStepQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
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

	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
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

}
