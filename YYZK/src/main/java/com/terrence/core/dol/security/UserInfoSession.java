package com.terrence.core.dol.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.terrence.crm.dol.bean.Admin;

public class UserInfoSession extends User {
	private static final long serialVersionUID = 1126160175703691686L;
	private Admin userInfo;

	public UserInfoSession(Admin userInfo, String username, String password, boolean enabled,
			boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, authorities);
		this.userInfo = userInfo;
	}

	public Admin getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(Admin userInfo) {
		this.userInfo = userInfo;
	}
}