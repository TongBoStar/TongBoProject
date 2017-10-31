package com.terrence.crm.dol.service.impl;
import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Stcode;
import com.terrence.crm.dol.bean.Yqcode;
import com.terrence.crm.dol.dao.IStcodeDao;
import com.terrence.crm.dol.dao.IYqcodeDao;
import com.terrence.crm.dol.query.StcodeQuery;
import com.terrence.crm.dol.query.YqcodeQuery;
import com.terrence.crm.dol.service.IStcodeService;
import com.terrence.crm.dol.utils.BarcodeUtil;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.QRCodeUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class StcodeService extends BaseService implements IStcodeService {
	@Autowired
	@Qualifier("stcodeDao")
	private IStcodeDao stcodeDao;
	@Autowired
	@Qualifier("yqcodeDao")
	private IYqcodeDao yqcodeDao;
	@Override
	public Stcode getById(Long id) throws ServiceException {
		return stcodeDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Stcode entity) throws ServiceException {
		entity.setCreaterId(SpringSecurityUtils.getCurrentUserId());
		entity.setCreateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
		if(null!=entity.getId()){
			update(entity);
			String path = ServletActionContext.getServletContext().getRealPath("/stcode");
			File file = new File(path);
			if(!file.exists()){
				file.mkdir();
			}
			try {
				QRCodeUtils.encodeStCode(entity.getStCode(),"",path,true);
			} catch (Exception e) {
				throw new ServiceException("生成设备序列号二维码错误");
			}
		}else{
			YqcodeQuery yqcodeQuery = new YqcodeQuery();
			yqcodeQuery.setFmark("ST");
			List<Yqcode> list = yqcodeDao.findList(yqcodeQuery);
			//entity.setStCode("ST"+String.format("%0" + 6 + "d", Integer.parseInt("000") + list.get(0).getSeqno()));
			Calendar c = Calendar.getInstance();
			String abc = "";
			if(list.get(0).getSeqno()<1000){
				abc = "A";
			}else if(list.get(0).getSeqno()>=1000&&list.get(0).getSeqno()<5000){
				abc = "B";
			}else if(list.get(0).getSeqno()>=5000&&list.get(0).getSeqno()<10000){
				abc = "C";
			}else if(list.get(0).getSeqno()>=10000&&list.get(0).getSeqno()<50000){
				abc = "D";
			}else{
				abc = "E";
			}
			entity.setStCode("ST"+(c.get(Calendar.YEAR)-2000)+abc+list.get(0).getSeqno());
			entity.setSadd(1);
			save(entity);
			String path = ServletActionContext.getServletContext().getRealPath("/stcode");
			File file = new File(path);
			if(!file.exists()){
				file.mkdir();
			}
			try {
				QRCodeUtils.encodeStCode(entity.getStCode(),"",path,true);
				if(null!=entity.getBarcode()&&!"".equals(entity.getBarcode())){
					BarcodeUtil.generateFile(entity.getBarcode(), path+entity.getBarcode()+".jpg");
				}
			} catch (Exception e) {
				throw new ServiceException("生成设备序列号二维码错误");
			}
			list.get(0).setSeqno(list.get(0).getSeqno()+1);
			yqcodeDao.update(list.get(0));
		}
	}
	@Override
	public Long save(Stcode entity) throws ServiceException {
		return stcodeDao.save(entity);
	}
	@Override
	public Integer update(Stcode entity) throws ServiceException {
		return stcodeDao.update(entity);
	}
	@Override
	public Integer update(String statement,Stcode entity) throws ServiceException {
		return stcodeDao.update(statement,entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return stcodeDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = stcodeDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Stcode> findPage(Page<Stcode> page, StcodeQuery query) throws ServiceException{
		return stcodeDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Stcode> findPage(Page<Stcode> page,String statement, StcodeQuery query) throws ServiceException{
		return stcodeDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Stcode> findList(StcodeQuery query) throws ServiceException{
		return stcodeDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Stcode> findList(StcodeQuery query,Integer pageSize) throws ServiceException{
		return stcodeDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Stcode> findList(StcodeQuery query,String statement,Integer pageSize) throws ServiceException{
		return stcodeDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Stcode> findAllList() throws ServiceException{
		return stcodeDao.findAllList();
	}
	@Override
	public Stcode findStCode(StcodeQuery stcodeQuery) throws ServiceException {
		synchronized (StcodeService.class) {
			Stcode stcode = stcodeDao.getByProperty("serialNumber", stcodeQuery.getSerialNumber());
			if(null!=stcode){
				return stcode;
			}else{
				YqcodeQuery yqcodeQuery = new YqcodeQuery();
				yqcodeQuery.setFmark("ST");
				List<Yqcode> list = yqcodeDao.findList(yqcodeQuery);
				stcode = new Stcode();
				stcode.setSerialNumber(stcodeQuery.getSerialNumber());
				//stcode.setStCode("ST"+String.format("%0" + 6 + "d", Integer.parseInt("000") + list.get(0).getSeqno()));
				Calendar c = Calendar.getInstance();
				String abc = "";
				if(list.get(0).getSeqno()<1000){
					abc = "A";
				}else if(list.get(0).getSeqno()>=1000&&list.get(0).getSeqno()<5000){
					abc = "B";
				}else if(list.get(0).getSeqno()>=5000&&list.get(0).getSeqno()<10000){
					abc = "C";
				}else if(list.get(0).getSeqno()>=10000&&list.get(0).getSeqno()<50000){
					abc = "D";
				}else{
					abc = "E";
				}
				stcode.setStCode("ST"+(c.get(Calendar.YEAR)-2000)+abc+list.get(0).getSeqno());
				stcode.setCreateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
				save(stcode);
				list.get(0).setSeqno(list.get(0).getSeqno()+1);
				yqcodeDao.update(list.get(0));
				String path = ServletActionContext.getServletContext().getRealPath("/stcode");
				File file = new File(path);
				if(!file.exists()){
					file.mkdir();
				}
				try {
					QRCodeUtils.encodeStCode(stcode.getStCode(),"",path,true);
					if(null!=stcode.getBarcode()&&!"".equals(stcode.getBarcode())){
						BarcodeUtil.generateFile(stcode.getBarcode(), path+stcode.getBarcode()+".jpg");
					}
				} catch (Exception e) {
					throw new ServiceException("生成设备序列号二维码错误");
				}
				return stcode;
			}
		}
	}
	@Override
	public List<Stcode> findList(String statement, StcodeQuery stcodeQuery) throws ServiceException {
		List<Stcode> stcodeList;
		if("Stcode.findList.voice".equals(statement)){
			stcodeQuery.setCreaterId(new Date().getTime());
			stcodeList = stcodeDao.findList(statement, stcodeQuery);
			if(null!=stcodeList&&stcodeList.size()>0){
				for(Stcode stcode:stcodeList){
					Stcode stcode2 = new Stcode();
					stcode2.setSerialNumber(stcode.getSerialNumber());
					stcode2.setCreaterId(stcode.getId());
					stcodeDao.save(stcode2,"Stcode.Insert.Voice");
				}
			}
		}else{
			stcodeList = stcodeDao.findList(statement, stcodeQuery);
		}
		return stcodeList;
	}
}
