package com.terrence.core.dol.security;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.access.intercept.DefaultFilterInvocationSecurityMetadataSource;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.access.intercept.RequestKey;
import org.springframework.security.web.util.AntUrlPathMatcher;
import org.springframework.security.web.util.UrlMatcher;
import org.springframework.stereotype.Service;

import com.terrence.core.dol.service.IMenuService;


/**
 * 提供LinkedHashMap<String, String>形式的URL及授权关系定义，
 * 并最终转为SpringSecurity所需的LinkedHashMap<RequestKey, ConfigAttributeDefinition>形式的定义.
 * 资源-授权查询服务
 * @see org.springframework.security.intercept.web.DefaultFilterInvocationDefinitionSource
 * 
 * @author allen
 *
 */
@Service("databaseDefinitionSource")
public class DefinitionSourceFactoryBean implements FactoryBean<Object>  {

	private static Logger logger = LoggerFactory.getLogger(DefinitionSourceFactoryBean.class);
	
	@Autowired
	@Qualifier("menuService")
	private IMenuService menuService;
	 
	public Object getObject() throws Exception {
		LinkedHashMap<RequestKey, Collection<ConfigAttribute>> requestMap = buildRequestMap();
        UrlMatcher matcher = getUrlMatcher();
        DefaultFilterInvocationSecurityMetadataSource metaSource = new DefaultFilterInvocationSecurityMetadataSource(matcher, requestMap);
        
        return metaSource;
	}

	@SuppressWarnings("unchecked")
	public Class getObjectType() {
		 return FilterInvocationSecurityMetadataSource.class;
	}

	public boolean isSingleton() {
		return true;
	}
	
	protected UrlMatcher getUrlMatcher() {
        return new AntUrlPathMatcher();
}

	 protected LinkedHashMap<RequestKey, Collection<ConfigAttribute>> buildRequestMap() throws Exception {
         LinkedHashMap<String, String> srcMap = menuService.findAllToMap();
         LinkedHashMap<RequestKey, Collection<ConfigAttribute>> distMap = new LinkedHashMap<RequestKey, Collection<ConfigAttribute>>();

         for (Map.Entry<String, String> entry : srcMap.entrySet()) {
                 RequestKey key = new RequestKey(entry.getKey(), null);
                 if (StringUtils.isNotBlank(entry.getValue())) {
                     distMap.put(key, SecurityConfig.createListFromCommaDelimitedString(entry.getValue()));
                 }
         }

         return distMap;
 }
}
