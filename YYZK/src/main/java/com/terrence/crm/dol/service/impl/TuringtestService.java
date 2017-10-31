package com.terrence.crm.dol.service.impl;
import java.util.Date;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;

import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Turingtest;
import com.terrence.crm.dol.dao.ITuringtestDao;
import com.terrence.crm.dol.query.TuringtestQuery;
import com.terrence.crm.dol.service.ITuringtestService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.turing.Aes;
import com.terrence.crm.dol.utils.turing.Md5;
import com.terrence.crm.dol.utils.turing.PostServer;
@Service
@Transactional
public class TuringtestService extends BaseService implements ITuringtestService {
	@Autowired
	@Qualifier("turingtestDao")
	private ITuringtestDao turingtestDao;
	@Override
	public Turingtest getById(Long id) throws ServiceException {
		return turingtestDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Turingtest entity) throws ServiceException {
		turingtestDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Turingtest entity) throws ServiceException {
		return turingtestDao.save(entity);
	}
	@Override
	public Integer update(Turingtest entity) throws ServiceException {
		return turingtestDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return turingtestDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = turingtestDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Turingtest> findPage(Page<Turingtest> page, TuringtestQuery query) throws ServiceException{
		return turingtestDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Turingtest> findPage(Page<Turingtest> page,String statement, TuringtestQuery query) throws ServiceException{
		return turingtestDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Turingtest> findList(TuringtestQuery query) throws ServiceException{
		return turingtestDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Turingtest> findList(TuringtestQuery query,Integer pageSize) throws ServiceException{
		return turingtestDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Turingtest> findList(TuringtestQuery query,String statement,Integer pageSize) throws ServiceException{
		return turingtestDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Turingtest> findAllList() throws ServiceException{
		return turingtestDao.findAllList();
	}
	public void testTuring() throws ServiceException{
		try {
			Turingtest turingtest = null;
			//图灵网站上的secret
			String secret = "f5e3e025a21b209b";
			//图灵网站上的apiKey
			String apiKey = "bdc6dd64786747159be53d5d1d331342";
			String cmd = "今天有什么新闻";//测试用例
			//待加密的json数据 ,\"userid\":\"123456\"
			String data = "{\"key\":\""+apiKey+"\",\"info\":\""+cmd+"\",\"userid\":\"72527114\"}";
			//获取时间戳
			String timestamp = String.valueOf(System.currentTimeMillis());
					
			//生成密钥
			String keyParam = secret+timestamp+apiKey;
			String key = Md5.MD5(keyParam);
					
			//加密
			Aes mc = new Aes(key);
			data = mc.encrypt(data);		
					
			//封装请求参数
			JSONObject json = new JSONObject();
			json.put("key", apiKey);
			json.put("timestamp", timestamp);
			json.put("data", data);
			//请求图灵api
			String result = PostServer.SendPost(json.toString(), "http://www.tuling123.com/openapi/api");
			System.out.println("result:"+result);
			turingtest = new Turingtest();
			turingtest.setCreateTime(DateUtils.formtDateTime(new Date(), "yyy-MM-dd HH:mm:ss"));
			turingtest.setFask(cmd);
			turingtest.setFcontent(result);
			turingtest.setModelName("新闻");
			JSONObject jsonObj = new JSONObject(result);
			if(jsonObj.has("url")&&jsonObj.get("code").equals(200000)){
				turingtest.setFstatus(1);
				turingtest.setFanswer((String)jsonObj.get("text")+" "+(String)jsonObj.get("url"));
			}else{
				turingtest.setFstatus(0);
				turingtest.setFanswer(jsonObj.get("code")+",list:"+jsonObj.has("list"));
			}
			turingtestDao.save(turingtest);
			
			cmd = "刘德华的忘情水";
			data = "{\"key\":\""+apiKey+"\",\"info\":\""+cmd+"\",\"userid\":\"72527114\"}";
			timestamp = String.valueOf(System.currentTimeMillis());
			keyParam = secret+timestamp+apiKey;
			key = Md5.MD5(keyParam);
			mc = new Aes(key);
			data = mc.encrypt(data);		
			//封装请求参数
			json = new JSONObject();
			json.put("key", apiKey);
			json.put("timestamp", timestamp);
			json.put("data", data);
			result = PostServer.SendPost(json.toString(), "http://www.tuling123.com/openapi/api");
			turingtest = new Turingtest();
			turingtest.setCreateTime(DateUtils.formtDateTime(new Date(), "yyy-MM-dd HH:mm:ss"));
			turingtest.setFask(cmd);
			turingtest.setFcontent(result);
			turingtest.setModelName("歌曲");
			jsonObj = new JSONObject(result);
			if(jsonObj.has("function")&&jsonObj.get("code").equals(313000)){
				turingtest.setFstatus(1);
				JSONObject function = new JSONObject(jsonObj.get("function").toString());
				turingtest.setFanswer((String)function.get("singer")+" "+(String)function.get("song"));
			}else{
				turingtest.setFstatus(0);
				turingtest.setFanswer(jsonObj.get("code")+",function:"+jsonObj.has("function"));
			}
			turingtestDao.save(turingtest);
			
			cmd = "背诵一首李白的静夜思";
			data = "{\"key\":\""+apiKey+"\",\"info\":\""+cmd+"\",\"userid\":\"72527114\"}";
			timestamp = String.valueOf(System.currentTimeMillis());
			keyParam = secret+timestamp+apiKey;
			key = Md5.MD5(keyParam);
			mc = new Aes(key);
			data = mc.encrypt(data);		
			//封装请求参数
			json = new JSONObject();
			json.put("key", apiKey);
			json.put("timestamp", timestamp);
			json.put("data", data);
			result = PostServer.SendPost(json.toString(), "http://www.tuling123.com/openapi/api");
			turingtest = new Turingtest();
			turingtest.setCreateTime(DateUtils.formtDateTime(new Date(), "yyy-MM-dd HH:mm:ss"));
			turingtest.setFask(cmd);
			turingtest.setFcontent(result);
			turingtest.setModelName("唐诗");
			jsonObj = new JSONObject(result);
			if(jsonObj.has("function")&&jsonObj.get("code").equals(314000)){
				turingtest.setFstatus(1);
				JSONObject function = new JSONObject(jsonObj.get("function").toString());
				turingtest.setFanswer((String)function.get("author")+" "+(String)function.get("name"));
			}else{
				turingtest.setFstatus(0);
				turingtest.setFanswer(jsonObj.get("code")+",function:"+jsonObj.has("function"));
			}
			turingtestDao.save(turingtest);
			
			cmd = "背诵一首苏轼的赤壁怀古";
			data = "{\"key\":\""+apiKey+"\",\"info\":\""+cmd+"\",\"userid\":\"72527114\"}";
			timestamp = String.valueOf(System.currentTimeMillis());
			keyParam = secret+timestamp+apiKey;
			key = Md5.MD5(keyParam);
			mc = new Aes(key);
			data = mc.encrypt(data);		
			//封装请求参数
			json = new JSONObject();
			json.put("key", apiKey);
			json.put("timestamp", timestamp);
			json.put("data", data);
			result = PostServer.SendPost(json.toString(), "http://www.tuling123.com/openapi/api");
			turingtest = new Turingtest();
			turingtest.setCreateTime(DateUtils.formtDateTime(new Date(), "yyy-MM-dd HH:mm:ss"));
			turingtest.setFask(cmd);
			turingtest.setFcontent(result);
			turingtest.setModelName("宋词");
			jsonObj = new JSONObject(result);
			if(jsonObj.has("function")&&jsonObj.get("code").equals(314000)){
				turingtest.setFstatus(1);
				JSONObject function = new JSONObject(jsonObj.get("function").toString());
				turingtest.setFanswer((String)function.get("author")+" "+(String)function.get("name"));
			}else{
				turingtest.setFstatus(0);
				turingtest.setFanswer(jsonObj.get("code")+",function:"+jsonObj.has("function"));
			}
			turingtestDao.save(turingtest);
			
			cmd = "土豆排骨怎么做";
			data = "{\"key\":\""+apiKey+"\",\"info\":\""+cmd+"\",\"userid\":\"72527114\"}";
			timestamp = String.valueOf(System.currentTimeMillis());
			keyParam = secret+timestamp+apiKey;
			key = Md5.MD5(keyParam);
			mc = new Aes(key);
			data = mc.encrypt(data);		
			//封装请求参数
			json = new JSONObject();
			json.put("key", apiKey);
			json.put("timestamp", timestamp);
			json.put("data", data);
			result = PostServer.SendPost(json.toString(), "http://www.tuling123.com/openapi/api");
			turingtest = new Turingtest();
			turingtest.setCreateTime(DateUtils.formtDateTime(new Date(), "yyy-MM-dd HH:mm:ss"));
			turingtest.setFask(cmd);
			turingtest.setFcontent(result);
			turingtest.setModelName("菜谱");
			jsonObj = new JSONObject(result);
			if(jsonObj.has("url")&&jsonObj.get("code").equals(200000)){
				turingtest.setFstatus(1);
				turingtest.setFanswer((String)jsonObj.get("text")+" "+(String)jsonObj.get("url"));
			}else{
				turingtest.setFstatus(0);
				turingtest.setFanswer(jsonObj.get("code")+",function:"+jsonObj.has("function"));
			}
			turingtestDao.save(turingtest);
			
			cmd = "你还好吗";
			data = "{\"key\":\""+apiKey+"\",\"info\":\""+cmd+"\",\"userid\":\"72527114\"}";
			timestamp = String.valueOf(System.currentTimeMillis());
			keyParam = secret+timestamp+apiKey;
			key = Md5.MD5(keyParam);
			mc = new Aes(key);
			data = mc.encrypt(data);		
			//封装请求参数
			json = new JSONObject();
			json.put("key", apiKey);
			json.put("timestamp", timestamp);
			json.put("data", data);
			result = PostServer.SendPost(json.toString(), "http://www.tuling123.com/openapi/api");
			jsonObj = new JSONObject(result);
			turingtest = new Turingtest();
			turingtest.setCreateTime(DateUtils.formtDateTime(new Date(), "yyy-MM-dd HH:mm:ss"));
			turingtest.setFask(cmd);
			turingtest.setFcontent(result);
			turingtest.setFanswer(jsonObj.getString("text"));
			turingtest.setModelName("普通问答");
			if(jsonObj.get("code").equals(100000)){
				turingtest.setFstatus(1);
			}
			turingtestDao.save(turingtest);
			
			cmd = "彩虹是怎么形成的";
			data = "{\"key\":\""+apiKey+"\",\"info\":\""+cmd+"\",\"userid\":\"72527114\"}";
			timestamp = String.valueOf(System.currentTimeMillis());
			keyParam = secret+timestamp+apiKey;
			key = Md5.MD5(keyParam);
			mc = new Aes(key);
			data = mc.encrypt(data);		
			//封装请求参数
			json = new JSONObject();
			json.put("key", apiKey);
			json.put("timestamp", timestamp);
			json.put("data", data);
			result = PostServer.SendPost(json.toString(), "http://www.tuling123.com/openapi/api");
			jsonObj = new JSONObject(result);
			turingtest = new Turingtest();
			turingtest.setCreateTime(DateUtils.formtDateTime(new Date(), "yyy-MM-dd HH:mm:ss"));
			turingtest.setFask(cmd);
			turingtest.setFcontent(result);
			turingtest.setFanswer(jsonObj.getString("text"));
			turingtest.setModelName("百科问答");
			if(jsonObj.get("code").equals(100000)){
				turingtest.setFstatus(1);
			}
			turingtestDao.save(turingtest);
			
			cmd = "欣欣向荣是什么意思";
			data = "{\"key\":\""+apiKey+"\",\"info\":\""+cmd+"\",\"userid\":\"72527114\"}";
			timestamp = String.valueOf(System.currentTimeMillis());
			keyParam = secret+timestamp+apiKey;
			key = Md5.MD5(keyParam);
			mc = new Aes(key);
			data = mc.encrypt(data);		
			//封装请求参数
			json = new JSONObject();
			json.put("key", apiKey);
			json.put("timestamp", timestamp);
			json.put("data", data);
			result = PostServer.SendPost(json.toString(), "http://www.tuling123.com/openapi/api");
			jsonObj = new JSONObject(result);
			turingtest = new Turingtest();
			turingtest.setCreateTime(DateUtils.formtDateTime(new Date(), "yyy-MM-dd HH:mm:ss"));
			turingtest.setFask(cmd);
			turingtest.setFcontent(result);
			turingtest.setFanswer(jsonObj.getString("text"));
			turingtest.setModelName("词语解释");
			if(jsonObj.get("code").equals(100000)){
				turingtest.setFstatus(1);
			}
			turingtestDao.save(turingtest);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
