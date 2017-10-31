package com.terrence.crm.dol.service.impl;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
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
import com.terrence.crm.dol.bean.Yqt;
import com.terrence.crm.dol.dao.IYiyunupdateDao;
import com.terrence.crm.dol.dao.IYqtDao;
import com.terrence.crm.dol.query.YqtQuery;
import com.terrence.crm.dol.service.IYqtService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class YqtService extends BaseService implements IYqtService {
	@Autowired
	@Qualifier("yqtDao")
	private IYqtDao yqtDao;
	@Autowired
	@Qualifier("yiyunupdateDao")
	private IYiyunupdateDao yiyunupdateDao;
	@Override
	public Yqt getById(Long id) throws ServiceException {
		return yqtDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Yqt entity) throws ServiceException {
		String time = DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss");
		entity.setCreateDate(time);
		entity.setCreaterId(SpringSecurityUtils.getCurrentUserId());
		if(null!=entity.getId()){
			update(entity);
			Yiyunupdate yiyunupdate = new Yiyunupdate();
			yiyunupdate.setCreaterId(SpringSecurityUtils.getCurrentUserId());
			yiyunupdate.setCreateTime(time);
			yiyunupdate.setFid(entity.getId());
			yiyunupdate.setFtable("YqtMark");
			yiyunupdateDao.save(yiyunupdate);
		}else{
			save(entity);
		}
	}
	@Override
	public Long save(Yqt entity) throws ServiceException {
		return yqtDao.save(entity);
	}
	@Override
	public Integer update(Yqt entity) throws ServiceException {
		return yqtDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return yqtDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = yqtDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Yqt> findPage(Page<Yqt> page, YqtQuery query) throws ServiceException{
		return yqtDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Yqt> findPage(Page<Yqt> page,String statement, YqtQuery query) throws ServiceException{
		return yqtDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Yqt> findList(YqtQuery query) throws ServiceException{
		return yqtDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Yqt> findList(YqtQuery query,Integer pageSize) throws ServiceException{
		return yqtDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yqt> findList(YqtQuery query,String statement,Integer pageSize) throws ServiceException{
		return yqtDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Yqt> findAllList() throws ServiceException{
		return yqtDao.findAllList();
	}
	@Override
	public List<Yqt> findList(String statement, YqtQuery yqtQuery) throws ServiceException {
		return yqtDao.findList(statement, yqtQuery);
	}
	@Override
	public void exportExcell2007(HttpServletResponse response) throws Exception{
		List<Yqt> yqtlist = yqtDao.findAllList();
		// 创建一个excel文件
		XSSFWorkbook wb = new XSSFWorkbook();
		// 创建一个sheet对象
		XSSFSheet sheet = wb.createSheet("一起听列表");
		//设置列宽
		//有int值转像素需要乘以32
		int[] widths = new int[]{30,300,50,50};
		for(int i=0;i<widths.length;i++){
			sheet.setColumnWidth((short)i, (short)(widths[i]*32));
		}
		Map<Integer, String> map = new HashMap<Integer, String>();
		map.put(1, "故事");
		map.put(2, "儿歌");
		map.put(3, "童话");
		map.put(4, "国学");
		XSSFRow row0 = sheet.createRow(0);
		createCell(wb, row0, 0, "序号");
		createCell(wb, row0, 1, "名称");
		createCell(wb, row0, 2, "时长");
		createCell(wb, row0, 3, "类型");
		if(null!=yqtlist&&yqtlist.size()>0){
			for(int i=1;i<=yqtlist.size();i++){
				XSSFRow row = sheet.createRow(i);
				createCell(wb, row, 0, i+"");
				createCell(wb, row, 1, yqtlist.get(i-1).getFname());
				createCell(wb, row, 2, yqtlist.get(i-1).getTimes()+"");
				createCell(wb, row, 3, map.get(yqtlist.get(i-1).getFtype()));
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
