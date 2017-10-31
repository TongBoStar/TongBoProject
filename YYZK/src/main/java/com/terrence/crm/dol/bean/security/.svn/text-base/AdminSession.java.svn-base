/**
 * 
 */
package com.terrence.crm.dol.bean.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.terrence.crm.dol.bean.Admin;



/**
 * 
 * @author frank
 *
 */
public class AdminSession extends User {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1126160175703691686L;
	private Admin admin;
	



	public AdminSession(Admin admin, String username, String password, boolean enabled,
			boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, authorities);
		this.admin = admin;
	}




	public Admin getAdmin() {
		return admin;
	}




	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	
	

}
