package com.terrence.crm.dol.query;
import com.terrence.crm.dol.base.BaseQuery;
import com.terrence.crm.dol.utils.DateConvertUtils;

public class YqcodeQuery extends BaseQuery implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 序号
	 */
	private Long seqno;
	/**
	 * 模块标识
	 */
	private String fmark;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public Long getSeqno(){
		return this.seqno;
	}
	public void setSeqno(Long seqno){
		this.seqno=seqno;
	}
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}

}
