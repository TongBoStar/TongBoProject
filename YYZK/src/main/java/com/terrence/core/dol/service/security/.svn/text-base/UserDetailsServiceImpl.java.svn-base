package com.terrence.core.dol.service.security;

import java.net.UnknownHostException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.terrence.core.dol.security.UserInfoSession;
import com.terrence.core.dol.service.IOperationLogService;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.service.IAdminService;

/**
 * 实现SpringSecurity的UserDetailsService接口,实现获取用户Detail信息的回调函数.
 * 
 * @author allen
 */

public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	@Qualifier("adminService")
	private IAdminService adminService;
	@Autowired
	@Qualifier("operationLogService")
	private IOperationLogService operationLogService;
	@Autowired
	private HttpServletRequest request;

	/**
	 * 获取用户Details信息的回调函数.
	 */
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {

//		Admin emp = adminService.findByLoginName(username);
//		if (emp == null) {
//			operationLogService.save(request, null, "",username, "用户登录","登录",String.format("%s登录系统失败！", username));
//			throw new UsernameNotFoundException("用户名或密码错误");
//		}else{
//			operationLogService.save(request, emp.getId(), emp.getUserName(),emp.getLoginName(), "用户登录","登录",String.format("%s成功登录系统！", emp.getLoginName()));
//		}

//		List<Authority> authorityList = admin.getAuthorityList();
//		admin.setAuthorityList(authorityList);
//		Set<GrantedAuthority> grantedAuths = obtainGrantedAuthorities(authorityList);
//		authSet.add(new GrantedAuthorityImpl(authority.getAuthorityKey()));
		
		Set authSet = new HashSet();
		authSet.add(new GrantedAuthorityImpl("ROLE_ALL"));
		
		Set<GrantedAuthority> grantedAuths = authSet;

		//-- mini-web示例中无以下属性, 暂时全部设为true. --//
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		accountNonLocked = true;
		
//		UserInfoSession adminSession = new UserInfoSession(emp,
//				emp.getLoginName(), emp.getPassword(), enabled, accountNonExpired, credentialsNonExpired,
//				accountNonLocked, grantedAuths);
		

//		return adminSession;
		return null;
	}

	/**
	 * 获得用户所有角色的权限集合.
	 */
//	private Set<GrantedAuthority> obtainGrantedAuthorities(List<Authority> authorityList) {
//		Set<GrantedAuthority> authSet = Sets.newHashSet();
//	
//		for(Authority authority: authorityList) {
//			authSet.add(new GrantedAuthorityImpl(authority.getAuthorityKey()));
//		}
//		
//		return authSet;
//	}
	
}
