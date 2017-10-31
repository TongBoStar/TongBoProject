package com.terrence.core.dol.action;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Scope;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.terrence.core.dol.bean.Menu;
import com.terrence.core.dol.query.MenuQuery;
import com.terrence.core.dol.service.IMenuOperateService;
import com.terrence.core.dol.service.IMenuService;
import com.terrence.core.dol.service.IRolePowerService;
import com.terrence.crm.dol.base.CrudActionSupport;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.utils.DateUtils;

@Scope("prototype")
@Namespace("/menuAdd")
@Results( { @Result(name = CrudActionSupport.RELOAD, location = "menuAdd."+ CrudActionSupport.ACTIONSUFFIX
		+ "?page.pageRequest=${page.pageRequest}", type = "redirect") })
public class MenuAddAction extends CrudActionSupport<Menu> implements ApplicationContextAware {

	@Autowired
	@Qualifier("menuService")
	private IMenuService menuService;
	
	@Autowired
	@Qualifier("menuOperateService")
	private IMenuOperateService menuOperateService;
	
	@Autowired
	@Qualifier("rolePowerService")
	private IRolePowerService rolePowerService;
	
	private Menu entity;
	
	private MenuQuery menuQuery;
	
	private java.lang.Long menuId;
	
	private String[] resultInfo = new String[2];
	
	private List<java.lang.Long> checkedIdList;

	private ApplicationContext ctx;
	private List<Menu> menuList = new ArrayList<Menu>();
	
	private java.lang.Long menuPid;
	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#prepareModel()
	 */
	@Override
	protected void prepareModel() throws Exception {
		if (menuId != null) {
			entity = menuService.getById(menuId);
		} else {
			entity = new Menu();
		}
	}

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#delete()
	 */
	@Override
	public String delete() throws Exception {
		try {
			//menuService.deleteByMultipleId(checkedIdList);
			if(menuId!=null){
				MenuQuery query = new MenuQuery();
				query.setpId(menuId);
				List<Menu> lists = menuService.findList(query);
				if(lists!=null&&lists.size()>0){
					resultInfo[0] = "-1";
					resultInfo[1] = "此菜单下有子菜单，不能被删除！";
				}else{
					menuService.deleteById(menuId);
					resultInfo[0] = "0";
					resultInfo[1] = "删除成功";
				}
				
			}
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
		try{
			list();
		}catch (Exception e) {
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
		try{
			if(this.menuQuery==null){
				menuQuery = new MenuQuery();
			}
			menuList = this.menuService.findList(menuQuery);
			resultInfo[0] = "0";
			resultInfo[1] = "查询列表成功";
		}catch (Exception e) {
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
	public String listMenuToJson() throws Exception {
		try{
			if(this.menuQuery==null){
				menuQuery = new MenuQuery();
			}
			menuList = this.menuService.findmenuList(menuQuery);
			resultInfo[0] = "0";
			resultInfo[1] = "查询列表成功";
		}catch (Exception e) {
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
			if(this.entity!=null&&this.menuPid!=null){
				entity.setpId(menuPid);
				Menu menu = this.menuService.getById(menuPid);
				if(menu!=null){
					Integer layers = menu.getLayers()+1;
					entity.setLayers(layers);
				}else{
					entity.setLayers(0);
				}
			}
			if(this.entity!=null&&this.menuPid==null){
				entity.setLayers(0);
			}
			this.menuService.saveOrUpdate(entity);
			resultInfo[0] = "0";
			resultInfo[1] = "操作成功";
			
			addActionMessage("操作成功");
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch(Exception e) {
			logger.error(e.getMessage());
			
			resultInfo[0] = "-1";
			resultInfo[1] = "操作失败";
			
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
			entity = null;
			if(this.menuId!=null){
				entity = this.menuService.getById(menuId);
				resultInfo[0] = "0";
				resultInfo[1] = "新增显示成功";
			}else{
				//修改
				entity = new Menu();
				resultInfo[0] = "0";
				resultInfo[1] = "查询成功";
			}
			
		} catch(ServiceException e) {
			logger.error(e.getMessage());
			
			resultInfo[0] = "-1";
			resultInfo[1] = e.getMessage();
		} catch(Exception e) {
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
		
		return JSON;
	}
	
	
	// -------------------自定义方法
	/*
	 * (non-Javadoc)
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	public Menu getModel() {
		return entity;
	}

	public Menu getEntity() {
		return entity;
	}

	public void setEntity(Menu entity) {
		this.entity = entity;
	}

	public MenuQuery getMenuQuery() {
		return menuQuery;
	}

	public void setMenuQuery(MenuQuery menuQuery) {
		this.menuQuery = menuQuery;
	}

	public java.lang.Long getMenuId() {
		return menuId;
	}

	public void setMenuId(java.lang.Long menuId) {
		this.menuId = menuId;
	}

	public String[] getResultInfo() {
		return resultInfo;
	}

	public void setResultInfo(String[] resultInfo) {
		this.resultInfo = resultInfo;
	}

	public List<java.lang.Long> getCheckedIdList() {
		return checkedIdList;
	}

	public void setCheckedIdList(List<java.lang.Long> checkedIdList) {
		this.checkedIdList = checkedIdList;
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		this.ctx = ctx;
	}

	public List<Menu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}

	public java.lang.Long getMenuPid() {
		return menuPid;
	}

	public void setMenuPid(java.lang.Long menuPid) {
		this.menuPid = menuPid;
	}

	

}
