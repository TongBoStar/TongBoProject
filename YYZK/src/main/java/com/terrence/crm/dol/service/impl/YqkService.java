package com.terrence.crm.dol.service.impl;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Yiyunupdate;
import com.terrence.crm.dol.bean.Yqk;
import com.terrence.crm.dol.bean.Yqt;
import com.terrence.crm.dol.dao.IYiyunupdateDao;
import com.terrence.crm.dol.dao.IYqkDao;
import com.terrence.crm.dol.query.YqkQuery;
import com.terrence.crm.dol.service.IYqkService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class YqkService extends BaseService implements IYqkService {
	@Autowired
	@Qualifier("yqkDao")
	private IYqkDao yqkDao;
	@Autowired
	@Qualifier("yiyunupdateDao")
	private IYiyunupdateDao yiyunupdateDao;
	@Override
	public Yqk getById(Long id) throws ServiceException {
		return yqkDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Yqk entity) throws ServiceException {
		String time = DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss");
		entity.setCreateDate(time);
		entity.setCreaterId(SpringSecurityUtils.getCurrentUserId());
		try {
			CloseableHttpClient client = HttpClients.createDefault();
			String url = "https://openapi.youku.com/v2/videos/show.json?client_id=e054a004232b7ad2&ext=thumbnails,show,dvd,reference&video_id="+entity.getVideoId();
			HttpGet post = new HttpGet(url);
			post.addHeader("Content-Type","application/json");
			CloseableHttpResponse resp = client.execute(post);
			int sc = resp.getStatusLine().getStatusCode();
			String jsonStr = "";
			if(sc>=200&&sc<300) {
				jsonStr = EntityUtils.toString(resp.getEntity());
			}
			JSONObject jsonObj;
			jsonObj = new JSONObject(jsonStr);
			entity.setResIcon(jsonObj.getString("bigThumbnail"));
			entity.setFname(jsonObj.getString("title"));
			entity.setVideoseq(jsonObj.getJSONObject("show").getInt("seq"));
			entity.setTimes(jsonObj.getInt("duration"));
		} catch (Exception e) {
			throw new ServiceException(e.getMessage());
		}
		if(null!=entity.getId()){
			update(entity);
			Yiyunupdate yiyunupdate = new Yiyunupdate();
			yiyunupdate.setCreaterId(SpringSecurityUtils.getCurrentUserId());
			yiyunupdate.setCreateTime(time);
			yiyunupdate.setFid(entity.getId());
			yiyunupdate.setFtable("YqkMark");
			yiyunupdateDao.save(yiyunupdate);
		}else{
			save(entity);
		}
	}
	@Override
	public Long save(Yqk entity) throws ServiceException {
		return yqkDao.save(entity);
	}
	@Override
	public Integer update(Yqk entity) throws ServiceException {
		return yqkDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return yqkDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = yqkDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Yqk> findPage(Page<Yqk> page, YqkQuery query) throws ServiceException{
		return yqkDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Yqk> findPage(Page<Yqk> page,String statement, YqkQuery query) throws ServiceException{
		return yqkDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Yqk> findList(YqkQuery query) throws ServiceException{
		return yqkDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Yqk> findList(YqkQuery query,Integer pageSize) throws ServiceException{
		return yqkDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yqk> findList(YqkQuery query,String statement,Integer pageSize) throws ServiceException{
		return yqkDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yqk> findAllList() throws ServiceException{
		return yqkDao.findAllList();
	}
	@Override
	public List<Yqk> listToJs(YqkQuery yqkQuery) throws ServiceException {
		return yqkDao.findList("Yqk.listToJs", yqkQuery);
	}
	@Override
	public List<Yqk> findList(String statement, YqkQuery yqkQuery) {
		return yqkDao.findList(statement, yqkQuery);
	}
	@Override
	public void exportExcell2007(HttpServletResponse response) throws Exception{
		List<Yqk> yqklist = yqkDao.findAllList();
		// 创建一个excel文件
		XSSFWorkbook wb = new XSSFWorkbook();
		// 创建一个sheet对象
		XSSFSheet sheet = wb.createSheet("一起看列表");
		//设置列宽
		//有int值转像素需要乘以32
		int[] widths = new int[]{30,200,200,200};
		for(int i=0;i<widths.length;i++){
			sheet.setColumnWidth((short)i, (short)(widths[i]*32));
		}
		XSSFRow row0 = sheet.createRow(0);
		createCell(wb, row0, 0, "序号");
		createCell(wb, row0, 1, "名称");
		createCell(wb, row0, 2, "专辑");
		createCell(wb, row0, 3, "ID");
		if(null!=yqklist&&yqklist.size()>0){
			for(int i=1;i<=yqklist.size();i++){
				XSSFRow row = sheet.createRow(i);
				createCell(wb, row, 0, i+"");
				createCell(wb, row, 1, yqklist.get(i-1).getFname());
				createCell(wb, row, 2, yqklist.get(i-1).getFtypeName());
				createCell(wb, row, 3, yqklist.get(i-1).getVideoId());
			}
			wb.write(response.getOutputStream());
		}
	}
	/**
	 * 创建单元格
	 * @param wb excel表格
	 * @param row 行
	 * @param col 列
	 * @param val 内容
	 */
	public void createCell(XSSFWorkbook wb,XSSFRow row,int cellNum,String val){
		//创建一个celll单元格
		XSSFCell cell=row.createCell(cellNum);
        cell.setCellValue(val);
        //创建样式
        XSSFCellStyle cellstyle=wb.createCellStyle();
        cellstyle.setAlignment(XSSFCellStyle.ALIGN_CENTER_SELECTION);//居中对齐
        cellstyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);//垂直方向居中对齐
        cellstyle.setBorderBottom(XSSFCellStyle.BORDER_THIN); //下边框    
        cellstyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);//左边框    
        cellstyle.setBorderTop(XSSFCellStyle.BORDER_THIN);//上边框    
        cellstyle.setBorderRight(XSSFCellStyle.BORDER_THIN);//右边框
        cellstyle.setWrapText(true);//设置自动换行
        XSSFFont font = wb.createFont();
        font.setFontName("宋体");
        font.setFontHeightInPoints((short)12);
        cellstyle.setFont(font);
	}
}
