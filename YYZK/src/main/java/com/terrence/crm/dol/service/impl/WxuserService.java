package com.terrence.crm.dol.service.impl;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Wxinfo;
import com.terrence.crm.dol.bean.Wxuser;
import com.terrence.crm.dol.dao.IWxinfoDao;
import com.terrence.crm.dol.dao.IWxuserDao;
import com.terrence.crm.dol.query.WxuserQuery;
import com.terrence.crm.dol.service.IWxuserService;
import com.terrence.crm.dol.utils.NetUtils;
@Service
@Transactional
public class WxuserService extends BaseService implements IWxuserService {
	@Autowired
	@Qualifier("wxuserDao")
	private IWxuserDao wxuserDao;
	@Autowired
	@Qualifier("wxinfoDao")
	private IWxinfoDao wxinfoDao;
	@Override
	public Wxuser getById(Long id) throws ServiceException {
		return wxuserDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Wxuser entity) throws ServiceException {
		wxuserDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Wxuser entity) throws ServiceException {
		return wxuserDao.save(entity);
	}
	@Override
	public Integer update(Wxuser entity) throws ServiceException {
		return wxuserDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return wxuserDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = wxuserDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Wxuser> findPage(Page<Wxuser> page, WxuserQuery query) throws ServiceException{
		return wxuserDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Wxuser> findPage(Page<Wxuser> page,String statement, WxuserQuery query) throws ServiceException{
		return wxuserDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Wxuser> findList(WxuserQuery query) throws ServiceException{
		return wxuserDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Wxuser> findList(WxuserQuery query,Integer pageSize) throws ServiceException{
		return wxuserDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Wxuser> findList(WxuserQuery query,String statement,Integer pageSize) throws ServiceException{
		return wxuserDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Wxuser> findAllList() throws ServiceException{
		return wxuserDao.findAllList();
	}
	@SuppressWarnings("rawtypes")
	public List<Wxuser> findList(String statement,WxuserQuery wxuserQuery) throws ServiceException{
		if("findUserInfoFromWx".equals(statement)){
			System.out.println("=======================0");
			List<Wxuser> listentity = wxuserDao.findAllList();
			List<String> listwx = new ArrayList<String>();
			if(null!=listentity){
				for(Wxuser wxuser:listentity){
					listwx.add(wxuser.getWxCode());
				}
			}
			System.out.println("=======================1");
			Wxinfo wxinfo = wxinfoDao.getById(1L);
			String access_token = wxinfo.getAccess_token();
			String path = ServletActionContext.getServletContext().getRealPath("/yywximg");
			File file = new File(path);
			if(!file.exists()){
				file.mkdir();
			}
			Wxuser wxuser;
			try {
				String url0 = "https://api.weixin.qq.com/cgi-bin/user/get?access_token="+access_token;
				CloseableHttpClient client = HttpClients.createDefault();
				HttpPost post = new HttpPost(url0);
				post.addHeader("Content-Type","application/json");
				CloseableHttpResponse resp = client.execute(post);
				int sc = resp.getStatusLine().getStatusCode();
				String jsonStr = "";
				if(sc>=200&&sc<300) {
					jsonStr = EntityUtils.toString(resp.getEntity());
				}
				org.json.JSONObject  jsonObj0;
				jsonObj0 = new org.json.JSONObject(jsonStr);
				int total = jsonObj0.getInt("total");
				JSONArray ja0 = jsonObj0.getJSONObject("data").getJSONArray("openid");
				System.out.println("=======================2"+ja0.length());
				for(int i=0;i<total;i++){
					try {
						String key = ja0.getString(i);
						if(listwx.contains(key)){
							continue;
						}
						String URL = "https://api.weixin.qq.com/cgi-bin/user/info?access_token="+access_token+"&openid="+key;
						//URLConnectionHelper是一个模拟发送http请求的类
						client = HttpClients.createDefault();
						post = new HttpPost(URL);
						post.addHeader("Content-Type","application/json");
						resp = client.execute(post);
						sc = resp.getStatusLine().getStatusCode();
						jsonStr = "";
						if(sc>=200&&sc<300) {
							jsonStr = EntityUtils.toString(resp.getEntity());
						}
						org.json.JSONObject  jsonObj;
						jsonObj = new org.json.JSONObject(jsonStr);
						String headimgUrl = jsonObj.get("headimgurl").toString();
						String nickName = jsonObj.getString("nickname").toString();
						nickName = String.valueOf(nickName.getBytes("GBK"));
						Integer sex = jsonObj.getInt("sex");
						String city = jsonObj.getString("city").toString();
						String province = jsonObj.getString("province").toString();
						//String country = jsonObj.getString("country").toString();
						wxuser = new Wxuser();
						wxuser.setWxCode(key);
						if(!"".equals(headimgUrl)){
							NetUtils.download(headimgUrl, key+".png", path);
						}
						wxuser.setNickname(new String(nickName.getBytes("iso-8859-1"),"UTF-8"));
						wxuser.setProvince(new String(province.getBytes("iso-8859-1"),"UTF-8"));
						wxuser.setCity(new String(city.getBytes("iso-8859-1"),"UTF-8"));
						wxuser.setHeaderurl("yywximg/"+key+".png");
						wxuser.setSex(sex);
						wxuserDao.save(wxuser);
						System.out.println("wxuser:"+wxuser);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}else{
			return wxuserDao.findList(statement, wxuserQuery);
		}
	}
}
