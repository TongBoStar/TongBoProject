package com.terrence.crm.dol.service.impl;
import java.io.File;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Item;
import com.terrence.crm.dol.dao.IItemDao;
import com.terrence.crm.dol.query.ItemQuery;
import com.terrence.crm.dol.service.IItemService;
import com.terrence.crm.dol.utils.BarcodeUtil;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class ItemService extends BaseService implements IItemService {
	@Autowired
	@Qualifier("itemDao")
	private IItemDao itemDao;
	@Override
	public Item getById(Long id) throws ServiceException {
		return itemDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Item entity) throws ServiceException {
		entity.setItemUserId(SpringSecurityUtils.getCurrentUserId());
		entity.setCreateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
		String path = ServletActionContext.getServletContext().getRealPath("/stcode");
		File file = new File(path);
		if(!file.exists()){
			file.mkdir();
		}
		if(null!=entity.getSubjectCode()&&!"".equals(entity.getSubjectCode())){
			BarcodeUtil.generateFile(entity.getSubjectCode(), path+"/"+entity.getSubjectCode()+".jpg");
		}
		itemDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Item entity) throws ServiceException {
		return itemDao.save(entity);
	}
	@Override
	public Integer update(Item entity) throws ServiceException {
		return itemDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return itemDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = itemDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Item> findPage(Page<Item> page, ItemQuery query) throws ServiceException{
		return itemDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Item> findPage(Page<Item> page,String statement, ItemQuery query) throws ServiceException{
		return itemDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Item> findList(ItemQuery query) throws ServiceException{
		return itemDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Item> findList(ItemQuery query,Integer pageSize) throws ServiceException{
		return itemDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Item> findList(ItemQuery query,String statement,Integer pageSize) throws ServiceException{
		return itemDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Item> findAllList() throws ServiceException{
		return itemDao.findAllList();
	}
}
