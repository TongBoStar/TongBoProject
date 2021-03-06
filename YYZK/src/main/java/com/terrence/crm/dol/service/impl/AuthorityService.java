/*
 * 
 */
package com.terrence.crm.dol.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.bean.Authority;
import com.terrence.crm.dol.dao.IAuthorityDao;
import com.terrence.crm.dol.query.AuthorityQuery;
import com.terrence.crm.dol.service.IAuthorityService;

/**
 * 权限服务访问
 * 
 * @version 1.0
 */
@Service
@Transactional
public class AuthorityService implements IAuthorityService {

	/** 权限数据访问接口 */
	@Autowired
	@Qualifier("authorityDao")
	private IAuthorityDao authorityDao;
	
	/*@Autowired
	private CacheEngine cacheEngine;*/
	
	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAuthorityService#deleteById(java.lang.Long)
	 */
	public Integer deleteById(java.lang.Long id) throws ServiceException {
		return authorityDao.deleteById(id);
		
	}
	
	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAuthorityService#deleteByMultipleId(java.util.List)
	 */
	public Integer deleteByMultipleId(List<java.lang.Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		return authorityDao.deleteByMultipleId(delIds);
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAuthorityService#findAllList()
	 */
	@Transactional(readOnly=true)
	public List<Authority> findAllList() throws ServiceException {
		return authorityDao.findAllList();
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAuthorityService#findList(com.disney.dol.vo.AuthorityQuery)
	 */
	@Transactional(readOnly=true)
	public List<Authority> findList(AuthorityQuery query) throws ServiceException {
		return authorityDao.findList(query);
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAuthorityService#findPage(com.disney.dol.base.core.Page, com.disney.dol.vo.AuthorityQuery)
	 */
	@Transactional(readOnly=true)
	public Page<Authority> findPage(Page<Authority> page, AuthorityQuery query) throws ServiceException {
		return authorityDao.findPage(page, query);
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAuthorityService#getById(java.lang.Long)
	 */
	@Transactional(readOnly=true)
	public Authority getById(java.lang.Long id) throws ServiceException {
		return authorityDao.getById(id);
	}


	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAuthorityService#isUnique(java.lang.String, java.lang.Object, java.lang.Object)
	 */
	@Transactional(readOnly=true)
	public boolean isUnique(String uniquePropertyNames, Object newValue, Object oldValue) throws ServiceException {
		AuthorityQuery query = new AuthorityQuery();
		try {
			return authorityDao.isUnique(query, uniquePropertyNames, newValue, oldValue);
		} catch (DataAccessException e) {
			e.printStackTrace();
			throw new ServiceException(e.getMessage());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			throw new ServiceException(e.getMessage());
		} catch (InvocationTargetException e) {
			e.printStackTrace();
			throw new ServiceException(e.getMessage());
		}
		
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAuthorityService#save(com.disney.dol.bean.Authority)
	 */
	public java.lang.Long save(Authority entity) throws ServiceException {
		return authorityDao.save(entity);
		
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAuthorityService#saveOrUpdate(com.disney.dol.bean.Authority)
	 */
	public void saveOrUpdate(Authority entity) throws ServiceException {
		authorityDao.saveOrUpdate(entity);
		
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAuthorityService#update(com.disney.dol.bean.Authority)
	 */
	public Integer update(Authority entity) throws ServiceException {
		return authorityDao.update(entity);
		
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.service.IAuthorityService#findAllToMap()
	 */
	@SuppressWarnings("unchecked")
	@Transactional(readOnly=true)
	public LinkedHashMap<String, String> findAllToMap() throws ServiceException {
		//TODO 临时注销一下
		/*String key = "ACTIVITY_" + PK + "_ALL_MAP";
		ICacheConn cacheConn = this.cacheEngine.getCacheConn(CacheNameConstants.ACTIVITY_AUTHORITY_CACHE);
		if (cacheConn != null) {
			LinkedHashMap<String, String> cacheMap = (LinkedHashMap<String, String>) cacheConn.get(key);
			
			if(cacheMap != null) {
				return cacheMap;
			}
		}*/
		AuthorityQuery query = new AuthorityQuery();
		query.setSortColumns("position desc");
		List<Authority> authorityList = authorityDao.findList(query);
		LinkedHashMap<String, String> requestMap = new LinkedHashMap<String, String>(authorityList.size());
		for (Authority authority : authorityList) {
          requestMap.put(authority.getUrl(), authority.getAuthorityKey());
		}
		
		/*if(cacheConn != null) {
			cacheConn.set(key, requestMap);
		}*/
		return requestMap;
	}

	@Transactional(readOnly=true)
	public List<Authority> findAllByRoleId(Long roleId) throws ServiceException {
		return authorityDao.findAllByRoleId(roleId);
	}

	@Override
	public Page<Authority> findPage(String statement, Page<Authority> page,
			AuthorityQuery authorityQuery) throws ServiceException {
		
		return authorityDao.findPage(page, statement, authorityQuery); 
	}

	@Override
	public List<Authority> findlistAll(AuthorityQuery authorityQuery)  throws ServiceException {
		return authorityDao.findList("Authority.find.data",authorityQuery);
	}

	@Override
	public void updateData(Authority entity) throws ServiceException {
		authorityDao.update("Authority.update.new.data", entity);
	}

	@Override
	public void saveData(Authority entity) throws ServiceException {
		authorityDao.save(entity, "Authority.insert.save.data");
	}

	@Override
	public List<Admin> findAdminsByAuthority(Authority authority) {
		return authorityDao.findAdminsByAuthority(authority);
	}
	
	
	
}
