package com.base.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;

import org.apache.struts2.json.JSONException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

import com.terrence.core.dol.security.UserInfoSession;

public class SpringSecurityUtil {
	/**
	 * 取得当前用户的登录名, 如果当前用户未登录则返回空字符串.
	 */
	public static String getCurrentUserName() {
		SecurityContext context = SecurityContextHolder.getContext();
		if (context != null) {
			Authentication authentication = context.getAuthentication();
			if (authentication != null)
				return authentication.getName();
		}
		return "";
	}

	/**
	 * 取得当前用户, 返回值为SpringSecurity的User类及其子类, 如果当前用户未登录则返回null.
	 */
	@SuppressWarnings("unchecked")
	public static <T extends User> T getCurrentUser() {
		SecurityContext context = SecurityContextHolder.getContext();
		if (context != null) {
			Authentication authentication = context.getAuthentication();
			if (authentication != null) {
				Object principal = authentication.getPrincipal();
				if (principal != null&&!(principal instanceof String))
					return (T) principal;
			}
		}
		return null;
	}

	public static String getCurrentRealName() {
		UserInfoSession user = getCurrentUser();
		if (user != null)
			return user.getUserInfo().getAdminName();

		return "";
	}
	
	
	
	public static Long getCurrentLoginId() {
		UserInfoSession user = getCurrentUser();
		if (user != null)
			return user.getUserInfo().getAdminId();

		return 0L;
	}
	
//	public static Integer getCurrentType() {
//		AdminSession user = getCurrentUser();
//		if (user != null)
//			return user.getAdmin().getType();
//
//		return -1;
//	}
//	public static Integer getCurrentTeamid() {
//		AdminSession user = getCurrentUser();
//		if (user != null)
//			return user.getAdmin().getTeamid();
//
//		return -1;
//	}
	
	

	public static Long getCurrentUserId() {
		UserInfoSession user = getCurrentUser();
		if (user != null)
			return user.getUserInfo().getAdminId();

		return -1l;
	}
	
//	public static Long getCurrentDutyId()
//	{
//		AdminSession user = getCurrentUser();
//		if (user != null)
//			return user.getAdmin().getDutyid();
//
//		return -1l;
//	}
	
	public static String getCurrentUserJson() {
		try {
			UserInfoSession user = getCurrentUser();
			if (user != null) {
				Collection<Pattern> excludeProperties = new ArrayList<Pattern>();
				// ^[\w\[\].]*fieldHandler,^[\w\[\].]*session
				excludeProperties.add(Pattern.compile("^[\\w\\[\\].]*fieldHandler"));
				excludeProperties.add(Pattern.compile("^[\\w\\[\\].]*session"));
				return org.apache.struts2.json.JSONUtil
						.serialize(user.getUserInfo(), excludeProperties, null, false, false);
			}

		} catch (JSONException e) {
			e.printStackTrace();
		}
		return "null";
	}
	
//	public static List<Authority> getCurrentUserAuthority() {
//		UserInfoSession user = getCurrentUser();
////		if (user != null)
////			return user.getAdmin().getAuthorityList();
//
//		return Collections.emptyList();
//	}
}
