package com.terrence.crm.dol.service.security;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.google.common.collect.Sets;
import com.terrence.core.dol.bean.Menu;
import com.terrence.core.dol.bean.MenuOperate;
import com.terrence.core.dol.bean.RolePower;
import com.terrence.core.dol.service.IMenuService;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.bean.security.AdminSession;
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
	@Qualifier("menuService")
	private IMenuService menuService;

	/**
	 * 获取用户Details信息的回调函数.
	 */
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {

		Admin admin = adminService.getAdminRolesAndAuthorityByLoginName(username);
		if (admin == null) {
			throw new UsernameNotFoundException("用户名或密码错误");
		}
		//菜单
		List<Menu> authorityList = admin.getAuthorityList();
		admin.setAuthorityList(authorityList);
		List<MenuOperate> menuOperateList = admin.getMenuOperateList();
		admin.setMenuOperateList(menuOperateList);
		Set<GrantedAuthority> grantedAuths = obtainGrantedAuthorities(authorityList,menuOperateList);
		
		//-- mini-web示例中无以下属性, 暂时全部设为true. --//
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		accountNonLocked = admin.getStatus() == 0;
		
		AdminSession adminSession = new AdminSession(admin,
				admin.getLoginName(), admin.getPassword(), enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, grantedAuths);
		

		return adminSession;
	}

	/**
	 * 获得用户所有角色的权限集合.
	 */
	private Set<GrantedAuthority> obtainGrantedAuthorities(List<Menu> authorityList,List<MenuOperate> menuOperateList) {
		Set<GrantedAuthority> authSet = Sets.newHashSet();
		for(Menu menu: authorityList) {
			if(null!=menu.getKeywords()){
				authSet.add(new GrantedAuthorityImpl(menu.getKeywords()));
			}
		}
		for(MenuOperate menuOperate : menuOperateList){
			if(null!=menuOperate.getKeywords()){
				authSet.add(new GrantedAuthorityImpl(menuOperate.getKeywords()));
			}
		}
		return authSet;
	}
	
}
