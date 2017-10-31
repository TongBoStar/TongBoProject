package com.terrence.core.dol.service.impl;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.Menu;
import com.terrence.core.dol.dao.IMenuDao;
import com.terrence.core.dol.query.MenuQuery;
import com.terrence.core.dol.service.IMenuService;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.bean.security.AdminSession;
import com.terrence.crm.dol.utils.ConfigTerrence;

@Service
@Transactional
public class MenuService extends BaseService implements IMenuService {
	@Autowired
	@Qualifier("menuDao")
	private IMenuDao menuDao;

	@Override
	public Page<Menu> findPage(Page<Menu> page, MenuQuery query) throws ServiceException {
		return menuDao.findPage(page, query);
	}

	@Override
	public List<Menu> findList(MenuQuery query) throws ServiceException {
		return menuDao.findList(query);
	}

	@Override
	public List<Menu> findShowList(MenuQuery menuQuery) {
		return menuDao.findShowList(menuQuery);
	}

	@Override
	public LinkedHashMap<String, String> findAllToMap() throws ServiceException {
		// TODO Auto-generated method stub
		//TODO 临时注销一下
				/*String key = "ACTIVITY_" + PK + "_ALL_MAP";
				ICacheConn cacheConn = this.cacheEngine.getCacheConn(CacheNameConstants.ACTIVITY_AUTHORITY_CACHE);
				if (cacheConn != null) {
					LinkedHashMap<String, String> cacheMap = (LinkedHashMap<String, String>) cacheConn.get(key);
					
					if(cacheMap != null) {
						return cacheMap;
					}
				}*/
				MenuQuery query = new MenuQuery();
				query.setSortColumns("id desc");
				List<Menu> menuList = menuDao.findList(query);
				LinkedHashMap<String, String> requestMap = new LinkedHashMap<String, String>(menuList.size());
				for (Menu menu : menuList) {
		          requestMap.put(menu.getUrl(), menu.getKeywords());
				}
				
				/*if(cacheConn != null) {
					cacheConn.set(key, requestMap);
				}*/
				return requestMap;
	}

	@Override
	public Menu getById(Long id) throws ServiceException {
		return menuDao.getById(id);
	}
	
	public void saveOrUpdate(Menu entity) throws ServiceException {
		AdminSession admin = (AdminSession) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		if(entity.getId()!=null){
			this.menuDao.update(entity);
			operationLogDao.save(ConfigTerrence.MODEL_MENU_MANAGE,ConfigTerrence.OPT_EDIT, "修改菜单管理主键ID为:"+entity.getId()+"修改成功，操作人为"+admin.getAdmin().getAdminName());

		}else{
			this.menuDao.save(entity);
			operationLogDao.save(ConfigTerrence.MODEL_MENU_MANAGE,ConfigTerrence.OPT_ADD, "添加菜单管理菜单名称为:"+entity.getName()+"，操作人为"+admin.getAdmin().getAdminName());
		}
	}

	@Override
	public Integer deleteById(Long id) throws ServiceException {
		Integer returnValue = null;
		if(id!=null){
			returnValue = menuDao.deleteById(id);
		}
		AdminSession admin = (AdminSession) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		operationLogDao.save(ConfigTerrence.MODEL_MENU_MANAGE,ConfigTerrence.OPT_DEL, "删除菜单管理菜单名称主键为:"+id+"，操作人为"+admin.getAdmin().getAdminName());
		return returnValue;
	}

	@Override
	public Integer deleteByMultipleId(List<Long> idList)
			throws ServiceException {
		Integer returnValue = null;
		AdminSession admin = (AdminSession) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		if(idList!=null) {
			String delIds = StringUtils.join(idList, ",");
			returnValue = menuDao.deleteByMultipleId(delIds);
			operationLogDao.save(ConfigTerrence.MODEL_MENU_MANAGE,ConfigTerrence.OPT_DEL, "删除菜单管理菜单名称主键为:"+delIds+"，操作人为"+admin.getAdmin().getAdminName());
		}
		return returnValue;
	}

	@Override
	public List<Menu> findmenuList(MenuQuery query) {
		// TODO Auto-generated method stub
		return menuDao.findmenuList(query);
	}
}