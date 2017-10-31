package com.terrence.crm.dol.service.impl;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.CourseDetail;
import com.terrence.crm.dol.bean.Gameinfo;
import com.terrence.crm.dol.bean.Stcode;
import com.terrence.crm.dol.bean.Stuselog;
import com.terrence.crm.dol.bean.Yqk;
import com.terrence.crm.dol.bean.Yqkitem;
import com.terrence.crm.dol.bean.Yqt;
import com.terrence.crm.dol.dao.ICourseDetailDao;
import com.terrence.crm.dol.dao.IGameinfoDao;
import com.terrence.crm.dol.dao.IStcodeDao;
import com.terrence.crm.dol.dao.IStuselogDao;
import com.terrence.crm.dol.dao.IYqkDao;
import com.terrence.crm.dol.dao.IYqkitemDao;
import com.terrence.crm.dol.dao.IYqtDao;
import com.terrence.crm.dol.query.StuselogQuery;
import com.terrence.crm.dol.service.IStuselogService;
import com.terrence.crm.dol.utils.ParseLog;
@Service
@Transactional
public class StuselogService extends BaseService implements IStuselogService {
	@Autowired
	@Qualifier("stuselogDao")
	private IStuselogDao stuselogDao;
	@Autowired
	@Qualifier("yqkDao")
	private IYqkDao yqkDao;
	@Autowired
	@Qualifier("courseDetailDao")
	private ICourseDetailDao courseDetailDao;
	@Autowired
	@Qualifier("stcodeDao")
	private IStcodeDao stcodeDao;
	@Autowired
	@Qualifier("yqkitemDao")
	private IYqkitemDao yqkitemDao;
	@Autowired
	@Qualifier("yqtDao")
	private IYqtDao yqtDao;
	@Autowired
	@Qualifier("gameinfoDao")
	private IGameinfoDao gameinfoDao;
	
	@Override
	public Stuselog getById(Long id) throws ServiceException {
		return stuselogDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Stuselog entity) throws ServiceException {
		stuselogDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Stuselog entity) throws ServiceException {
		return stuselogDao.save(entity);
	}
	@Override
	public Integer update(Stuselog entity) throws ServiceException {
		return stuselogDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return stuselogDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = stuselogDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Stuselog> findPage(Page<Stuselog> page, StuselogQuery query) throws ServiceException{
		return stuselogDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Stuselog> findPage(Page<Stuselog> page,String statement, StuselogQuery query) throws ServiceException{
		return stuselogDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Stuselog> findList(StuselogQuery query) throws ServiceException{
		return stuselogDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Stuselog> findList(StuselogQuery query,Integer pageSize) throws ServiceException{
		return stuselogDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Stuselog> findList(StuselogQuery query,String statement,Integer pageSize) throws ServiceException{
		return stuselogDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Stuselog> findAllList() throws ServiceException{
		return stuselogDao.findAllList();
	}
	@Override
	public List<Stuselog> parseUserLog(StuselogQuery stuselogQuery) throws ServiceException {
		List<Stuselog> stuselogs = new ArrayList<Stuselog>();
		List<Stuselog> stuselogsall = new ArrayList<Stuselog>();
		List<Yqk> yqks = yqkDao.findAllList();
		List<CourseDetail> courseDetails = courseDetailDao.findAllList();
		List<Yqt> yqts = yqtDao.findAllList();
		List<Stcode> stcodes = stcodeDao.findAllList();
		List<Yqkitem> yqkitems = yqkitemDao.findAllList();
		List<Gameinfo> gameinfos = gameinfoDao.findAllList();
		Map<String, String> yqkMap = new HashMap<String, String>();
		Map<String, String> courseMap = new HashMap<String, String>();
		Map<String, String> stcodeMap = new HashMap<String, String>();
		Map<String,String> yqkitemMap = new HashMap<String, String>();
		Map<String,String> yqtMap = new HashMap<String, String>();
		Map<String,String> gameinfoMap = new HashMap<String, String>();
		for(Gameinfo gameinfo:gameinfos){
			gameinfoMap.put(gameinfo.getGamePackage(), gameinfo.getGameType());
		}
		for(Yqt yqt:yqts){
			yqtMap.put(yqt.getFname(), yqt.getFtype()+"");
		}
		for(Yqkitem yqkitem:yqkitems){
			yqkitemMap.put(yqkitem.getItemclassName(), yqkitem.getItemType());
		}
		for(Yqk yqk:yqks){
			yqkMap.put(yqk.getVideoId(), yqk.getFtypeName()+":"+yqk.getFname()+"="+yqkitemMap.get(yqk.getFtypeName()));
		}
		for(CourseDetail courseDetail:courseDetails){
			courseMap.put(courseDetail.getVideoId(), courseDetail.getCourse().getCourseName()+":"+courseDetail.getCourseDetailName()+"="+courseDetail.getCourse().getDomainCode());
		}
		for(Stcode stcode:stcodes){
			stcodeMap.put(stcode.getSerialNumber(), stcode.getStCode());
		}
		SimpleDateFormat formt = new SimpleDateFormat("yyyyMMdd");
		String filepath = "";
		String dstpath = "";
		if(null!=stuselogQuery&&null!=stuselogQuery.getTakeTime()){
			filepath = "/home/yyzk/upload/" + stuselogQuery.getTakeTime().replaceAll("-", "") + "/";
			dstpath = "/home/yyzk/uploadbak/" + stuselogQuery.getTakeTime().replaceAll("-", "") + "/";
			//filepath = "E:\\123\\" + stuselogQuery.getTakeTime().replaceAll("-", "") + "\\";
			//dstpath = "E:\\456\\" + stuselogQuery.getTakeTime().replaceAll("-", "") + "\\";
		}else{
			filepath = "/home/yyzk/upload/" + formt.format(new Date()) + "/";
			dstpath = "/home/yyzk/uploadbak/" + formt.format(new Date()) + "/";
		}
		File dstfile = new File(dstpath);
		if(!dstfile.exists()){
			dstfile.mkdirs();
		}
		File file = new File(filepath);
		if (file.isDirectory()) {
			String[] filelist = file.list();
			for (int i = 0; i < filelist.length; i++) {
				File readfile = new File(filepath + "/" + filelist[i]);
				if (!readfile.isDirectory()) {
					System.out.println("path=" + readfile.getPath());
					System.out.println("absolutepath="+ readfile.getAbsolutePath());
					System.out.println("name=" + readfile.getName());
					Map<String,List<Stuselog>> maps = ParseLog.exeParse(yqkMap, courseMap, stcodeMap,yqtMap, gameinfoMap,filepath+readfile.getName());
					if(null!=maps&&maps.get("stuselogs").size()>0){
						stuselogs = maps.get("stuselogs");
					}
					if(null!=maps&&maps.get("stuselogsall").size()>0){
						stuselogsall = maps.get("stuselogsall");
					}
					if(null!=stuselogs&&stuselogs.size()>0){
						stuselogDao.saveBatch(stuselogs);
					}
					if(null!=stuselogsall&&stuselogsall.size()>0){
						stuselogDao.saveBatch("Stuselog.batchInsertGroupShoup.all",stuselogsall);
					}
		            if (readfile.renameTo(new File(dstpath + filelist[i]))) {  
		                System.out.println("File is moved successful!");  
		            } else {  
		                System.out.println("File is failed to move!");  
		            }  
				}
			}
		}
		return stuselogs;
	}
	@Override
	public List<Stuselog> findList(String statement, StuselogQuery query) throws ServiceException {
		return stuselogDao.findList(statement, query);
	}
	@Override
	public Stuselog getByEntity(String statement, StuselogQuery query){
		return stuselogDao.getByEntity(statement, query);
	}
}
