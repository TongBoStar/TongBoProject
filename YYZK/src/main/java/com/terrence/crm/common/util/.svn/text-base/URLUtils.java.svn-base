package com.terrence.crm.common.util;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class URLUtils {
	 public static final int PARAM_APPEND = 0;// 直接追加参数，不考虑参数重名情况
	    public static final int PARAM_APPEND_MERGE = 1;// 若参数存在重名，则使用原有参数值
	    public static final int PARAM_REPLACE_MERGE = 2;// 若参数存在重名，则覆盖原有参数值
	    public static final int PARAM_REPLACE = 3;// 替换所有原有参数
	    public static final int PARAM_APPEND_MERGE_AND_MISC_DISCARD = 7;//若参数存在重名，则使用原有参数值并且丢弃梦网参数
	    public static final int PARAM_REPLACE_MERGE_AND_MISC_DISCARD = 8;//若参数存在重名，则覆盖原有参数值并且丢弃梦网参数
	    public static final int PARAM_DISCARD = 9;//丢弃所有请求参数
	    static Log log = LogFactory.getLog(URLUtils.class.getName());
	    private static final String SYMBOL_AND = "&";

	    /**
	     * @param baseURL
	     * @param queryString
	     * @return String
	     */
	    public static String appendQueryString(String baseURL, String queryString) {
	        return appendQueryString(baseURL, queryString, PARAM_APPEND);
	    }

	    /**
	     * @param baseURL
	     * @param queryString
	     * @param mergeType   参数合并方式
	     * @return String
	     */
	    public static String appendQueryString(String baseURL, String queryString,
	                                           int mergeType) {
	        if (log.isDebugEnabled()) {
	            log.debug("baseURL is " + baseURL);
	            log.debug("queryString is " + queryString);
	            log.debug("mergeType is " + mergeType);
	        }

	        if (mergeType == PARAM_DISCARD)
	            return baseURL;
	        // 实现四种参数追加方式
	        String url = baseURL;

	        if (StringUtils.isNotBlank(queryString)) {
	            if (mergeType == PARAM_REPLACE) {
	                if (url.indexOf("?") > 0)
	                    url = StringUtils.substringBefore(url, "?");
	                url += "?" + queryString;
	            } else if (mergeType == PARAM_APPEND_MERGE || mergeType == PARAM_REPLACE_MERGE) {

	                // else
	                if (!StringUtils.isEmpty(queryString)) {
	                    if (url.indexOf("?") == -1) {//如果有参数值,portalUrl也没有出现?,先补个?
	                        url += "?";
	                    }
	                    String targetUrlEntrys[] = StringUtils.split(queryString, "&");
	                    for (int i = 0; i < targetUrlEntrys.length; i++) {
	                        String parameterName = targetUrlEntrys[i].split("=")[0] + "=";
	                        if (url.indexOf("?" + parameterName) != -1 || url.indexOf("&" + parameterName) != -1) {
	                            if (mergeType == PARAM_REPLACE_MERGE) {
	                                int parameterIndex = url.indexOf(parameterName);
	                                String baseUrlParmaeter = StringUtils.substring(url, parameterIndex,
	                                        url.indexOf("&", parameterIndex) == -1 ? url.length() : url.indexOf("&", parameterIndex));
	                                url = StringUtils.replaceOnce(url, baseUrlParmaeter, targetUrlEntrys[i]);
	                            }
	                        } else {
	                            if (!url.endsWith("?"))
	                                url += "&";
	                            url += targetUrlEntrys[i];
	                        }
	                    }
	                }
	            } else if (mergeType == PARAM_APPEND_MERGE_AND_MISC_DISCARD || mergeType == PARAM_REPLACE_MERGE_AND_MISC_DISCARD) {
	                String[] u = StringUtils.splitPreserveAllTokens(url, "?");
	                if (u.length > 1 && StringUtils.isNotBlank(u[1])) {
	                    queryString = u[1] + SYMBOL_AND + queryString;
	                }

	                StringBuffer buffer = new StringBuffer("");
	                String[] pairs = StringUtils.split(queryString, SYMBOL_AND);
	                for (int i = 0; i < pairs.length; i++) {
	                    String pair = pairs[i];
	                    if (!pair.startsWith("MISC_")) {
	                        buffer.append(pair).append(SYMBOL_AND);
	                    }

	                }
	                String newParam = buffer.toString();
	                if (newParam.endsWith(SYMBOL_AND)) {
	                    newParam = StringUtils.substringBeforeLast(newParam, SYMBOL_AND);
	                }
	                if (mergeType == PARAM_REPLACE_MERGE_AND_MISC_DISCARD) {
	                    url = appendQueryString(u[0], newParam, PARAM_REPLACE_MERGE);
	                }
	                if (mergeType == PARAM_APPEND_MERGE_AND_MISC_DISCARD) {
	                    url = appendQueryString(u[0], newParam, PARAM_APPEND_MERGE);
	                }

	            } else {
	                // 缺省采用APPEND方式
	                if (url.indexOf("?") < 0)
	                    url += "?";
	                else if (!url.endsWith("?"))
	                    url += SYMBOL_AND;
	                url += queryString;
	            }
	        }
	        log.debug("after url is " + url);
	        return url;
	    }

}
