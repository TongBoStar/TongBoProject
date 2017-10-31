package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Wxinfo;
import com.terrence.crm.dol.query.WxinfoQuery;

public interface IWxinfoService {
	public Wxinfo getById(Long id) throws ServiceException;
	public void saveOrUpdate(Wxinfo entity) throws ServiceException;
	public Long save(Wxinfo entity) throws ServiceException;
	public Integer update(Wxinfo entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Wxinfo> findPage(Page<Wxinfo> page, WxinfoQuery query) throws ServiceException;
	public Page<Wxinfo> findPage(Page<Wxinfo> page,String statement, WxinfoQuery query) throws ServiceException;
	public List<Wxinfo> findList(WxinfoQuery query) throws ServiceException;
	public List<Wxinfo> findList(WxinfoQuery query,Integer pageSize) throws ServiceException;
	public List<Wxinfo> findList(WxinfoQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Wxinfo> findAllList() throws ServiceException;
	/**
	 * 更新token
	 */
	public void updateAccessToken();
	public void sendMsg(String serialNumber,String statusMark,Integer type,Double longitude,Double latitude,Long onlineTimes,Float fversion) throws ServiceException;
}
