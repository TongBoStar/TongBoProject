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
import java.util.List;
import com.terrence.crm.dol.base.CrudActionSupport;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.service.IStinfoService;
import com.terrence.crm.dol.bean.Stinfo;
import com.terrence.crm.dol.query.StinfoQuery;
/**
 * tongbo
 * @version 1.0
 */
@Scope("prototype")
@Namespace("/stinfo")
@Results( { @Result(name = CrudActionSupport.RELOAD, location = "stinfo."+ CrudActionSupport.ACTIONSUFFIX
		+ "?page.pageRequest=${page.pageRequest}", type = "redirect") })
public class StinfoAction extends CrudActionSupport<Stinfo> implements ApplicationContextAware {

	@Autowired
	@Qualifier("stinfoService")
	private IStinfoService stinfoService;

	private Stinfo entity;

	private StinfoQuery stinfoQuery;

	private java.lang.Long stinfoId;

	/** 分页器 */
	private Page<Stinfo> page = new Page<Stinfo>();

	/** Json操作信息 */
	private String[] resultInfo = new String[3];

	/** 所选择的编号列表 */
	private List<java.lang.Long> checkedIdList;

	private ApplicationContext ctx;
	private List<Stinfo> stinfoList;

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#prepareModel()
	 */
	@Override
	protected void prepareModel() throws Exception {
		if (stinfoId != null) {
			entity = stinfoService.getById(stinfoId);
		} else {
			entity = new Stinfo();
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
				stinfoService.deleteByMultipleId(checkedIdList);
			}else{
				stinfoService.deleteById(stinfoId);
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
		if (stinfoQuery == null) {
			stinfoQuery = new StinfoQuery();
		}
		try {
			stinfoList = stinfoService.findList(stinfoQuery);
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
		if (stinfoQuery == null) {
			stinfoQuery = new StinfoQuery();
		}
		try {
			page = stinfoService.findPage(page, stinfoQuery);
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
		if (stinfoQuery == null) {
			stinfoQuery = new StinfoQuery();
		}
		try {
			stinfoList = stinfoService.findList(stinfoQuery);
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
			stinfoService.saveOrUpdate(entity);
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
			entity = stinfoService.getById(stinfoId);
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
			stinfoList = stinfoService.findAllList();
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
	public Stinfo getModel() {
		return entity;
	}

	/**
	 * 获得分页器
	 * @return the page
	 */
	public Page<Stinfo> getPage() {
		return page;
	}

	public Stinfo getEntity() {
		return entity;
	}
	public void setEntity(Stinfo entity) {
		this.entity = entity;
	}
	public StinfoQuery getStinfoQuery() {
		return stinfoQuery;
	}
	public void setStinfoQuery(StinfoQuery stinfoQuery) {
		this.stinfoQuery = stinfoQuery;
	}
	public java.lang.Long getStinfoId() {
		return stinfoId;
	}
	public void setStinfoId(java.lang.Long stinfoId) {
		this.stinfoId = stinfoId;
	}
	public void setResultInfo(String[] resultInfo) {
		this.resultInfo = resultInfo;
	}
	/**
	 * 设置分页器
	 * @param page
	 *        the new page
 */
	public void setPage(Page<Stinfo> page) {
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
	public List<Stinfo> getStinfoList() {
		return stinfoList;
	}
}
