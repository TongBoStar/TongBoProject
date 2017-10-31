package com.terrence.crm.dol.dao;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.ItemImgs;

public interface IItemImgsDao extends IBaseDao<ItemImgs, java.lang.Long>{
	public ItemImgs getByProperty(String propertyName,Object propertyValue);
	/**
	 * 根据项目ID删除该项目下的图片
	 * @param itemId
	 * @throws Exception
	 */
	public void deleteByItemId(Integer itemId) throws ServiceException;
}
