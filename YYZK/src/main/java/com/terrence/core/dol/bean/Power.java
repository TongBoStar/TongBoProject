package com.terrence.core.dol.bean;

/**
 * 
 * 用户存储权限的基本信息
 * 暂时还没研究distinct或union
 * @author hf.cao
 *
 */
public class Power {

	private String code;
	private Long authorityId;
	
	public Power(){
		
	}
	
	public Power(String code,Long authorityId){
		this.code = code;
		this.authorityId = authorityId;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Long getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(Long authorityId) {
		this.authorityId = authorityId;
	}
	
	//重写equals方法, 最佳实践就是如下这种判断顺序:  
    public boolean equals(Object obj) {  
        if (!(obj instanceof Power))  
            return false;     
        if (obj == this)  
            return true;  
        return this.code.equals(((Power) obj).code) && this.authorityId.equals(((Power) obj).authorityId);  
    }  
}