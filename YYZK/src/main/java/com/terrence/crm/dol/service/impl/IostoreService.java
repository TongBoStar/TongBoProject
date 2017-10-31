package com.terrence.crm.dol.service.impl;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;

import sun.print.resources.serviceui;

import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Iostore;
import com.terrence.crm.dol.bean.IostoreDetail;
import com.terrence.crm.dol.bean.Stcode;
import com.terrence.crm.dol.bean.Yqcode;
import com.terrence.crm.dol.bean.Yybom;
import com.terrence.crm.dol.bean.Yyinventory;
import com.terrence.crm.dol.bean.Yyitem;
import com.terrence.crm.dol.dao.IIostoreDao;
import com.terrence.crm.dol.dao.IIostoreDetailDao;
import com.terrence.crm.dol.dao.IStcodeDao;
import com.terrence.crm.dol.dao.IYqcodeDao;
import com.terrence.crm.dol.dao.IYybomDao;
import com.terrence.crm.dol.dao.IYyinventoryDao;
import com.terrence.crm.dol.dao.impl.YyitemDao;
import com.terrence.crm.dol.query.IostoreQuery;
import com.terrence.crm.dol.query.StcodeQuery;
import com.terrence.crm.dol.query.YqcodeQuery;
import com.terrence.crm.dol.query.YybomQuery;
import com.terrence.crm.dol.query.YyinventoryQuery;
import com.terrence.crm.dol.service.IIostoreService;
import com.terrence.crm.dol.utils.DateUtils;
import com.terrence.crm.dol.utils.SpringSecurityUtils;
@Service
@Transactional
public class IostoreService extends BaseService implements IIostoreService {
	@Autowired
	@Qualifier("iostoreDao")
	private IIostoreDao iostoreDao;
	@Autowired
	@Qualifier("yyinventoryDao")
	private IYyinventoryDao yyinventoryDao;
	@Autowired
	@Qualifier("yybomDao")
	private IYybomDao yybomDao;
	@Autowired
	@Qualifier("iostoreDetailDao")
	private IIostoreDetailDao iostoreDetailDao;
	@Autowired
	@Qualifier("yqcodeDao")
	private IYqcodeDao yqcodeDao;
	@Autowired
	@Qualifier("stcodeDao")
	private IStcodeDao stcodeDao;
	@Autowired
	@Qualifier("yyitemDao")
	private YyitemDao yyitemDao;
	@Override
	public Iostore getById(Long id) throws ServiceException {
		return iostoreDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Iostore entity) throws ServiceException {
		entity.setCreateTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
		entity.setCreateUserId(SpringSecurityUtils.getCurrentUserId());
		if(null!=entity.getId()){
			Iostore iostore = iostoreDao.getById(entity.getId());
			iostoreDao.deleteById(entity.getId());
			if(iostore.getDataType()==2&&iostore.getFtype()==1){
				iostoreDetailDao.deleteByMultipleId("IostoreDetail.delete.iostoreId", entity.getFbillno());
			}
		}
		List<Yyinventory> yylist = yyinventoryDao.findAllList();
		Map<String, Yyinventory> map = new HashMap<String, Yyinventory>();
		YqcodeQuery yqcodeQuery = new YqcodeQuery();
		yqcodeQuery.setFmark("YYIN");
		List<Yqcode> listcode = yqcodeDao.findList(yqcodeQuery);
		for(Yyinventory yy:yylist){
			map.put(yy.getItemCode(), yy);
		}
		if(entity.getDataType()==1){//入库
			listcode.get(0).getSeqno();
			entity.setFbillno("YYIN"+String.format("%0" + 4 + "d", Integer.parseInt("00") + listcode.get(0).getSeqno()));
			iostoreDao.save(entity);
			Yqcode yqcode = new Yqcode();
			yqcode.setId(listcode.get(0).getId());
			yqcode.setSeqno(listcode.get(0).getSeqno()+1);
			yqcodeDao.update(yqcode);
			
			if(map.containsKey(entity.getItemCode())){
				YyinventoryQuery query = new YyinventoryQuery();
				query.setItemCode(entity.getItemCode());
				List<Yyinventory> yyinventorys = yyinventoryDao.findList(query);
				Yyinventory yyinventory = yyinventorys.get(0);
				yyinventory.setFqty(entity.getFqty()+yyinventory.getFqty());
				yyinventoryDao.update(yyinventory);
			}else{
				Yyinventory yyinventory = new Yyinventory();
				yyinventory.setItemCode(entity.getItemCode());
				yyinventory.setItemName(entity.getItemName());
				yyinventory.setFbatchno(entity.getFbatchno());
				yyinventory.setFqty(entity.getFqty());
				yyinventoryDao.save(yyinventory);
			}
		}else{//出库
			yqcodeQuery.setFmark("YYOUT");
			listcode = yqcodeDao.findList(yqcodeQuery);
			entity.setFbillno("YYOUT"+String.format("%0" + 4 + "d", Integer.parseInt("00") + listcode.get(0).getSeqno()));
			Yqcode yqcode = new Yqcode();
			yqcode.setId(listcode.get(0).getId());
			yqcode.setSeqno(listcode.get(0).getSeqno()+1);
			yqcodeDao.update(yqcode);
			if(entity.getFtype()==1){//产品出库
				StcodeQuery stcodeQuery = new StcodeQuery();
				stcodeQuery.setStCode(entity.getSerialNumber());
				List<Stcode> stcodeList = stcodeDao.findList(stcodeQuery);
				Stcode stcode = stcodeList.get(0);
				Long id = iostoreDao.save(entity);
				YybomQuery yybomQuery = new YybomQuery();
				yybomQuery.setPitemCode(entity.getItemCode());
				List<Yybom> yybomList = yybomDao.findList("Yybom.findList.bomlist", yybomQuery);
				Yyinventory yyinventory = null;
				IostoreDetail iostoreDetail = null;
				float cqty = entity.getFqty();
				for(Yybom yybom:yybomList){
					if(null!=map.get(yybom.getCitemCode())&&map.get(yybom.getCitemCode()).getFqty()-cqty*yybom.getFqty()>=0){
						yyinventory = new Yyinventory();
						yyinventory.setItemCode(yybom.getCitemCode());
						yyinventory.setFqty(map.get(yybom.getCitemCode()).getFqty()-cqty*yybom.getFqty());
						yyinventoryDao.update(yyinventory);
						
						iostoreDetail = new IostoreDetail();
						iostoreDetail.setFid(id);
						iostoreDetail.setItemCode(yybom.getCitemCode());
						iostoreDetail.setItemMode(yybom.getCitemMode());
						iostoreDetail.setItemName(yybom.getCitemName());
						iostoreDetail.setFunit(yybom.getFunit());
						iostoreDetailDao.save(iostoreDetail);
					}else{
						throw new ServiceException(yybom.getCitemCode()+","+yybom.getCitemName()+":库存不足.");
					}
				}
				Yyitem xuexikai = yyitemDao.getByColumn("Yyitem.findByItemCode", "21.21.01");
				Yyitem mubui = yyitemDao.getByColumn("Yyitem.findByItemCode", "21.20.01");
				Yyitem youpani = yyitemDao.getByColumn("Yyitem.findByItemCode", "21.12.01");
				Yyitem sanjiaojiai = yyitemDao.getByColumn("Yyitem.findByItemCode", "21.13.01");
				IostoreDetail xuexika = new IostoreDetail();
				xuexika.setFid(id);
				xuexika.setItemCode(xuexikai.getItemCode());
				xuexika.setItemMode(xuexikai.getItemMode());
				xuexika.setItemName(xuexikai.getItemName());
				xuexika.setFunit(xuexikai.getFunit());
				IostoreDetail sanjiaojia = new IostoreDetail();
				sanjiaojia.setItemCode(sanjiaojiai.getItemCode());
				sanjiaojia.setItemMode(sanjiaojiai.getItemMode());
				sanjiaojia.setItemName(sanjiaojiai.getItemName());
				sanjiaojia.setFunit(sanjiaojiai.getFunit());
				IostoreDetail youpan = new IostoreDetail();
				youpan.setItemCode(youpani.getItemCode());
				youpan.setItemMode(youpani.getItemMode());
				youpan.setItemName(youpani.getItemName());
				youpan.setFunit(youpani.getFunit());
				IostoreDetail mubu = new IostoreDetail();
				mubu.setItemCode(mubui.getItemCode());
				mubu.setItemMode(mubui.getItemMode());
				mubu.setItemName(mubui.getItemName());
				mubu.setFunit(mubui.getFunit());
				//赠品的出库
				if(stcode.getGiveaway()==1){//学习卡+三脚架+优盘
					if(null!=map.get("21.21.01")&&map.get("21.21.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(xuexika);
						changeinventory(xuexikai, map.get("21.21.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.21.01 学习卡:库存不足.");
					}
					if(null!=map.get("21.13.01")&&map.get("21.13.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(sanjiaojia);
						changeinventory(sanjiaojiai, map.get("21.13.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.13.01 三脚架:库存不足.");
					}
					if(null!=map.get("21.12.01")&&map.get("21.12.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(youpan);
						changeinventory(youpani, map.get("21.12.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.12.01 优盘:库存不足.");
					}
				}else if(stcode.getGiveaway()==2){//学习卡+三脚架
					if(null!=map.get("21.21.01")&&map.get("21.21.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(xuexika);
						changeinventory(xuexikai, map.get("21.21.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.21.01  学习卡:库存不足.");
					}
					if(null!=map.get("21.13.01")&&map.get("21.13.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(sanjiaojia);
						changeinventory(sanjiaojiai, map.get("21.13.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.13.01 三脚架:库存不足.");
					}
				}else if(stcode.getGiveaway()==3){//学习卡+优盘
					if(null!=map.get("21.21.01")&&map.get("21.21.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(xuexika);
						changeinventory(xuexikai, map.get("21.21.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.21.01  学习卡:库存不足.");
					}
					if(null!=map.get("21.12.01")&&map.get("21.12.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(youpan);
						changeinventory(youpani, map.get("21.12.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.12.01 优盘:库存不足.");
					}
				}else if(stcode.getGiveaway()==4){//学习卡
					if(null!=map.get("21.21.01")&&map.get("21.21.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(xuexika);
						changeinventory(xuexikai, map.get("21.21.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.21.01  学习卡:库存不足.");
					}
				}else if(stcode.getGiveaway()==5){//优盘
					if(null!=map.get("21.12.01")&&map.get("21.12.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(youpan);
						changeinventory(youpani, map.get("21.12.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.12.01 优盘:库存不足.");
					}
				}else if(stcode.getGiveaway()==6){//幕布
					if(null!=map.get("21.20.01")&&map.get("21.20.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(mubu);
						changeinventory(mubui, map.get("21.20.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.20.01 幕布:库存不足.");
					}
				}else if(stcode.getGiveaway()==7){//学习卡+三脚架+优盘+幕布
					if(null!=map.get("21.21.01")&&map.get("21.21.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(xuexika);
						changeinventory(xuexikai, map.get("21.21.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.21.01  学习卡:库存不足.");
					}
					if(null!=map.get("21.13.01")&&map.get("21.13.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(sanjiaojia);
						changeinventory(sanjiaojiai, map.get("21.13.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.13.01 三脚架:库存不足.");
					}
					if(null!=map.get("21.12.01")&&map.get("21.12.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(youpan);
						changeinventory(youpani, map.get("21.12.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.12.01 优盘:库存不足.");
					}
					if(null!=map.get("21.20.01")&&map.get("21.20.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(mubu);
						changeinventory(mubui, map.get("21.20.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.20.01 幕布:库存不足.");
					}
				}else if(stcode.getGiveaway()==8){//优盘+幕布
					if(null!=map.get("21.12.01")&&map.get("21.12.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(youpan);
						changeinventory(youpani, map.get("21.12.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.12.01 优盘:库存不足.");
					}
					if(null!=map.get("21.20.01")&&map.get("21.20.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(mubu);
						changeinventory(mubui, map.get("21.20.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.20.01 幕布:库存不足.");
					}
				}else if(stcode.getGiveaway()==9){//三脚架+幕布
					if(null!=map.get("21.13.01")&&map.get("21.13.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(sanjiaojia);
						changeinventory(sanjiaojiai, map.get("21.13.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.13.01 三脚架:库存不足.");
					}
					if(null!=map.get("21.20.01")&&map.get("21.20.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(mubu);
						changeinventory(mubui, map.get("21.20.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.20.01 幕布:库存不足.");
					}
				}else if(stcode.getGiveaway()==10){//学习卡+幕布
					if(null!=map.get("21.21.01")&&map.get("21.21.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(xuexika);
						changeinventory(xuexikai, map.get("21.21.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.21.01  学习卡:库存不足.");
					}
					if(null!=map.get("21.20.01")&&map.get("21.20.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(mubu);
						changeinventory(mubui, map.get("21.20.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.20.01 幕布:库存不足.");
					}
				}else if(stcode.getGiveaway()==11){//无
					
				}else if(stcode.getGiveaway()==12){//幕布+三脚架+优盘
					if(null!=map.get("21.13.01")&&map.get("21.13.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(sanjiaojia);
						changeinventory(sanjiaojiai, map.get("21.13.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.13.01 三脚架:库存不足.");
					}
					if(null!=map.get("21.12.01")&&map.get("21.12.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(youpan);
						changeinventory(youpani, map.get("21.12.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.12.01 优盘:库存不足.");
					}
					if(null!=map.get("21.20.01")&&map.get("21.20.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(mubu);
						changeinventory(mubui, map.get("21.20.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.20.01 幕布:库存不足.");
					}
				}else if(stcode.getGiveaway()==13){//幕布+三脚架+学习卡
					if(null!=map.get("21.21.01")&&map.get("21.21.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(xuexika);
						changeinventory(xuexikai, map.get("21.21.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.21.01  学习卡:库存不足.");
					}
					if(null!=map.get("21.13.01")&&map.get("21.13.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(sanjiaojia);
						changeinventory(sanjiaojiai, map.get("21.13.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.13.01 三脚架:库存不足.");
					}
					if(null!=map.get("21.20.01")&&map.get("21.20.01").getFqty()-cqty>=0){
						iostoreDetailDao.save(mubu);
						changeinventory(mubui, map.get("21.20.01").getFqty()-entity.getFqty());
					}else{
						throw new ServiceException("21.20.01 幕布:库存不足.");
					}
				}else{
					
				}
			}else{//零件出库
				if(map.get(entity.getItemCode()).getFqty()-entity.getFqty()>=0){//库存不足
					Yyinventory yyinventory = new Yyinventory();
					yyinventory.setYyItemId(map.get(entity.getItemCode()).getYyItemId());
					yyinventory.setFqty(map.get(entity.getItemCode()).getFqty()-entity.getFqty());
					yyinventoryDao.update("Yyinventory.updateByItemId",yyinventory);
					iostoreDao.save(entity);
				}else{
					throw new ServiceException(entity.getItemCode()+","+entity.getItemName()+"的库存不足.");
				}
			}
		}
		//iostoreDao.saveOrUpdate(entity);
	}
	public void changeinventory(Yyitem entity,Float fqty){
		Yyinventory yyinventory = new Yyinventory();
		yyinventory.setYyItemId(entity.getId());
		yyinventory.setFqty(fqty);
		yyinventoryDao.update("Yyinventory.updateByItemId",yyinventory);
	}
	@Override
	public Long save(Iostore entity) throws ServiceException {
		return iostoreDao.save(entity);
	}
	@Override
	public Integer update(Iostore entity) throws ServiceException {
		return iostoreDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return iostoreDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		IostoreQuery query = new IostoreQuery();
		query.setFbillno(delIds);
		List<Iostore> list = iostoreDao.findList("Iostore.findList.delIds", query);
		if(null!=list&&list.size()>0){
			Yyinventory yyinventory = null;
			YyinventoryQuery yyinventoryQuery = null;
			for(Iostore io:list){
				yyinventoryQuery = new YyinventoryQuery();
				yyinventoryQuery.setItemCode(io.getItemCode());
				List<Yyinventory> list2 = yyinventoryDao.findList(yyinventoryQuery);
				yyinventory = new Yyinventory();
				yyinventory.setYyItemId(list2.get(0).getYyItemId());
				yyinventory.setFqty(list2.get(0).getFqty()+io.getFqty());
				yyinventoryDao.update(yyinventory);
				
				if(null!=io.getSerialNumber()){
					StcodeQuery stcodeQuery = new StcodeQuery();
					stcodeQuery.setStCode(io.getSerialNumber());
					List<Stcode> stcodeList = stcodeDao.findList(stcodeQuery);
					Stcode stcode = stcodeList.get(0);
				}
			}
		}
		Integer returnValue = iostoreDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Iostore> findPage(Page<Iostore> page, IostoreQuery query) throws ServiceException{
		return iostoreDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Iostore> findPage(Page<Iostore> page,String statement, IostoreQuery query) throws ServiceException{
		return iostoreDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Iostore> findList(IostoreQuery query) throws ServiceException{
		return iostoreDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Iostore> findList(IostoreQuery query,Integer pageSize) throws ServiceException{
		return iostoreDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Iostore> findList(IostoreQuery query,String statement,Integer pageSize) throws ServiceException{
		return iostoreDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Iostore> findAllList() throws ServiceException{
		return iostoreDao.findAllList();
	}
}
