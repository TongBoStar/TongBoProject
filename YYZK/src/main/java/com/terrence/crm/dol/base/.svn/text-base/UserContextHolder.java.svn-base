package com.terrence.crm.dol.base;

import com.terrence.crm.dol.bean.Admin;





/**
 * 三个系统的统一用户信息。为Service层取当前用户信息
 * @author Administrator
 *
 */
public class UserContextHolder { 
	private static final ThreadLocal<UserContext> contextHolder = new ThreadLocal<UserContext>(); 

	public static void set(UserContext userContext) { 
	  contextHolder.set(userContext); 
	} 

	public static UserContext get() { 
		UserContext userContext = contextHolder.get();
		if(userContext==null){
			userContext = new UserContext(new Admin(0L));
		}
	  return  userContext; 
	} 

	public static void clearDbType() { 
	  contextHolder.remove(); 
	} 
	} 

