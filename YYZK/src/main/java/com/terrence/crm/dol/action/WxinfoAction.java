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
import java.util.List;
import java.util.Map;

import com.terrence.crm.dol.base.CrudActionSupport;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.service.IStuselogService;
import com.terrence.crm.dol.service.IWxinfoService;
import com.terrence.crm.dol.utils.Sign;
import com.terrence.crm.dol.bean.Stuselog;
import com.terrence.crm.dol.bean.Wxinfo;
import com.terrence.crm.dol.query.StuselogQuery;
import com.terrence.crm.dol.query.WxinfoQuery;
/**
 * tongbo
 * @version 1.0
 */
@Scope("prototype")
@Namespace("/wxinfo")
@Results( { @Result(name = CrudActionSupport.RELOAD, location = "wxinfo."+ CrudActionSupport.ACTIONSUFFIX
		+ "?page.pageRequest=${page.pageRequest}", type = "redirect") })
public class WxinfoAction extends CrudActionSupport<Wxinfo> implements ApplicationContextAware {

	@Autowired
	@Qualifier("wxinfoService")
	private IWxinfoService wxinfoService;
	@Autowired
	@Qualifier("stuselogService")
	private IStuselogService stuselogService;
	
	private Wxinfo entity;

	private WxinfoQuery wxinfoQuery;

	private java.lang.Long wxinfoId;

	/** 分页器 */
	private Page<Wxinfo> page = new Page<Wxinfo>();

	/** Json操作信息 */
	private String[] resultInfo = new String[3];

	/** 所选择的编号列表 */
	private List<java.lang.Long> checkedIdList;

	private ApplicationContext ctx;
	private List<Wxinfo> wxinfoList;
	private String serialNumber;
	private String statusMark;
	private Integer type;
	private Double longitude;//经度
	private Double latitude ;//纬度
	private Long onlineTimes;//在线时长
	private Float fversion;//版本号
	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#prepareModel()
	 */
	@Override
	protected void prepareModel() throws Exception {
		if (wxinfoId != null) {
			entity = wxinfoService.getById(wxinfoId);
		} else {
			entity = new Wxinfo();
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
				wxinfoService.deleteByMultipleId(checkedIdList);
			}else{
				wxinfoService.deleteById(wxinfoId);
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
		if (wxinfoQuery == null) {
			wxinfoQuery = new WxinfoQuery();
		}
		try {
			wxinfoList = wxinfoService.findList(wxinfoQuery);
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
		if (wxinfoQuery == null) {
			wxinfoQuery = new WxinfoQuery();
		}
		try {
			page = wxinfoService.findPage(page, wxinfoQuery);
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
		if (wxinfoQuery == null) {
			wxinfoQuery = new WxinfoQuery();
		}
		try {
			wxinfoList = wxinfoService.findList(wxinfoQuery);
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
			wxinfoService.saveOrUpdate(entity);
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
			entity = wxinfoService.getById(wxinfoId);
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
	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#showToJson()
	 */
	public String sendMsg() throws Exception {
		try {
			Long parseTime = new Date().getTime();
			wxinfoService.findAllList();
			wxinfoService.sendMsg(serialNumber,statusMark,type,longitude,latitude,onlineTimes,fversion);
			if(type==2){
				stuselogService.parseUserLog(null);
				StuselogQuery sqQuery = new StuselogQuery();
				sqQuery.setParseTimeLong(parseTime);
				List<Stuselog> list = stuselogService.findList("Stuselog.findList.countcustom",sqQuery);
				if(null!=list&&list.size()>0){
					for(int i=0;i<list.size();i++){
						Stuselog st = list.get(i);
						if(st.getOperateModuleMark().equals("YiQiWanActivity")&&st.getOperateTypeMark().equals("playgame")){
							if(i<list.size()-1&&list.get(i+1).getOperateModuleMark().equals("YiQiWanActivity")&&list.get(i+1).getOperateTypeMark().equals("playGameTime")){
								st.setsTime(list.get(i+1).getOperateContent());
								stuselogService.update(st);
								i++;
							}
							continue;
						}
						if(st.getOperateModuleMark().equals("PlayerActivity")&&st.getOperateTypeMark().equals("playvideo")){
							if(i<list.size()-1&&list.get(i+1).getOperateModuleMark().equals("PlayerActivity")&&list.get(i+1).getOperateTypeMark().equals("stayTime")){
								st.setsTime(list.get(i+1).getOperateContent());
								stuselogService.update(st);
								i++;
							}
							continue;
						}
					}
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultInfo[0] = "-1";
			resultInfo[1] = "查询失败";
		}
		return JSON;
	}
	// -------------------自定义方法
	public String listAll() throws Exception {
		try {
			wxinfoList = wxinfoService.findAllList();
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
	public String sigre() throws Exception {
		try {
			entity = wxinfoService.getById(1L);
			Map<String,String> sigre = Sign.sign(entity.getJsapi_ticket(), wxinfoQuery.getAppId());
			wxinfoQuery.setAppId(entity.getAppId());
			wxinfoQuery.setSignature(sigre.get("signature"));
			wxinfoQuery.setNoncestr(sigre.get("nonceStr"));
			wxinfoQuery.setToken_expireTime(Long.valueOf(sigre.get("timestamp")));
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
	// -------------------自定义方法
	/*
	 * (non-Javadoc)
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	public Wxinfo getModel() {
		return entity;
	}

	/**
	 * 获得分页器
	 * @return the page
	 */
	public Page<Wxinfo> getPage() {
		return page;
	}

	public Wxinfo getEntity() {
		return entity;
	}
	public void setEntity(Wxinfo entity) {
		this.entity = entity;
	}
	public WxinfoQuery getWxinfoQuery() {
		return wxinfoQuery;
	}
	public void setWxinfoQuery(WxinfoQuery wxinfoQuery) {
		this.wxinfoQuery = wxinfoQuery;
	}
	public java.lang.Long getWxinfoId() {
		return wxinfoId;
	}
	public void setWxinfoId(java.lang.Long wxinfoId) {
		this.wxinfoId = wxinfoId;
	}
	public void setResultInfo(String[] resultInfo) {
		this.resultInfo = resultInfo;
	}
	/**
	 * 设置分页器
	 * @param page
	 *        the new page
 */
	public void setPage(Page<Wxinfo> page) {
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
	public List<Wxinfo> getWxinfoList() {
		return wxinfoList;
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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
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
}
