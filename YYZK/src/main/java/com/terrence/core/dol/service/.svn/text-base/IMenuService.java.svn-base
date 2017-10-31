package com.terrence.core.dol.service;

import java.util.LinkedHashMap;
import java.util.List;

import com.base.exception.ServiceException;
import com.terrence.core.dol.bean.Menu;
import com.terrence.core.dol.query.MenuQuery;
import com.terrence.crm.dol.base.core.Page;

public interface IMenuService {
	
	public Page<Menu> findPage(Page<Menu> page, MenuQuery query) throws ServiceException;
	
	public List<Menu> findList(MenuQuery query) throws ServiceException;
	
	public List<Menu> findShowList(MenuQuery menuQuery);
	
	/**
	 * 查询所有权限
	 * @return 权限Map，key：权限URL，value：权限标识
	 * @throws ServiceException
	 */
	public LinkedHashMap<String, String> findAllToMap() throws ServiceException;
	
	public Menu getById(Long id) throws ServiceException;
	public void saveOrUpdate(Menu entity) throws ServiceException;
	
	/**
	 * 根据菜单id删除菜单
	 */
	public Integer deleteById(java.lang.Long id) throws ServiceException;

	/**
	 * 根据菜单ids删除菜单
	 */
	public Integer deleteByMultipleId(List<java.lang.Long> idList) throws ServiceException;
	public List<Menu> findmenuList(MenuQuery query);

}
