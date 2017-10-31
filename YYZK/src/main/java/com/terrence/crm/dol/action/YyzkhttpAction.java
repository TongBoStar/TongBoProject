package com.terrence.crm.dol.action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Scope;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.terrence.crm.dol.base.CrudActionSupport;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.base.utils.Struts2Utils;
import com.terrence.crm.dol.service.ICourseDetailService;
import com.terrence.crm.dol.service.ICourseService;
import com.terrence.crm.dol.service.IInteractGameService;
import com.terrence.crm.dol.service.IInteractGameentryService;
import com.terrence.crm.dol.service.IStcodeService;
import com.terrence.crm.dol.service.IWxinfoService;
import com.terrence.crm.dol.service.IYiyunupdateService;
import com.terrence.crm.dol.service.IYqkService;
import com.terrence.crm.dol.service.IYqkitemService;
import com.terrence.crm.dol.service.IYqtService;
import com.terrence.crm.dol.service.IYyzkhttpService;
import com.terrence.crm.dol.bean.Course;
import com.terrence.crm.dol.bean.CourseDetail;
import com.terrence.crm.dol.bean.InteractGame;
import com.terrence.crm.dol.bean.InteractGameentry;
import com.terrence.crm.dol.bean.Stcode;
import com.terrence.crm.dol.bean.Wxinfo;
import com.terrence.crm.dol.bean.Yiyunupdate;
import com.terrence.crm.dol.bean.Yqk;
import com.terrence.crm.dol.bean.Yqkitem;
import com.terrence.crm.dol.bean.Yqt;
import com.terrence.crm.dol.bean.Yyzkhttp;
import com.terrence.crm.dol.query.CourseDetailQuery;
import com.terrence.crm.dol.query.CourseQuery;
import com.terrence.crm.dol.query.InteractGameQuery;
import com.terrence.crm.dol.query.InteractGameentryQuery;
import com.terrence.crm.dol.query.StcodeQuery;
import com.terrence.crm.dol.query.WxinfoQuery;
import com.terrence.crm.dol.query.YiyunupdateQuery;
import com.terrence.crm.dol.query.YqkQuery;
import com.terrence.crm.dol.query.YqkitemQuery;
import com.terrence.crm.dol.query.YqtQuery;
import com.terrence.crm.dol.query.YyzkhttpQuery;
/**
 * tongbo
 * @version 1.0
 */
@Scope("prototype")
@Namespace("/yyzkhttp")
@Results( { @Result(name = CrudActionSupport.RELOAD, location = "yyzkhttp."+ CrudActionSupport.ACTIONSUFFIX
		+ "?page.pageRequest=${page.pageRequest}", type = "redirect") })
public class YyzkhttpAction extends CrudActionSupport<Yyzkhttp> implements ApplicationContextAware {

	@Autowired
	@Qualifier("yyzkhttpService")
	private IYyzkhttpService yyzkhttpService;
	@Autowired
	@Qualifier("yqkitemService")
	private IYqkitemService yqkitemService;
	@Autowired
	@Qualifier("yqkService")
	private IYqkService yqkService;
	@Autowired
	@Qualifier("yqtService")
	private IYqtService yqtService;
	@Autowired
	@Qualifier("courseService")
	private ICourseService courseService;
	@Autowired
	@Qualifier("courseDetailService")
	private ICourseDetailService courseDetailService;
	@Autowired
	@Qualifier("interactGameentryService")
	private IInteractGameentryService interactGameentryService;
	@Autowired
	@Qualifier("interactGameService")
	private IInteractGameService interactGameService;
	@Autowired
	@Qualifier("yiyunupdateService")
	private IYiyunupdateService yiyunupdateService;
	@Autowired
	@Qualifier("wxinfoService")
	private IWxinfoService wxinfoService;
	@Autowired
	@Qualifier("stcodeService")
	private IStcodeService stcodeService;
	
	private WxinfoQuery wxinfoQuery;
	private YiyunupdateQuery yiyunupdateQuery;
	private InteractGameQuery interactGameQuery;
	private InteractGameentryQuery interactGameentryQuery;
	private CourseDetailQuery courseDetailQuery;
	private CourseQuery courseQuery;
	private YqtQuery yqtQuery;
	private YqkQuery yqkQuery;
	private YqkitemQuery yqkitemQuery;
	private StcodeQuery stcodeQuery;
	
	/*private Wxinfo wxinfo;
	private Yiyunupdate yiyunupdate;
	private InteractGame interactGame;
	private InteractGameentry interactGameentry;
	private CourseDetail courseDetail;
	private Course course;
	private Yqt yqt;
	private Yqk yqk;
	private Yqkitem yqkitem;*/

	private String urlType;
	private String key;
	private String secret;
	
	private String serialNumber;
	private String statusMark;
	private Integer type;
	private Double longitude;//经度
	private Double latitude ;//纬度
	private Long onlineTimes;//在线时长
	private Float fversion;//版本号
	
	
	private Yyzkhttp entity;

	private YyzkhttpQuery yyzkhttpQuery;

	private java.lang.Long yyzkhttpId;

	/** 分页器 */
	private Page<Yyzkhttp> page = new Page<Yyzkhttp>();

	/** Json操作信息 */
	private String[] resultInfo = new String[3];

	/** 所选择的编号列表 */
	private List<java.lang.Long> checkedIdList;

	private ApplicationContext ctx;
	private List<Yyzkhttp> yyzkhttpList;

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#prepareModel()
	 */
	@Override
	protected void prepareModel() throws Exception {
		if (yyzkhttpId != null) {
			entity = yyzkhttpService.getById(yyzkhttpId);
		} else {
			entity = new Yyzkhttp();
		}
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#delete()
	 */
	@Override
	public String delete() throws Exception {
		try {
			if(null!=checkedIdList && checkedIdList.size()>0){
				yyzkhttpService.deleteByMultipleId(checkedIdList);
			}else{
				yyzkhttpService.deleteById(yyzkhttpId);
			}
			resultInfo[0] = "0";
			resultInfo[1] = "删除成功";
			addActionMessage("删除成功");
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "删除失败";
			addActionMessage("删除失败");
		}
		return RELOAD;
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#deleteToJson()
	 */
	public String deleteToJson() throws Exception {
		try {
			delete();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "删除失败";
		}
		return JSON;
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#input()
	 */
	@Override
	public String input() throws Exception {
		return INPUT;
	}

	public String listToQuery() throws Exception {
		if (yyzkhttpQuery == null) {
			yyzkhttpQuery = new YyzkhttpQuery();
		}
		try {
			yyzkhttpList = yyzkhttpService.findList(yyzkhttpQuery);
			resultInfo[0] = "0";
			resultInfo[1] = "查询列表成功";
		} catch (ServiceException e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询列表失败";
		}
		return JSON;
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#list()
	 */
	@Override
	public String list() throws Exception {
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.DESC);
		}
		if (yyzkhttpQuery == null) {
			yyzkhttpQuery = new YyzkhttpQuery();
		}
		try {
			page = yyzkhttpService.findPage(page, yyzkhttpQuery);
			resultInfo[0] = "0";
			resultInfo[1] = "查询列表成功";
		} catch (ServiceException e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询列表失败";
		}
		return SUCCESS;
	}

    /**
     * 查询列表
     * @return
     * @throws Exception
     */
	public String listQuery() throws Exception {
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.DESC);
		}
		if (yyzkhttpQuery == null) {
			yyzkhttpQuery = new YyzkhttpQuery();
		}
		try {
			yyzkhttpList = yyzkhttpService.findList(yyzkhttpQuery);
			resultInfo[0] = "0";
			resultInfo[1] = "查询列表成功";
		} catch (ServiceException e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询列表失败";
		}
		return SUCCESS;
	}

	public String listToJson() throws Exception {
		try {
			list();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询列表失败";
		}
		return JSON;
	}

	public String listToJsonQuery() throws Exception {
		try {
			listQuery();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询列表失败";
		}
		return JSON;
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#save()
	 */
	@Override
	public String save() throws Exception {
		try {
			yyzkhttpService.saveOrUpdate(entity);
			resultInfo[0] = "0";
			resultInfo[1] = "操作成功";
			addActionMessage("操作成功");
		} catch (ServiceException e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "操作失败," + e.getMessage();
			addActionMessage("操作失败");
			return INPUT;
		}
		return RELOAD;
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#saveToJson()
	 */
	public String saveToJson() throws Exception {
		try {
			save();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "操作失败";
		}
		return JSON;
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#show()
	 */
	@Override
	public String show() throws Exception {
		try {
			entity = yyzkhttpService.getById(yyzkhttpId);
			resultInfo[0] = "0";
			resultInfo[1] = "查询成功";
		} catch (ServiceException e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch (Exception e) {
			logger.error(e.getMessage());
			
			resultInfo[0] = "-1";
			resultInfo[1] = "查询失败";
		}
		return SHOW;
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#showToJson()
	 */
	public String showToJson() throws Exception {
		try {
			show();
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询失败";
		}
		return JSON;
	}

	public String listAll() throws Exception {
		try {
			yyzkhttpList = yyzkhttpService.findAllList();
			resultInfo[0] = "0";
			resultInfo[1] = "操作成功";
		} catch (ServiceException e) {
			logger.warn("param error ", e);
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch (Exception e) {
			logger.warn("param error ", e);
			resultInfo[0] = "-1";
			resultInfo[1] = "操作失败";
		}
		return JSON;
	}
	
	//加载各个资源
	public String listResources() throws Exception {
		Map<String, String> yymap = new HashMap<String, String>();
		Map<String,Object> resultMap = new HashMap<String, Object>();
		try {
			yymap.put("yyzk", "e347194f28e34c788cf01702c536b3dc");
			if(null==key||"".equals(key)||null==secret||"".equals(secret)){
				resultInfo[0] = "0";
				resultInfo[1] = "key or secret不能为空";
				resultMap.put("resultInfo", resultInfo);
				Struts2Utils.renderJson(resultMap);
				return JSON;
			}
			if(null==yymap.get(key)||!yymap.get(key).equals(secret)){
				resultInfo[0] = "0";
				resultInfo[1] = "没通过验证";
				resultMap.put("resultInfo", resultInfo);
				Struts2Utils.renderJson(resultMap);
				return JSON;
			}
			if("YiYunListResources".equals(urlType)){
				List<Yqk> yqkList = yqkService.findList("Yqk.find.unsync.android",yqkQuery);
				List<Yqkitem> yqkitemList = yqkitemService.findList("YqkItem.find.unsync.android",yqkitemQuery);
				List<Yqt> yqtList = yqtService.findList("Yqt.find.unsync.android",yqtQuery);
				List<Course> courseList = courseService.findList("Course.find.unsync.android",courseQuery);
				List<CourseDetail> courseDetailList = courseDetailService.findList("CourseDetail.find.unsync.android",courseDetailQuery);
				List<InteractGame> interactGameList = interactGameService.findList("InteractGame.find.unsync.android",interactGameQuery);
				List<InteractGameentry> interactGameentryList = interactGameentryService.findList("InteractGameentry.find.unsync.android",interactGameentryQuery);
				resultMap.put("yqkList", yqkList);
				resultMap.put("yqtList", yqtList);
				resultMap.put("yqkitemList", yqkitemList);
				resultMap.put("courseList", courseList);
				resultMap.put("courseDetailList", courseDetailList);
				resultMap.put("interactGameList", interactGameList);
				resultMap.put("interactGameentryList", interactGameentryList);
				resultInfo[0] = "0";
				resultInfo[1] = "读取成功";
				resultMap.put("resultInfo", resultInfo);
				Struts2Utils.renderJson(resultMap);
			}else if("YiYunUpdateUnSync".equals(urlType)){
				List<Yiyunupdate> yiyunupdateList = yiyunupdateService.findList("Yiyunupdate.find.unsync.android",yiyunupdateQuery);
				StringBuffer s1 = new StringBuffer();
				StringBuffer s2 = new StringBuffer();
				StringBuffer s3 = new StringBuffer();
				StringBuffer s4 = new StringBuffer();
				StringBuffer s5 = new StringBuffer();
				StringBuffer s6 = new StringBuffer();
				StringBuffer s7 = new StringBuffer();
				if(null!=yiyunupdateList&&yiyunupdateList.size()>0){
					for(Yiyunupdate yiyunupdate:yiyunupdateList){
						resultMap.put("yiyunupdateIndex", yiyunupdate.getId());
						if("YqkItemMark".equals(yiyunupdate.getFtable())){
							s1.append(yiyunupdate.getFid()).append(",");
						}
						if("YqkMark".equals(yiyunupdate.getFtable())){
							s2.append(yiyunupdate.getFid()).append(",");
						}
						if("CourseMark".equals(yiyunupdate.getFtable())){
							s3.append(yiyunupdate.getFid()).append(",");
						}
						if("CourseDetailMark".equals(yiyunupdate.getFtable())){
							s4.append(yiyunupdate.getFid()).append(",");
						}
						if("InteractGameMark".equals(yiyunupdate.getFtable())){
							s5.append(yiyunupdate.getFid()).append(",");
						}
						if("InteractGameEntryMark".equals(yiyunupdate.getFtable())){
							s6.append(yiyunupdate.getFid()).append(",");
						}
						if("YqtMark".equals(yiyunupdate.getFtable())){
							s7.append(yiyunupdate.getFid()).append(",");
						}
					}
					if(s1.length()>0) {
						s1.deleteCharAt(s1.length()-1);
						yqkitemQuery = new YqkitemQuery();
						yqkitemQuery.setItemclassName(s1.toString());
						List<Yqkitem> yqkitemList = yqkitemService.findList("Yqkitem.findList.ids",yqkitemQuery);
						resultMap.put("yqkitemList", yqkitemList);
					}
					if(s2.length()>0){
						s2.deleteCharAt(s2.length()-1); 
						yqkQuery = new YqkQuery();
						yqkQuery.setFname(s2.toString());
						List<Yqk> yqkList = yqkService.findList("Yqk.findList.ids",yqkQuery);
						resultMap.put("yqkList", yqkList);
					}
					if(s3.length()>0){
						s3.deleteCharAt(s3.length()-1); 
						courseQuery = new CourseQuery();
						courseQuery.setCourseName(s3.toString());
						List<Course> courseList = courseService.findList("Course.findList.ids",courseQuery);
						resultMap.put("courseList", courseList);
					}
					if(s4.length()>0){
						s4.deleteCharAt(s4.length()-1); 
						courseDetailQuery = new CourseDetailQuery();
						courseDetailQuery.setCourseDetailName(s4.toString());
						List<CourseDetail> courseDetailList = courseDetailService.findList("CourseDetail.findList.ids",courseDetailQuery);
						resultMap.put("courseDetailList", courseDetailList);
					}
					if(s5.length()>0){
						s5.deleteCharAt(s5.length()-1); 
						interactGameQuery = new InteractGameQuery();
						interactGameQuery.setFname(s5.toString());
						List<InteractGame> interactGameList = interactGameService.findList("InteractGame.findList.ids",interactGameQuery);
						resultMap.put("interactGameList", interactGameList);
					}
					if(s6.length()>0){
						s6.deleteCharAt(s6.length()-1); 
						interactGameentryQuery = new InteractGameentryQuery();
						interactGameentryQuery.setTagName(s6.toString());
						List<InteractGameentry> interactGameentryList = interactGameentryService.findList("InteractGameentry.findList.ids",interactGameentryQuery);
						resultMap.put("interactGameentryList", interactGameentryList);
					}
					if(s7.length()>0){
						s7.deleteCharAt(s7.length()-1); 
						yqtQuery = new YqtQuery();
						yqtQuery.setFname(s7.toString());
						List<Yqt> yqtList = yqtService.findList("Yqt.findList.ids",yqtQuery);
						resultMap.put("yqtList", yqtList);
					}
				}else{
					resultMap.put("yiyunupdateIndex", 0);
					resultInfo[2] = "没有更新";
				}
				resultInfo[0] = "0";
				resultInfo[1] = "读取成功";
				resultMap.put("resultInfo", resultInfo);
				Struts2Utils.renderJson(resultMap);
			}else if("WxSendMessage".equals(urlType)){
				wxinfoService.sendMsg(serialNumber, statusMark, type, longitude, latitude, onlineTimes, fversion);
				resultInfo[0] = "0";
				resultInfo[1] = "发送成功";
				resultMap.put("resultInfo", resultInfo);
				Struts2Utils.renderJson(resultMap);
			}else if("YiYunListVoice".equals(urlType)){
				List<Stcode> stcodeList = stcodeService.findList("Stcode.findList.voice",stcodeQuery);
				Long nowTime = new Date().getTime();
				resultMap.put("stcodeList", stcodeList);
				resultMap.put("nowTime", nowTime);
				resultInfo[0] = "0";
				resultInfo[1] = "读取成功";
				resultMap.put("resultInfo", resultInfo);
				Struts2Utils.renderJson(resultMap);
			}else{
				resultInfo[0] = "0";
				resultInfo[1] = "没有此请求类型";
				resultMap.put("resultInfo", resultInfo);
				Struts2Utils.renderJson(resultMap);
			}
		} catch (Exception e) {
			logger.warn("param error ", e);
			resultInfo[0] = "-1";
			resultInfo[1] = "读取失败:"+e.getMessage();
			resultMap.put("resultInfo", resultInfo);
			Struts2Utils.renderJson(resultMap);
		}
		return JSON;
	}
	
	// -------------------自定义方法
	/*
	 * (non-Javadoc)
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	public Yyzkhttp getModel() {
		return entity;
	}

	/**
	 * 获得分页器
	 * @return the page
	 */
	public Page<Yyzkhttp> getPage() {
		return page;
	}

	public Yyzkhttp getEntity() {
		return entity;
	}
	public void setEntity(Yyzkhttp entity) {
		this.entity = entity;
	}
	public YyzkhttpQuery getYyzkhttpQuery() {
		return yyzkhttpQuery;
	}
	public void setYyzkhttpQuery(YyzkhttpQuery yyzkhttpQuery) {
		this.yyzkhttpQuery = yyzkhttpQuery;
	}
	public java.lang.Long getYyzkhttpId() {
		return yyzkhttpId;
	}
	public void setYyzkhttpId(java.lang.Long yyzkhttpId) {
		this.yyzkhttpId = yyzkhttpId;
	}
	public void setResultInfo(String[] resultInfo) {
		this.resultInfo = resultInfo;
	}
	/**
	 * 设置分页器
	 * @param page
	 *        the new page
 */
	public void setPage(Page<Yyzkhttp> page) {
		this.page = page;
	}
	/**
	 * 获得Json操作信息
	 * @return the result info
	 */
	public String[] getResultInfo() {
		return resultInfo;
	}
	/**
	 * 获得所选择的编号列表
	 * @return 编号列表
	 */
	public List<java.lang.Long> getCheckedIdList() {
		return checkedIdList;
	}
	/**
	 * 设置编号列表
	 * @param checkedIdList
	 *        编号列表
	 */
	public void setCheckedIdList(List<java.lang.Long> checkedIdList) {
		this.checkedIdList = checkedIdList;
	}
	public void setApplicationContext(ApplicationContext ctx)
			throws BeansException {
		this.ctx = ctx;
	}
	public List<Yyzkhttp> getYyzkhttpList() {
		return yyzkhttpList;
	}

	public WxinfoQuery getWxinfoQuery() {
		return wxinfoQuery;
	}

	public void setWxinfoQuery(WxinfoQuery wxinfoQuery) {
		this.wxinfoQuery = wxinfoQuery;
	}

	public YiyunupdateQuery getYiyunupdateQuery() {
		return yiyunupdateQuery;
	}

	public void setYiyunupdateQuery(YiyunupdateQuery yiyunupdateQuery) {
		this.yiyunupdateQuery = yiyunupdateQuery;
	}

	public InteractGameQuery getInteractGameQuery() {
		return interactGameQuery;
	}

	public void setInteractGameQuery(InteractGameQuery interactGameQuery) {
		this.interactGameQuery = interactGameQuery;
	}

	public InteractGameentryQuery getInteractGameentryQuery() {
		return interactGameentryQuery;
	}

	public void setInteractGameentryQuery(
			InteractGameentryQuery interactGameentryQuery) {
		this.interactGameentryQuery = interactGameentryQuery;
	}

	public CourseDetailQuery getCourseDetailQuery() {
		return courseDetailQuery;
	}

	public void setCourseDetailQuery(CourseDetailQuery courseDetailQuery) {
		this.courseDetailQuery = courseDetailQuery;
	}

	public CourseQuery getCourseQuery() {
		return courseQuery;
	}

	public void setCourseQuery(CourseQuery courseQuery) {
		this.courseQuery = courseQuery;
	}

	public YqtQuery getYqtQuery() {
		return yqtQuery;
	}

	public void setYqtQuery(YqtQuery yqtQuery) {
		this.yqtQuery = yqtQuery;
	}

	public YqkQuery getYqkQuery() {
		return yqkQuery;
	}

	public void setYqkQuery(YqkQuery yqkQuery) {
		this.yqkQuery = yqkQuery;
	}

	public YqkitemQuery getYqkitemQuery() {
		return yqkitemQuery;
	}

	public void setYqkitemQuery(YqkitemQuery yqkitemQuery) {
		this.yqkitemQuery = yqkitemQuery;
	}

	public String getUrlType() {
		return urlType;
	}

	public void setUrlType(String urlType) {
		this.urlType = urlType;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getStatusMark() {
		return statusMark;
	}

	public void setStatusMark(String statusMark) {
		this.statusMark = statusMark;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Long getOnlineTimes() {
		return onlineTimes;
	}

	public void setOnlineTimes(Long onlineTimes) {
		this.onlineTimes = onlineTimes;
	}

	public Float getFversion() {
		return fversion;
	}

	public void setFversion(Float fversion) {
		this.fversion = fversion;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public StcodeQuery getStcodeQuery() {
		return stcodeQuery;
	}

	public void setStcodeQuery(StcodeQuery stcodeQuery) {
		this.stcodeQuery = stcodeQuery;
	}
	
}
