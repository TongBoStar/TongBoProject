package com.terrence.crm.dol.action;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Scope;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.terrence.crm.dol.base.CrudActionSupport;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.service.IYqkService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.bean.Yqk;
import com.terrence.crm.dol.query.YqkQuery;
import com.terrence.crm.dol.query.YqkitemQuery;
/**
 * tongbo
 * @version 1.0
 */
@Scope("prototype")
@Namespace("/yqk")
@Results( { @Result(name = CrudActionSupport.RELOAD, location = "yqk."+ CrudActionSupport.ACTIONSUFFIX
		+ "?page.pageRequest=${page.pageRequest}", type = "redirect") })
public class YqkAction extends CrudActionSupport<Yqk> implements ApplicationContextAware {

	@Autowired
	@Qualifier("yqkService")
	private IYqkService yqkService;

	private Yqk entity;

	private YqkQuery yqkQuery;

	private java.lang.Long yqkId;

	/** 分页器 */
	private Page<Yqk> page = new Page<Yqk>();

	/** Json操作信息 */
	private String[] resultInfo = new String[3];

	/** 所选择的编号列表 */
	private List<java.lang.Long> checkedIdList;

	private ApplicationContext ctx;
	private List<Yqk> yqkList;

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#prepareModel()
	 */
	@Override
	protected void prepareModel() throws Exception {
		if (yqkId != null) {
			entity = yqkService.getById(yqkId);
		} else {
			entity = new Yqk();
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
				yqkService.deleteByMultipleId(checkedIdList);
			}else{
				yqkService.deleteById(yqkId);
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
		if (yqkQuery == null) {
			yqkQuery = new YqkQuery();
		}
		try {
			yqkList = yqkService.findList(yqkQuery);
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
	public String listToJs() throws Exception {
		if (yqkQuery == null) {
			yqkQuery = new YqkQuery();
		}
		try {
			yqkService.findAllList();
			yqkList = yqkService.listToJs(yqkQuery);
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
		if (yqkQuery == null) {
			yqkQuery = new YqkQuery();
		}
		try {
			page = yqkService.findPage(page, yqkQuery);
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
		if (yqkQuery == null) {
			yqkQuery = new YqkQuery();
		}
		try {
			yqkList = yqkService.findList(yqkQuery);
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
     * 查询未下载到的本地的列表
     * @return
     * @throws Exception
     */
	public String unsync() throws Exception {
		if (yqkQuery == null) {
			yqkQuery = new YqkQuery();
		}
		try {
			yqkList = yqkService.findList("Yqk.find.unsync.android",yqkQuery);
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
			yqkService.saveOrUpdate(entity);
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
			entity = yqkService.getById(yqkId);
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

	// -------------------自定义方法
	public String listAll() throws Exception {
		try {
			yqkList = yqkService.findAllList();
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
		public String exportAllExcel2007() throws Exception {
			HttpServletResponse response = ServletActionContext.getResponse();
			String filename="一起看列表"+DateUtils.FormatDateTime(DateUtils.GetDateTime(),"yyyyMMddHHmmss")+".xlsx";
			setResponseHeader(response, filename);
			try {
				yqkService.exportExcell2007(response);
				response.getOutputStream().flush();
			    response.getOutputStream().close();
				resultInfo[0] = "0";
				resultInfo[1] = "导出成功";
			} catch (ServiceException e) {
				logger.warn("param error ", e);
				resultInfo[0] = "-1";
				resultInfo[1] = e.getMessage();
			} catch (Exception e) {
				logger.warn("param error ", e);
				resultInfo[0] = "-1";
				resultInfo[1] = "操作失败";
			}
			return null;
		}
		/** 设置响应头 */
		public void setResponseHeader(HttpServletResponse response, String fileName) {
			try {
				response.setContentType("application/msexcel;charset=UTF-8");
				//两种方法都可以
				//response.setContentType("application/octet-stream;charset=iso-8859-1");
				response.setHeader("Content-Disposition", "attachment;filename="
						+ new String(fileName.getBytes("UTF-8"),"iso-8859-1"));
				// 客户端不缓存
				response.addHeader("Pargam", "no-cache");
				response.addHeader("Cache-Control", "no-cache");
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	// -------------------自定义方法
	/*
	 * (non-Javadoc)
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	public Yqk getModel() {
		return entity;
	}

	/**
	 * 获得分页器
	 * @return the page
	 */
	public Page<Yqk> getPage() {
		return page;
	}

	public Yqk getEntity() {
		return entity;
	}
	public void setEntity(Yqk entity) {
		this.entity = entity;
	}
	public YqkQuery getYqkQuery() {
		return yqkQuery;
	}
	public void setYqkQuery(YqkQuery yqkQuery) {
		this.yqkQuery = yqkQuery;
	}
	public java.lang.Long getYqkId() {
		return yqkId;
	}
	public void setYqkId(java.lang.Long yqkId) {
		this.yqkId = yqkId;
	}
	public void setResultInfo(String[] resultInfo) {
		this.resultInfo = resultInfo;
	}
	/**
	 * 设置分页器
	 * @param page
	 *        the new page
 */
	public void setPage(Page<Yqk> page) {
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
	public List<Yqk> getYqkList() {
		return yqkList;
	}
}
