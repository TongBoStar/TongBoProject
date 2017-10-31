package com.terrence.crm.dol.service.impl;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.ItemImgs;
import com.terrence.crm.dol.dao.IItemImgsDao;
import com.terrence.crm.dol.query.ItemImgsQuery;
import com.terrence.crm.dol.service.IItemImgsService;
import com.terrence.crm.dol.utils.DateUtils;
@Service
@Transactional
public class ItemImgsService extends BaseService implements IItemImgsService {
	@Autowired
	@Qualifier("itemImgsDao")
	private IItemImgsDao itemImgsDao;
	@Override
	public ItemImgs getById(Long id) throws ServiceException {
		return itemImgsDao.getById(id);
	}
	@Override
	public void saveOrUpdate(ItemImgs entity) throws ServiceException {
		JSONArray files = JSONArray.fromObject(entity.getFilesJson());
		//itemImgsDao.deleteByItemId(entity.getItemId());
		for (Object file : files) {
			JSONObject f = JSONObject.fromObject(file);
			entity.setImgPath(f.get("resPath").toString());
			entity.setShowIndexStatus(0);
			entity.setShowStatus(1);
			entity.setCreateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
			entity.setModifyTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
			itemImgsDao.save(entity);
		}
	}
	@Override
	public Long save(ItemImgs entity) throws ServiceException {
		return itemImgsDao.save(entity);
	}
	@Override
	public Integer update(ItemImgs entity) throws ServiceException {
		return itemImgsDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return itemImgsDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = itemImgsDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<ItemImgs> findPage(Page<ItemImgs> page, ItemImgsQuery query) throws ServiceException{
		return itemImgsDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<ItemImgs> findPage(Page<ItemImgs> page,String statement, ItemImgsQuery query) throws ServiceException{
		return itemImgsDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<ItemImgs> findList(ItemImgsQuery query) throws ServiceException{
		return itemImgsDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<ItemImgs> findList(ItemImgsQuery query,Integer pageSize) throws ServiceException{
		return itemImgsDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<ItemImgs> findList(ItemImgsQuery query,String statement,Integer pageSize) throws ServiceException{
		return itemImgsDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<ItemImgs> findAllList() throws ServiceException{
		return itemImgsDao.findAllList();
	}
	@Override
	public void updateIndexImg(ItemImgs entity) throws ServiceException {
		itemImgsDao.update("ItemImgs.UpdateByItemId", entity);
		entity.setShowIndexStatus(1);
		itemImgsDao.update(entity);
	}
}
