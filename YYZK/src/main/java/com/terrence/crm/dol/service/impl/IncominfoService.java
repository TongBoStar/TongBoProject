package com.terrence.crm.dol.service.impl;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.bean.Incominfo;
import com.terrence.crm.dol.bean.Order;
import com.terrence.crm.dol.bean.Wxinfo;
import com.terrence.crm.dol.bean.Wxrelative;
import com.terrence.crm.dol.bean.Yqcode;
import com.terrence.crm.dol.dao.IAdminDao;
import com.terrence.crm.dol.dao.IIncominfoDao;
import com.terrence.crm.dol.dao.IOrderDao;
import com.terrence.crm.dol.dao.IWxinfoDao;
import com.terrence.crm.dol.dao.IWxrelativeDao;
import com.terrence.crm.dol.dao.IYqcodeDao;
import com.terrence.crm.dol.query.AdminQuery;
import com.terrence.crm.dol.query.IncominfoQuery;
import com.terrence.crm.dol.query.OrderQuery;
import com.terrence.crm.dol.query.YqcodeQuery;
import com.terrence.crm.dol.service.IIncominfoService;
import com.terrence.crm.dol.utils.DateUtils;
@Service
@Transactional
public class IncominfoService extends BaseService implements IIncominfoService {
	@Autowired
	@Qualifier("incominfoDao")
	private IIncominfoDao incominfoDao;
	@Autowired
	@Qualifier("adminDao")
	private IAdminDao adminDao;
	@Autowired
	@Qualifier("yqcodeDao")
	private IYqcodeDao yqcodeDao;
	@Autowired
	@Qualifier("wxrelativeDao")
	private IWxrelativeDao wxrelativeDao;
	@Autowired
	@Qualifier("wxinfoDao")
	private IWxinfoDao wxinfoDao;
	@Autowired
	@Qualifier("orderDao")
	private IOrderDao orderDao;
	
	@Override
	public Incominfo getById(Long id) throws ServiceException {
		return incominfoDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Incominfo entity) throws ServiceException {
		if(null!=entity.getId()){
			incominfoDao.update(entity);
		}else{
			if(null!=entity.getAdminCode()){//二级开始
				entity.setCreateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
				entity.setFixAwards(200F);
				entity.setFscore(1F);
				entity.setFlevel(1);
				entity.setOrderStatus(1);
				entity.setIncomSource(1);
				entity.setAdminCode(entity.getAdminCode());
				incominfoDao.save(entity);
			}
			AdminQuery adminQuery = new AdminQuery();
			adminQuery.setAdminCode(entity.getAdminCode());
			Admin admin = adminDao.findAdminByAdminCode(adminQuery);
			Long adminId = admin.getAdminId();
			if(null!=admin.getUpUserId()){//二级开始
				admin = adminDao.getById(admin.getUpUserId());
				entity.setBelongUserId(adminId);
				entity.setFixAwards(null);
				entity.setFlevel(2);
				entity.setFirstAwards(50F);
				entity.setFscore(0.5F);
				entity.setAdminCode(admin.getAdminCode());
				incominfoDao.save(entity);
			}else{
				return;
			}
			if(null!=admin.getUpUserId()){//三级开始
				entity.setBelongUserId(admin.getAdminId());//这里位置固定
				admin = adminDao.getById(admin.getUpUserId());
				entity.setFirstAwards(null);
				entity.setFlevel(3);
				entity.setSecondAwards(25F);
				entity.setFscore(0.25F);
				entity.setAdminCode(admin.getAdminCode());
				incominfoDao.save(entity);
			}
		}
	}
	/**
	 * 临时备份
	 * @param entity
	 * @throws ServiceException
	 */
	//@Override
	public void saveOrUpdateBak(Incominfo entity) throws ServiceException {
		Long upUserId = entity.getBelongUserId();
		Long adminNewId = null;
		AdminQuery adminQuery = new AdminQuery();
		adminQuery.setWxCode(entity.getOrderWxCode());
		Admin admin = adminDao.findAdminByWxCode(adminQuery);
		if(null==admin){
			admin = new Admin();
			YqcodeQuery yq = new YqcodeQuery();
			yq.setFmark("YQ");
			List<Yqcode> list = yqcodeDao.findList(yq);
			admin.setAdminCode("YQ"+String.format("%0" + 6 + "d", Integer.parseInt("000") + list.get(0).getSeqno()));
			list.get(0).setSeqno(list.get(0).getSeqno()+1);
			yqcodeDao.update(list.get(0));
			admin.setType(2);
			admin.setStatus(0);
			admin.setWxCode(entity.getOrderWxCode());
			adminNewId = adminDao.save(admin);
		}else{
			adminNewId = admin.getAdminId();
		}
		if(null!=entity.getId()){
			incominfoDao.update(entity);
		}else{
			entity.setCreateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
			entity.setFixAwards(200F);
			entity.setFscore(1F);
			entity.setFlevel(1);
			entity.setOrderStatus(1);
			entity.setBelongUserId(null);
			entity.setAdminCode(admin.getAdminCode());
			incominfoDao.save(entity);
			if(null!=upUserId){//二级开始
				admin = adminDao.getById(upUserId);
				entity.setBelongUserId(adminNewId);
				entity.setFixAwards(null);
				entity.setFlevel(2);
				entity.setFirstAwards(50F);
				entity.setFscore(0.5F);
				entity.setAdminCode(admin.getAdminCode());
				incominfoDao.save(entity);
			}else if(null!=admin.getUpUserId()){//二级开始
				admin = adminDao.getById(admin.getUpUserId());
				entity.setBelongUserId(admin.getAdminId());
				entity.setFixAwards(null);
				entity.setFlevel(2);
				entity.setFirstAwards(50F);
				entity.setFscore(0.5F);
				entity.setAdminCode(admin.getAdminCode());
				incominfoDao.save(entity);
			}else{
				return;
			}
			if(null!=admin.getUpUserId()){//三级开始
				entity.setBelongUserId(admin.getAdminId());//这里位置固定
				admin = adminDao.getById(admin.getUpUserId());
				entity.setFirstAwards(null);
				entity.setFlevel(3);
				entity.setSecondAwards(25F);
				entity.setFscore(0.25F);
				entity.setAdminCode(admin.getAdminCode());
				incominfoDao.save(entity);
			}
		}
	}
	@Override
	public Long save(Incominfo entity) throws ServiceException {
		return incominfoDao.save(entity);
	}
	@Override
	public Integer update(Incominfo entity) throws ServiceException {
		return incominfoDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return incominfoDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = incominfoDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Incominfo> findPage(Page<Incominfo> page, IncominfoQuery query) throws ServiceException{
		return incominfoDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Incominfo> findPage(Page<Incominfo> page,String statement, IncominfoQuery query) throws ServiceException{
		return incominfoDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Incominfo> findList(IncominfoQuery query) throws ServiceException{
		return incominfoDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Incominfo> findList(IncominfoQuery query,Integer pageSize) throws ServiceException{
		return incominfoDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Incominfo> findList(IncominfoQuery query,String statement,Integer pageSize) throws ServiceException{
		return incominfoDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Incominfo> findAllList() throws ServiceException{
		return incominfoDao.findAllList();
	}

	@Override
	public void gragOrderInfo() throws ServiceException {
		try {
			Order orderTmp = orderDao.getLastTime();
			String startTime = (null==orderTmp||null==orderTmp.getCreateTime())?"2017-04-26 00:00:00":orderTmp.getCreateTime();
			Wxinfo wxinfo = wxinfoDao.getById(1L);
			String url = "https://api.weixin.qq.com/merchant/order/getbyfilter?access_token=ACCESS_TOKEN";
			SimpleDateFormat formt = new SimpleDateFormat("yyyy-MM-dd");
			url = url.replace("ACCESS_TOKEN",wxinfo.getAccess_token());
			// URLConnectionHelper是一个模拟发送http请求的类
			CloseableHttpClient client = HttpClients.createDefault();
			HttpPost post = new HttpPost(url);
			post.addHeader("Content-Type", "application/json");
			JSONObject jsonParam = new JSONObject();  
			//jsonParam.put("status", "");
			jsonParam.put("begintime", formt.parse(startTime).getTime()/1000);
			jsonParam.put("endtime", new Date().getTime()/1000);
			post.setEntity(new StringEntity(jsonParam.toString(), Charset.forName("UTF-8")));  
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			String jsonStr = "";
			if (sc >= 200 && sc < 300) {
				jsonStr = EntityUtils.toString(resp.getEntity(),"utf-8");
			}
			System.out.println(jsonStr);
			JSONObject jsonObj = new JSONObject(jsonStr);
			JSONArray ja = (JSONArray)jsonObj.get("order_list");
			String wxCode ;
			Wxrelative wl ;
			Order order = null;
			for(int i=0;i<ja.length();i++){
				jsonObj = ja.getJSONObject(i);
				wxCode = jsonObj.get("buyer_openid").toString();
				wl = wxrelativeDao.getByProperty("wxCode", wxCode);
				order = new Order();
				order.setCreateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
				order.setOrderCode(jsonObj.get("order_id").toString());
				order.setServiceReceiver(jsonObj.get("receiver_name").toString());
				order.setOrderStatus(jsonObj.getInt("order_status"));
				order.setFixTime(DateUtils.formtDateTime(new Date(jsonObj.getLong("order_create_time")*1000), "yyyy-MM-dd HH:mm:ss"));
				order.setUserTel(jsonObj.get("receiver_mobile").toString());
				order.setServiceAddress(jsonObj.get("receiver_address").toString());
				order.setServiceType(2);//1 来自淘宝的订单 2 来自微信小店的订单
				order.setWxProductId(jsonObj.get("product_id").toString());
				orderDao.save(order);
				if(null!=wl&&jsonObj.getInt("order_status")>2){
					Incominfo ii = new Incominfo();
					ii.setAdminCode(wl.getUpwxCode());
					ii.setIncomSource(2);
					ii.setOrderSource(2);
					saveOrUpdate(ii);
				}
				//System.out.println(jsonObj.get("order_id")+"=="+jsonObj.get("order_status")+"=="+jsonObj.get("order_create_time")
				//		+"=="+jsonObj.get("buyer_openid")+"=="+jsonObj.get("receiver_name")+"=="+jsonObj.get("receiver_mobile"));
			}
			OrderQuery orderQuery = new OrderQuery();
			orderQuery.setOrderStatus(2);
			List<Order> list = orderDao.findList(orderQuery);
			for(Order or:list){
				url = "https://api.weixin.qq.com/merchant/order/getbyid?access_token=ACCESS_TOKEN";
				url = url.replace("ACCESS_TOKEN",wxinfo.getAccess_token());
				// URLConnectionHelper是一个模拟发送http请求的类
				client = HttpClients.createDefault();
				post = new HttpPost(url);
				post.addHeader("Content-Type", "application/json");
				jsonParam = new JSONObject();  
				jsonParam.put("order_id", or.getOrderCode());
				post.setEntity(new StringEntity(jsonParam.toString(), Charset.forName("UTF-8")));  
				resp = client.execute(post);
				sc = resp.getStatusLine().getStatusCode();
				jsonStr = "";
				if (sc >= 200 && sc < 300) {
					jsonStr = EntityUtils.toString(resp.getEntity(),"utf-8");
				}
				jsonObj = new JSONObject(jsonStr);
				if(jsonObj.getJSONObject("order").getInt("order_status")>=2){
					or.setOrderStatus(jsonObj.getJSONObject("order").getInt("order_status"));
					orderDao.update(or);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}