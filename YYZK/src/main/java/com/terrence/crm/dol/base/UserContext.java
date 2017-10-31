/**
 * 
 */
package com.terrence.crm.dol.base;






import com.terrence.crm.dol.bean.Admin;

/**
 * @author Administrator
 *
 */
public class UserContext {
	public static String TYPE_ADMIN = "TYPE_ADMIN";
	public static String TYPE_SUPPLIER = "TYPE_SUPPLIER";
	public static String TYPE_USER = "TYPE_USER";
	private Object user;
	private Long id;
	private String name;
	private String type;
	
	
	public UserContext(Admin user){
		this.user = user;
		this.id = user.getAdminId();
		this.name = user.getLoginName();
		this.type = UserContext.TYPE_ADMIN;
	}
	
	/**
	 * @return the user
	 */
	public Object getUser() {
		return user;
	}
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	public boolean isAdmin(){
		if(type.equals(TYPE_ADMIN)){
			return true;
		}else{
			return false;
		}
	}
	public boolean isSupplier(){
		if(type.equals(TYPE_SUPPLIER)){
			return true;
		}else{
			return false;
		}
	}
	public boolean isUser(){
		if(type.equals(TYPE_USER)){
			return true;
		}else{
			return false;
		}
	}
}
