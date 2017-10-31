/*
 * 
 */
package com.terrence.crm.dol.service.impl;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.nio.charset.UnsupportedCharsetException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.terrence.core.dol.bean.Menu;
import com.terrence.core.dol.bean.MenuOperate;
import com.terrence.core.dol.bean.Role;
import com.terrence.core.dol.bean.RolePower;
import com.terrence.core.dol.dao.IMenuDao;
import com.terrence.core.dol.dao.IMenuOperateDao;
import com.terrence.core.dol.dao.IRoleDao;
import com.terrence.core.dol.dao.IRolePowerDao;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.base.utils.BaseCodeUtils;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.bean.AdminImages;
import com.terrence.crm.dol.bean.AdminRole;
import com.terrence.crm.dol.bean.DeviceStatusModel;
import com.terrence.crm.dol.bean.DeviceStatusMsg;
import com.terrence.crm.dol.bean.ValueColor;
import com.terrence.crm.dol.bean.Wxinfo;
import com.terrence.crm.dol.bean.Yqcode;
import com.terrence.crm.dol.bean.security.AdminSession;
import com.terrence.crm.dol.dao.IAdminDao;
import com.terrence.crm.dol.dao.IAdminImagesDao;
import com.terrence.crm.dol.dao.IAdminRoleDao;
import com.terrence.crm.dol.dao.IWxinfoDao;
import com.terrence.crm.dol.dao.IYqcodeDao;
import com.terrence.crm.dol.query.AdminQuery;
import com.terrence.crm.dol.query.YqcodeQuery;
import com.terrence.crm.dol.service.IAdminService;
import com.terrence.crm.dol.utils.ConfigTerrence;
import com.terrence.crm.dol.utils.DateConvertUtils;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.NetUtils;
import com.terrence.crm.dol.utils.QRCodeUtil;
import com.terrence.crm.dol.utils.QRCodeUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;

/**
 * 管理员服务访问
 * 
 * @version 1.0
 */
@Service
@Transactional
public class AdminService extends BaseService implements IAdminService {

	protected static Logger logger = LoggerFactory.getLogger(AdminService.class);
	/** 管理员数据访问接口 */
	@Autowired
	@Qualifier("adminDao")
	private IAdminDao adminDao;
	
	/** 角色基本信息数据访问接口 */
	@Autowired
	@Qualifier("roleDao")
	private IRoleDao roleDao;
	
	/** 管理员角色基本信息数据访问接口 */
	@Autowired
	@Qualifier("adminRoleDao")
	private IAdminRoleDao adminRoleDao;
	
	@Autowired
	@Qualifier("menuDao")
	private IMenuDao menuDao;
	
	@Autowired
	@Qualifier("menuOperateDao")
	private IMenuOperateDao menuOperateDao;
	
	@Autowired
	@Qualifier("rolePowerDao")
	private IRolePowerDao rolePowerDao;
	@Autowired
	@Qualifier("wxinfoDao")
	private IWxinfoDao wxinfoDao;
	@Autowired
	@Qualifier("adminImagesDao")
	private IAdminImagesDao adminImagesDao;
	@Autowired
	@Qualifier("yqcodeDao")
	private IYqcodeDao yqcodeDao;
	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAdminService#deleteById(java.lang.Long)
	 */
	public Integer deleteById(java.lang.Long id) throws ServiceException {
		if(id == 1) {
			logger.warn("删除管理员失败，超级管理员不能删除");
			throw new ServiceException("删除管理员失败，超级管理员不能删除");
		}
		
		Integer returnValue = adminDao.deleteById(id);
		AdminSession admin = (AdminSession) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		operationLogDao.save(ConfigTerrence.MODEL_USER_MANAGE,ConfigTerrence.OPT_DEL, "删除的用户主键为:"+id+"，操作人为"+admin.getAdmin().getAdminName());		
		return returnValue;
		
	}
	
	public List<Admin> listfindAdmin(AdminQuery adminQuery) {
		return adminDao.listfindAdmin(adminQuery);
		
	}
	
	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAdminService#deleteByMultipleId(java.util.List)
	 */
	public Integer deleteByMultipleId(List<java.lang.Long> idList) throws ServiceException {
		if(idList.contains(1L)) {
			logger.warn("删除管理员失败，超级管理员不能删除");
			throw new ServiceException("删除管理员失败，超级管理员不能删除");
		}
		String delIds = StringUtils.join(idList, ",");
		//adminRoleDao.deleteByMultipleAdminId(delIds);
		Integer returnValue = adminDao.updateByMultipleId(delIds);
		AdminSession admin = (AdminSession) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		operationLogDao.save(ConfigTerrence.MODEL_USER_MANAGE,ConfigTerrence.OPT_DEL, "删除的用户主键为:"+delIds+"，操作人为"+admin.getAdmin().getAdminName());
		
		return returnValue;
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAdminService#findAllList()
	 */
	@Transactional(readOnly=true)
	public List<Admin> findAllList() throws ServiceException {
		return adminDao.findAllList();
	}
	/*自定义查询获得用户所对应的表名
	 * */
	@Transactional(readOnly=true)
	public List<HashMap> findAllUser() throws ServiceException {
		return adminDao.getallUser();
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAdminService#findList(com.disney.dol.vo.AdminQuery)
	 */
	@Transactional(readOnly=true)
	public List<Admin> findList(AdminQuery query) throws ServiceException {
		return adminDao.findList(query);
	}
	
	@Transactional(readOnly=true)
	public List<Admin> findListByDepart(AdminQuery query) throws ServiceException {
		return adminDao.findListByDepart(query);
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAdminService#findPage(com.disney.dol.base.core.Page, com.disney.dol.vo.AdminQuery)
	 */
	@Transactional(readOnly=true)
	public Page<Admin> findPage(Page<Admin> page, AdminQuery query) throws ServiceException {
		 
		/*List<Admin> returnList = Lists.newArrayList();*/
		Page<Admin> returnPage = adminDao.findPage(page, query);
		
		/*List<Admin> list = returnPage.getResult();*/
		
		/*for(Admin admin: list) {
			Long adminId = admin.getAdminId();
			List<Role> roleList = roleDao.findListByAdminId(adminId);
			admin.setRoleList(roleList);
			returnList.add(admin);
		}
		
		returnPage.setResult(returnList);*/
		return returnPage;
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAdminService#getById(java.lang.Long)
	 */
	@Transactional(readOnly=true)
	public Admin getById(java.lang.Long id) throws ServiceException {
		return adminDao.getById(id);
	}


	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAdminService#isUnique(java.lang.String, java.lang.Object, java.lang.Object)
	 */
	@Transactional(readOnly=true)
	public boolean isUnique(String uniquePropertyNames, Object newValue, Object oldValue) throws ServiceException {
		AdminQuery query = new AdminQuery();
		try {
			return adminDao.isUnique(query, uniquePropertyNames, newValue, oldValue);
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
	 * @see com.disney.dol.service.IAdminService#save(com.disney.dol.bean.Admin)
	 */
	public java.lang.Long save(Admin entity) throws ServiceException {
		AdminQuery query = new AdminQuery();
		
		Admin qAdmin = adminDao.getByLoginName(entity.getLoginName());
		if(qAdmin != null) {
			logger.warn("保存管理员失败，原因：{}登录名称重复", entity.getLoginName());
			throw new ServiceException("保存管理员失败，原因：" + entity.getLoginName() + "登录名称重复");
		}
		if(entity.getPassword() != null) {
			String psw = BaseCodeUtils.getMd5PasswordEncoder(entity.getPassword(), entity.getLoginName());
			entity.setPassword(psw);
		}
		
		Long adminId = adminDao.save(entity);
		for(Long roleId: entity.getRoleIdList()) {
			AdminRole adminRole = new AdminRole();
			adminRole.setAdminId(adminId);
			adminRole.setRoleId(roleId);
			adminRoleDao.save(adminRole);
		}
		
		
		return adminId;
		
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAdminService#saveOrUpdate(com.disney.dol.bean.Admin)
	 */
	public void saveOrUpdate(Admin entity) throws ServiceException {
		Long id=null;
		if(entity.getAdminId()!=null){
			id=entity.getAdminId();
		}
		Admin qAdmin = adminDao.getByLoginName(entity.getLoginName());

		if(qAdmin != null && !qAdmin.getAdminId().equals(entity.getAdminId()) ) {
			logger.warn("保存管理员失败，原因：{}登录名称重复", entity.getLoginName());
			throw new ServiceException("保存管理员失败，原因：" + entity.getLoginName() + "登录名称重复");
		}
		String time = DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss");
		if(entity.getAdminId() == null) {
			entity.setStatus(3);
			entity.setCreatedTime(time);
			entity.setModifiedTime(time);
			//entity.setLastLoginTime(time);
			entity.setType(3);
			if(null!=entity.getPassword()){
				String psw = BaseCodeUtils.getMd5PasswordEncoder(entity.getPassword(), entity.getLoginName());
				entity.setPassword(psw);
			}else{
				String psw = BaseCodeUtils.getMd5PasswordEncoder("123456", entity.getLoginName());
				entity.setPassword(psw);
			}
			
		} else {
			entity.setModifiedTime(time);
		}
		if(null==entity.getAdminId()){
			adminDao.save(entity);
		}else{
			adminDao.update(entity);
			entity.getAdminId();
		}
		adminRoleDao.deleteByAdminId(entity.getAdminId());
		for(Long roleId: entity.getRoleIdList()) {
			AdminRole adminRole = new AdminRole();
			adminRole.setAdminId(entity.getAdminId());
			adminRole.setRoleId(roleId);
			adminRoleDao.save(adminRole);
		}
	
		/*
		//省份修改
		AdminProvince adminPro = new AdminProvince();
		adminPro.setAdminId(entity.getAdminId());
		adminProvinceDao.delData(adminPro);//删除之前的数据
		
		if(entity.getProvinceids() != null){
			String sq = entity.getProvinceids();
			if(sq.length()>0){
			   String proList[] = sq.split(",");
			     
				for(int i = 0;i<proList.length;i++){
					AdminProvince ap = new AdminProvince();
//						if(entity.getApid()!=null && !entity.getApid().equals("") && !entity.getApid().equals("null")){
//							ap.setApid(entity.getApid());
//						}
						ap.setAdminId(entity.getAdminId());
					if(entity.getAreaid()!=null){
						ap.setAreaid(entity.getAreaid());
					}
					
						ap.setProvinceid(Long.valueOf(proList[i]).longValue());
					
					adminProvinceDao.save(ap);//保存修改后的新数据
				}
			}
		}*/
		AdminSession admin = (AdminSession) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		if(id==null){
			
			operationLogDao.save(ConfigTerrence.MODEL_USER_MANAGE,ConfigTerrence.OPT_ADD, "添加用户名称为:"+entity.getAdminName()+"，操作人为"+admin.getAdmin().getAdminName());
		}else{
			operationLogDao.save(ConfigTerrence.MODEL_USER_MANAGE,ConfigTerrence.OPT_EDIT, "修改用户名称为:"+entity.getAdminName()+"，操作人为"+admin.getAdmin().getAdminName());

		}	
	}

	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAdminService#update(com.disney.dol.bean.Admin)
	 */
	public Integer update(Admin entity) throws ServiceException {
		Admin qAdmin = adminDao.getByLoginName(entity.getLoginName());
		if(qAdmin != null && !qAdmin.getAdminId().equals(entity.getAdminId())) {
			logger.warn("保存管理员失败，原因：{}登录名称重复", entity.getLoginName());
			throw new ServiceException("保存管理员失败，原因：" + entity.getLoginName() + "登录名称重复");
		}
		
		if(entity.getPassword() != null) {
			String psw = BaseCodeUtils.getMd5PasswordEncoder(entity.getPassword(), entity.getLoginName());
			entity.setPassword(psw);
		}
		
		Integer count = adminDao.update(entity);
		
		adminRoleDao.deleteByAdminId(entity.getAdminId());
		for(Long roleId: entity.getRoleIdList()) {
			AdminRole adminRole = new AdminRole();
			adminRole.setAdminId(entity.getAdminId());
			adminRole.setRoleId(roleId);
			adminRoleDao.save(adminRole);
		}
		
		
		
		return count;
		
	}
	
	/* (non-Javadoc)
	 * @see com.disney.dol.service.IAdminService#getByLoginName(java.lang.String)
	 */
	@Transactional(readOnly=true)
	public Admin getByLoginName(java.lang.String loginName) throws ServiceException {
		return adminDao.getByLoginName(loginName);
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.service.IAdminService#getAdminRolesAndAuthorityByLoginName(java.lang.String)
	 */
	@Transactional(readOnly=true)
	public Admin getAdminRolesAndAuthorityByLoginName(String loginName)
			throws ServiceException {
		Admin admin = adminDao.getByLoginName(loginName);
		if(admin != null) {
			Long adminId = admin.getAdminId();
			List<Menu> authorityList = menuDao.findByUserId(adminId);
			admin.setAuthorityList(authorityList);
			List<MenuOperate> menuOperateList = menuOperateDao.findByUserId(adminId);
			admin.setMenuOperateList(menuOperateList);
		}
		return admin;
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.service.IAdminService#updateLastTime(com.disney.dol.bean.Admin)
	 */
	public Integer updateLastTime(Admin entity) throws ServiceException {
		return adminDao.update(entity);
	}

	@Override
	public Integer comparePwd(Admin entity,String pwd) throws ServiceException {
			Integer compare=0;
			System.out.println("pwd:"+BaseCodeUtils.getMd5PasswordEncoder(pwd,entity.getLoginName()));
			System.out.println("pwd2:"+entity.getPassword());
			if(BaseCodeUtils.getMd5PasswordEncoder(pwd,entity.getLoginName()).equals(entity.getPassword())){
				compare=1;
				return compare;
			}else{
				return compare;
			}
	}

	@Override
	public void updatePwd(Admin entity) throws ServiceException {

		Admin qAdmin = adminDao.getByLoginName(entity.getLoginName());

		if(qAdmin != null && !qAdmin.getAdminId().equals(entity.getAdminId()) ) {
			logger.warn("保存管理员失败，原因：{}登录名称重复", entity.getLoginName());
			throw new ServiceException("保存管理员失败，原因：" + entity.getLoginName() + "登录名称重复");
		}
		String time = DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss");
		if(entity.getAdminId() == null) {
			entity.setStatus(0);
			entity.setCreatedTime(time);
			entity.setModifiedTime(time);
			//entity.setLastLoginTime(time);
		} else {
			entity.setModifiedTime(time);
		}
		
		if(entity.getPassword() != null) {
			String psw = BaseCodeUtils.getMd5PasswordEncoder(entity.getPassword(), entity.getLoginName());
			entity.setPassword(psw);
		}
		adminDao.saveOrUpdate(entity);
	}

	@Override
	public List<Admin> findAdminId(AdminQuery adminQuery) {
		return adminDao.findAdminId(adminQuery);
	}

	@Override
	public List<Admin> findList(AdminQuery query, String statement)
			throws ServiceException {
		return adminDao.findList(statement,query);
	}

	@Override
	public void syncAdminERPData() throws ServiceException {
		adminDao.findAdminErp();
	}

	@Override
	public Admin findById(Admin minad) throws ServiceException {
		return adminDao.findById(minad);
	}

	@Override
	public List<Admin> findAdminSel(AdminQuery adminQuery)
			throws ServiceException {
		return adminDao.findAdminSel(adminQuery);
	}

	@Override
	public List<Admin> findAdminProcurement(AdminQuery adminQuery)
			throws ServiceException {
		return adminDao.findAdminProcurement(adminQuery);
	}

	@Override
	public Admin checkAdminByWxCode(AdminQuery adminQuery,HttpServletRequest request) throws Exception {
		Admin admin = adminDao.findAdminByWxCode(adminQuery);
		if(null==admin){
			Wxinfo wxinfo = wxinfoDao.getById(1L);
			admin = loadAdminInfoByWxCode(wxinfo.getAccess_token(),adminQuery.getWxCode(),request);
			if(null!=admin){
				adminDao.save(admin);
			}
		}
		return admin;
	}
	public Admin loadAdminInfoByWxCode(String accessToken,String openid,HttpServletRequest request){
		Admin admin;
		String time = DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss");
		try {
			String URL = "https://api.weixin.qq.com/cgi-bin/user/info?access_token="+accessToken+"&openid="+openid;
			//URLConnectionHelper是一个模拟发送http请求的类
			CloseableHttpClient client = HttpClients.createDefault();
			HttpPost post = new HttpPost(URL);
			post.addHeader("Content-Type","application/json");
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			String jsonStr = "";
			if(sc>=200&&sc<300) {
				jsonStr = EntityUtils.toString(resp.getEntity());
			}
			JSONObject jsonObj;
			jsonObj = new JSONObject(jsonStr);
			String headimgUrl = jsonObj.get("headimgurl").toString();
			String nickName = jsonObj.getString("nickname").toString();
			String sex = jsonObj.getString("sex").toString();
			String city = jsonObj.getString("city").toString();
			String province = jsonObj.getString("province").toString();
			String country = jsonObj.getString("country").toString();
			System.out.println(new String(nickName.getBytes("iso-8859-1"),"UTF-8"));
			System.out.println(new String(sex.getBytes("iso-8859-1"),"UTF-8"));
			System.out.println(new String(city.getBytes("iso-8859-1"),"UTF-8"));
			System.out.println(new String(country.getBytes("iso-8859-1"),"UTF-8"));
			admin = new Admin();
			admin.setWxCode(openid);
			NetUtils.download(headimgUrl, openid+".png", request.getSession().getServletContext().getRealPath("/upload/"));
			admin.setAdminName(new String(nickName.getBytes("iso-8859-1"),"UTF-8"));
			admin.setCountry(new String(country.getBytes("iso-8859-1"),"UTF-8"));
			admin.setProvince(new String(province.getBytes("iso-8859-1"),"UTF-8"));
			admin.setCity(new String(city.getBytes("iso-8859-1"),"UTF-8"));
			admin.setHeaderUrl("upload/"+openid+".png");
			admin.setCreatedTime(time);
			admin.setModifiedTime(time);
			return admin;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void saveAdmin(Admin entity) throws ServiceException {
		Long adminId;
		if(null!=entity.getAdminId()){
			 adminDao.update(entity);
			 adminId = entity.getAdminId();
		}else{
			AdminQuery adminQuery = new AdminQuery();
			adminQuery.setIdCard(entity.getIdCard());
			List<Admin> adminList = adminDao.findList(adminQuery);
			if(null!=adminList&&adminList.size()>0){
				throw new ServiceException("此身份证号已经注册,不能重复注册!");
			}
			synchronized(this){
				YqcodeQuery yq = new YqcodeQuery();
				yq.setFmark("YQ");
				List<Yqcode> list = yqcodeDao.findList(yq);
				entity.setCreatedTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
				entity.setAdminCode("YQ"+String.format("%0" + 6 + "d", Integer.parseInt("000") + list.get(0).getSeqno()));
				String psw = BaseCodeUtils.getMd5PasswordEncoder(entity.getPassword(), entity.getLoginName());
				entity.setPassword(psw);
				entity.setOrgId(1L);
				adminId = adminDao.save(entity);
				list.get(0).setSeqno(list.get(0).getSeqno()+1);
				yqcodeDao.update(list.get(0));
			}
		}
		JSONArray files = JSONArray.fromObject(entity.getFilesJson());
		AdminImages adminImages = null;
		if(null!=files&&files.size()>0){
			for (Object file : files) {
				net.sf.json.JSONObject f = net.sf.json.JSONObject.fromObject(file);
				adminImages = new AdminImages();
				adminImages.setImgPath(f.get("resPath").toString());
				adminImages.setImgName(f.get("oldName").toString());
				adminImages.setAdminId(adminId);
				adminImages.setCrateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
				adminImagesDao.save(adminImages);
			}
		}
	}

	@Override
	public void examineYunQuUser(Admin entity) throws ServiceException {
		Admin admin = adminDao.getById(entity.getAdminId());
		admin.setStatus(entity.getStatus());
		admin.setFremark(entity.getFremark());
		admin.setExamineTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
		adminDao.update(admin);
		String path = ServletActionContext.getServletContext().getRealPath("/qrcode");
    	// 判断文件夹是否存在,如果不存在则创建文件夹
    	File uploadFile = new File(path); 
    	if (!uploadFile.exists()) {
    		uploadFile.mkdir();
    	}
    	try {
    		if(admin.getStatus()==3){
    			QRCodeUtils.encode(admin.getAdminCode(),path+File.separator+"logo.jpg",path,true);
    		}
			sendExamineMsg(admin);
		} catch (Exception e) {
			throw new ServiceException("系统异常，请联系管理员");
		}
	}
	public void sendExamineMsg(Admin admin){
		try {
			String result;
			String tip;
			String fremark;
			String tourl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4bfe89447a0d8438&redirect_uri=http://www.yiyunzk.com/user/userinfo&response_type=code&scope=snsapi_base&state=regyunqujiaagin&connect_redirect=1#wechat_redirect";
			if(admin.getStatus()==1){//审核未通过
				result = "审核未通过";
				tip = "很抱歉,您的申请审核未通过,原因:"+admin.getFremark();
				fremark = "请点击该信息进入申请页面补全或修正材料";
			}else if(admin.getStatus()==3){//审核通过
				result = "审核通过";
				tip = "恭喜您,您的申请已审核通过";
				fremark = "请点击该信息登录云趣家系统";
				tourl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4bfe89447a0d8438&redirect_uri=http://www.yiyunzk.com/user/userinfo&response_type=code&scope=snsapi_base&state=saleagree&connect_redirect=1#wechat_redirect";
			}else{
				result = "";
				tip = "";
				fremark = "";
				tourl = "";
			}
			Wxinfo wxinfo = wxinfoDao.getById(1L);
			DeviceStatusMsg data = new DeviceStatusMsg();
			ValueColor title = new ValueColor(tip, "#173177");
			ValueColor item = new ValueColor("申请加入云趣家系统", "#173177");
			ValueColor vresult = new ValueColor(result, "#173177");
			ValueColor remark = new ValueColor(fremark, "#173177");
			data.setFirst(title);
			data.setKeyword1(item);
			data.setKeyword2(vresult);
			data.setRemark(remark);
			DeviceStatusModel mm = new DeviceStatusModel();
			mm.setTouser(admin.getWxCode());
			mm.setTemplate_id("6cA2igGgzcSERR3gMJyO0CphUTFob9WSQSvlo86hzKM");
			mm.setUrl(tourl);
			mm.setData(data);
			net.sf.json.JSONObject jsonMap = net.sf.json.JSONObject.fromObject(mm);
			String json = jsonMap.toString(); 
			CloseableHttpClient client = HttpClients.createDefault();
			String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
			url = url.replace("ACCESS_TOKEN", wxinfo.getAccess_token());
			HttpPost post = new HttpPost(url);
			post.addHeader("Content-Type","application/json");
			StringEntity param = new StringEntity(json, ContentType.create("application/json", "utf-8"));
			post.setEntity(param);
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			if(sc>=200&&sc<300) {
				System.out.println(EntityUtils.toString(resp.getEntity(),"utf-8"));
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		} catch (UnsupportedCharsetException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void wxlogin(AdminQuery adminQuery,HttpServletRequest request) throws ServiceException {
		String psw = BaseCodeUtils.getMd5PasswordEncoder(adminQuery.getPassword(), adminQuery.getLoginName());
		System.out.println("****************psw:"+psw);
		Admin admin = adminDao.getByLoginName(adminQuery.getLoginName());
		System.out.println("****************adminpwd:"+admin.getPassword());
		if(null!=admin&&psw.equals(admin.getPassword())){
			request.getSession().setAttribute("wxadmin", admin);
		}else{
			throw new ServiceException("用户名或密码不正确");
		}
		if(admin.getStatus()==0){
			throw new ServiceException("审核中,请耐心等待!");
		}
		if(admin.getStatus()==1){
			throw new ServiceException("审核未通过,请重新提交资料!");
		}
		if(null!=admin.getIssaleagree()&&admin.getIssaleagree()==0){
			throw new ServiceException("进入销售协议");
		}
		request.getSession().setAttribute("openid", admin.getWxCode());
		admin.setLastLoginTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
		adminDao.update(admin);
	}

	@Override
	public Admin findAdminByWxCode(AdminQuery adminQuery) throws ServiceException {
		return adminDao.findAdminByWxCode(adminQuery);
	}

	@Override
	public void updateAdminByWxcode(Admin entity) throws ServiceException {
		adminDao.update("Admin.update.bywxcode", entity);
		JSONArray files = JSONArray.fromObject(entity.getFilesJson());
		AdminImages adminImages = null;
		if(null!=files&&files.size()>0){
			for (Object file : files) {
				if(null==file||file.equals("null")){
					continue;
				}
				net.sf.json.JSONObject f = net.sf.json.JSONObject.fromObject(file);
				adminImages = new AdminImages();
				adminImages.setImgPath(f.get("resPath").toString());
				adminImages.setImgName(f.get("oldName").toString());
				adminImages.setAdminId(entity.getAdminId());
				adminImages.setCrateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
				adminImagesDao.save(adminImages);
			}
		}
	}

	@Override
	public void updateAgreeByWxcode(AdminQuery adminQuery)
			throws ServiceException {
		Admin admin = new Admin();
		admin.setWxCode(adminQuery.getWxCode());
		admin.setIssaleagree(adminQuery.getIssaleagree());
		admin.setSaleagreeTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
		adminDao.update("Admin.update.accessxieyi.bywxcode", admin);
	}
}