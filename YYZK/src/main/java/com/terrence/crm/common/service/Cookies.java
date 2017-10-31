package com.terrence.crm.common.service;

import java.util.Enumeration;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The HTTP cookies management class.
 * 
 * @author harry.zu
 *
 */
public final class Cookies {
	private static final String COOKIE_REG = "(\\S+)=([^;]+);?[\\S\\s]*";
	private Properties mCookies; // Cookies container

	/**
	 * Constructor.
	 */
	public Cookies() {
		mCookies = new Properties();
	}

	/**
	 * toString method.
	 * 
	 * @return return a string which includes all cookies
	 */
	public String toString() {
		StringBuffer cookieStrBuf = new StringBuffer();
		Enumeration<Object> cookieNames = mCookies.keys();
		int i = 0;
		while (cookieNames.hasMoreElements()) {
			String cookieName = (String) cookieNames.nextElement();
			String cookieValue = mCookies.getProperty(cookieName);
			cookieStrBuf.append(cookieName + "=" + cookieValue);
			if (i < mCookies.size() - 1) {
				cookieStrBuf.append("; ");
			}

			i++;
		}

		return cookieStrBuf.toString();
	}

	/**
	 * Get the current count of cookies.
	 * 
	 * @return cookie size
	 */
	public int size() {
		return mCookies.size();
	}

	/**
	 * Add new cookie.
	 * 
	 * @param name
	 *            cookie name
	 * @param value
	 *            cookie value
	 * @param replace
	 *            if true, replace the current existing cookie with the same
	 *            name; if not, keep the existing cookie value and cancel new
	 *            cookie adding
	 */
	public void addCookie(final String name, final String value, final boolean replace) {
		if (replace || !mCookies.containsKey(name)) {
			if (name != null && name.length() > 0 && value != null) {
				mCookies.put(name, value);
			}
		}
	}

	/**
	 * add a cookie.
	 *
	 * @param cookieStr cookie string, like cookiename=cookievalue
	 * @param replace whether to replace
	 *
	 */
	public void addCookieNoReg(final String cookieStr, final boolean replace) {
		String[] s = cookieStr.split("=");
		addCookie(s[0], s[1], replace);
	}

	/**
	 * Add new cookie.
	 * 
	 * @param cookieStr
	 *            the cookie string (For example: cookieName=CookieValue;...)
	 * @param replace
	 *            if true, replace the current existing cookie with the same
	 *            name; if not, keep the existing cookie value and cancel new
	 *            cookie adding
	 */
	public void addCookie(final String cookieStr, final boolean replace) {
		Pattern patt = Pattern.compile(COOKIE_REG);
		Matcher matcher = patt.matcher(cookieStr);
		if (matcher.matches()) {
			String name = matcher.group(1);
			String value = matcher.group(2);
			addCookie(name, value, replace);
		}
	}

	/**
	 * Put the cookie value.
	 * 
	 * @param name
	 *            cookie name
	 * @param value
	 *            cookie value
	 */
	public void putCookie(final String name, final String value) {
		addCookie(name, value, true);
	}

	/**
	 * Put the cookie value.
	 * 
	 * @param cookieStr
	 *            the cookie string (For example: cookieName=CookieValue;...)
	 */
	public void putCookie(final String cookieStr) {
		addCookie(cookieStr, true);
	}
}
