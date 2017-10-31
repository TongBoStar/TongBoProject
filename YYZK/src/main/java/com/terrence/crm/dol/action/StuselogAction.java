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

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.terrence.crm.dol.base.CrudActionSupport;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.base.utils.Struts2Utils;
import com.terrence.crm.dol.service.IStuselogService;
import com.terrence.crm.dol.bean.Stcode;
import com.terrence.crm.dol.bean.Stuselog;
import com.terrence.crm.dol.query.StuselogQuery;
/**
 * tongbo
 * @version 1.0
 */
@Scope("prototype")
@Namespace("/stuselog")
@Results( { @Result(name = CrudActionSupport.RELOAD, location = "stuselog."+ CrudActionSupport.ACTIONSUFFIX
		+ "?page.pageRequest=${page.pageRequest}", type = "redirect") })
public class StuselogAction extends CrudActionSupport<Stuselog> implements ApplicationContextAware {

	@Autowired
	@Qualifier("stuselogService")
	private IStuselogService stuselogService;

	private Stuselog entity;

	private StuselogQuery stuselogQuery;

	private java.lang.Long stuselogId;

	/** 分页器 */
	private Page<Stuselog> page = new Page<Stuselog>();

	/** Json操作信息 */
	private String[] resultInfo = new String[3];

	/** 所选择的编号列表 */
	private List<java.lang.Long> checkedIdList;

	private ApplicationContext ctx;
	private List<Stuselog> stuselogList;

	/*
	 * (non-Javadoc)
	 * @see com.disney.dol.base.CrudActionSupport#prepareModel()
	 */
	@Override
	protected void prepareModel() throws Exception {
		if (stuselogId != null) {
			entity = stuselogService.getById(stuselogId);
		} else {
			entity = new Stuselog();
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
				stuselogService.deleteByMultipleId(checkedIdList);
			}else{
				stuselogService.deleteById(stuselogId);
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
		if (stuselogQuery == null) {
			stuselogQuery = new StuselogQuery();
		}
		try {
			stuselogList = stuselogService.findList(stuselogQuery);
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
		if (stuselogQuery == null) {
			stuselogQuery = new StuselogQuery();
		}
		try {
			page = stuselogService.findPage(page, stuselogQuery);
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
		if (stuselogQuery == null) {
			stuselogQuery = new StuselogQuery();
		}
		try {
			stuselogList = stuselogService.findList(stuselogQuery);
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
			stuselogService.saveOrUpdate(entity);
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
			entity = stuselogService.getById(stuselogId);
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
			stuselogList = stuselogService.findAllList();
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
	public String parseUserLog() throws Exception {
		try {
			Long parseTime = new Date().getTime();
			stuselogService.getById(1L);
			stuselogService.parseUserLog(stuselogQuery);
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
	public String listInfos() throws Exception {
		try {
			Map<String, List<Stuselog>> map = new HashMap<String, List<Stuselog>>();
			if("1".equals(stuselogQuery.getXuexiItemType())){
				List<Stuselog> xuexishichangList = stuselogService.findList("Stuselog.Count.timesandftimesbelong",stuselogQuery);
				List<Stuselog> xuexifenleiList = stuselogService.findList("Stuselog.Count.timesandftimesitemtype",stuselogQuery);
				List<Stuselog> xuexifenleishichangList = stuselogService.findList("Stuselog.Count.multytypesstudy",stuselogQuery);
				map.put("xuexishichang", xuexishichangList);
				map.put("xuexifenlei", xuexifenleiList);
				map.put("xuexifenleishichangList", xuexifenleishichangList);
			}
			if("1".equals(stuselogQuery.getDonghuaItemType())){
				Calendar cal = Calendar.getInstance();
			    int day = cal.get(Calendar.DATE);
			    int month = cal.get(Calendar.MONTH) + 1;
			    int year = cal.get(Calendar.YEAR);
				List<Stuselog> shutongshichangList = stuselogService.findList("Stuselog.Count.timesandftimes",stuselogQuery);
				List<Stuselog> shutongalltypesList = stuselogService.findList("Stuselog.Count.alltypes",stuselogQuery);
				List<Stuselog> shutongalldetypesList = stuselogService.findList("Stuselog.Count.allshutongtypes",stuselogQuery);
				List<Stuselog> shutongshiduanList = stuselogService.findList("Stuselog.Count.shutongshiduan",stuselogQuery);
				List<Stuselog> shutongshichangallList = stuselogService.findList("Stuselog.Count.timesandftimesall",stuselogQuery);
				List<Stuselog> donghuashichangList = stuselogService.findList("Stuselog.Count.timesandftimesbelong",stuselogQuery);
				List<Stuselog> donghuafenleishichangList = stuselogService.findList("Stuselog.Count.multytypesgame",stuselogQuery);
				stuselogQuery.setTakeTimeLong(Long.valueOf(year));
				stuselogQuery.setParseTimeLong(Long.valueOf(month));
				stuselogQuery.setTakeTimeHour(day);
				List<Stuselog> shiyongTimesList = stuselogService.findList("Stuselog.Count.shutongusetimes",stuselogQuery);
				//List<Stuselog> donghuafenleiList = stuselogService.findList("Stuselog.Count.timesandftimesitemtype",stuselogQuery);
				List<Stuselog> donghuafenleiList = new ArrayList<Stuselog>();
				stuselogQuery.setItemType("GAMELANG");
				Stuselog stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMELANG");
				donghuafenleiList.add(stuselog);
				stuselogQuery.setItemType("GAMEDRAW");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMEDRAW");
				donghuafenleiList.add(stuselog);
				stuselogQuery.setItemType("GAMEMUSIC");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMEMUSIC");
				donghuafenleiList.add(stuselog);
				stuselogQuery.setItemType("GAMESPATIAL");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMESPATIAL");
				donghuafenleiList.add(stuselog);
				stuselogQuery.setItemType("GAMELOGICAL");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMELOGICAL");
				donghuafenleiList.add(stuselog);
				stuselogQuery.setItemType("GAMESPORT");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMESPORT");
				donghuafenleiList.add(stuselog);
				stuselogQuery.setItemType("GAMEMATH");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMEMATH");
				donghuafenleiList.add(stuselog);
				stuselogQuery.setItemType("GAMEEMOTION");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMEEMOTION");
				donghuafenleiList.add(stuselog);
				SimpleDateFormat sdf0=new SimpleDateFormat("M-d");
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		        Calendar lastDate = Calendar.getInstance();
		        lastDate.add(Calendar.DATE, -30);//日期回滚30天
		        stuselogQuery.setTakeTime(sdf.format(lastDate.getTime())+" 00:00:00");
		        stuselogQuery.setUpLoadTime(sdf.format(new Date())+" 00:00:00");
		        List<Stuselog> oneweekdataList = stuselogService.findList("Stuselog.Count.oneweekdata",stuselogQuery);
		        List<Stuselog> oneweekdataList2 = new ArrayList<Stuselog>();
		        Map<String, Long> map2 = new HashMap<String, Long>();
		        Stuselog s = null;
		        for(int i=0;i<30;i++){
		        	lastDate = Calendar.getInstance();
		        	lastDate.add(Calendar.DATE, -30+i);
		        	map2.put(sdf0.format(lastDate.getTime()), 0L);
		        	s = new Stuselog();
		        	s.setOperateType(sdf0.format(lastDate.getTime()));
		        	oneweekdataList2.add(s);
		        }
		        if(null!=oneweekdataList&&oneweekdataList.size()>0){
		        	for(Stuselog st:oneweekdataList){
		        		map2.put(st.getOperateTypeMark()+"-"+st.getTakeTimeLong(), st.getParseTimeLong());
			        }
		        }
		        for(int i=0;i<30;i++){
		        	oneweekdataList2.get(i).setParseTimeLong(map2.get(oneweekdataList2.get(i).getOperateType()));
		        }
				map.put("shutongshichang", shutongshichangList);
				map.put("shutongalltypesList", shutongalltypesList);
				map.put("shutongalldetypesList", shutongalldetypesList);
				map.put("shutongshiduan", shutongshiduanList);
				map.put("shutongshichangall", shutongshichangallList);
				map.put("donghuashichang", donghuashichangList);
				map.put("donghuafenlei", donghuafenleiList);
				map.put("donghuafenleishichangList", donghuafenleishichangList);
				map.put("shiyongTimesList", shiyongTimesList);
				map.put("oneweekdataList", oneweekdataList2);
			}
			if(3==stuselogQuery.getQueryseq()){//游戏
				List<Stuselog> gamenameallList = stuselogService.findList("Stuselog.Count.timesandftimesall",stuselogQuery);
				List<Stuselog> gamenameList = stuselogService.findList("Stuselog.Count.gamename",stuselogQuery);
				List<Stuselog> youxifenleishichangList = stuselogService.findList("Stuselog.Count.multytypesgame",stuselogQuery);
				//List<Stuselog> gamenametypeList = stuselogService.findList("Stuselog.Count.timesandftimesitemtype",stuselogQuery);
				List<Stuselog> gamenametypeList = new ArrayList<Stuselog>();
				stuselogQuery.setItemType("GAMELANG");
				Stuselog stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMELANG");
				gamenametypeList.add(stuselog);
				stuselogQuery.setItemType("GAMEDRAW");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMEDRAW");
				gamenametypeList.add(stuselog);
				stuselogQuery.setItemType("GAMEMUSIC");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMEMUSIC");
				gamenametypeList.add(stuselog);
				stuselogQuery.setItemType("GAMESPATIAL");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMESPATIAL");
				gamenametypeList.add(stuselog);
				stuselogQuery.setItemType("GAMELOGICAL");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMELOGICAL");
				gamenametypeList.add(stuselog);
				stuselogQuery.setItemType("GAMESPORT");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMESPORT");
				gamenametypeList.add(stuselog);
				stuselogQuery.setItemType("GAMEMATH");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMEMATH");
				gamenametypeList.add(stuselog);
				stuselogQuery.setItemType("GAMEEMOTION");
				stuselog = stuselogService.getByEntity("Stuselog.Count.multytypesall", stuselogQuery);
				stuselog.setOperateModuleMark("GAMEEMOTION");
				gamenametypeList.add(stuselog);
				map.put("gamenameallList", gamenameallList);
				map.put("gamenameList", gamenameList);
				map.put("gamenametypeList", gamenametypeList);
				map.put("youxifenleishichangList", youxifenleishichangList);
			}
			if(4==stuselogQuery.getQueryseq()){//听音乐
				List<Stuselog> yqtmusicallList = stuselogService.findList("Stuselog.Count.musictimesall",stuselogQuery);
				List<Stuselog> yqtmusicnameList = stuselogService.findList("Stuselog.Count.musicname",stuselogQuery);
				List<Stuselog> yqtmusictypeList = stuselogService.findList("Stuselog.Count.musicitemtype",stuselogQuery);
				List<Stuselog> yinyuefenleishichangList = stuselogService.findList("Stuselog.Count.multytypesmusic",stuselogQuery);
				map.put("yqtmusicallList", yqtmusicallList);
				map.put("yqtmusicnameList", yqtmusicnameList);
				map.put("yqtmusictypeList", yqtmusictypeList);
				map.put("yinyuefenleishichangList", yinyuefenleishichangList);
			}
			if(5==stuselogQuery.getQueryseq()){//语音对话
				List<Stuselog> voiceallList = stuselogService.findList("Stuselog.Count.voiceall",stuselogQuery);
				List<Stuselog> voiceshutongallList = stuselogService.findList("Stuselog.Count.voiceshutongall",stuselogQuery);
				map.put("voiceallList", voiceallList);
				map.put("voiceshutongallList", voiceshutongallList);
			}
			Struts2Utils.renderJson(map);
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
	public Stuselog getModel() {
		return entity;
	}

	/**
	 * 获得分页器
	 * @return the page
	 */
	public Page<Stuselog> getPage() {
		return page;
	}

	public Stuselog getEntity() {
		return entity;
	}
	public void setEntity(Stuselog entity) {
		this.entity = entity;
	}
	public StuselogQuery getStuselogQuery() {
		return stuselogQuery;
	}
	public void setStuselogQuery(StuselogQuery stuselogQuery) {
		this.stuselogQuery = stuselogQuery;
	}
	public java.lang.Long getStuselogId() {
		return stuselogId;
	}
	public void setStuselogId(java.lang.Long stuselogId) {
		this.stuselogId = stuselogId;
	}
	public void setResultInfo(String[] resultInfo) {
		this.resultInfo = resultInfo;
	}
	/**
	 * 设置分页器
	 * @param page
	 *        the new page
 */
	public void setPage(Page<Stuselog> page) {
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
	public List<Stuselog> getStuselogList() {
		return stuselogList;
	}
}
