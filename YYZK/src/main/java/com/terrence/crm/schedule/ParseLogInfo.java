package com.terrence.crm.schedule;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.terrence.crm.dol.bean.Stuselog;
import com.terrence.crm.dol.bean.Usermark;
import com.terrence.crm.dol.query.StuselogQuery;
import com.terrence.crm.dol.query.UsermarkQuery;
import com.terrence.crm.dol.service.IStuselogService;
import com.terrence.crm.dol.service.IUsermarkService;
import com.terrence.crm.dol.utils.DateUtils;

public class ParseLogInfo {
	@Autowired
	@Qualifier("stuselogService")
	private IStuselogService stuselogService;
	@Autowired
	@Qualifier("usermarkService")
	private IUsermarkService usermarkService;
	
	public void execParseLogInfo(){ 
		Long parseTime = new Date().getTime();
		/*stuselogService.getById(1L);
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
		}*/
		
		/*List<Usermark> userMarks = new ArrayList<Usermark>();
		usermarkService.getById(1L);
		List<Usermark> userMarkList = usermarkService.findList("Usermark.findList",new UsermarkQuery());
		String serialNumber = "";
		int operateType = 0;
		long takeTimeLogin = 0;
		long useTimes = 0;
		for(Usermark userMark:userMarkList){
			if(null==userMark.getTakeTime()){
				continue;
			}
			if(serialNumber.equals(userMark.getSerialNumber())){//是同一个设备的数据
				if(operateType==1){
					if(userMark.getOperateType()==2){
						long times = userMark.getTakeTime()-takeTimeLogin;
						if(times>24*60*60*1000){//超过一天了 舍弃
							
						}else{
							//useTimes += times;
							userMark.setUseTimes(times);
							usermarkService.update(userMark);
						}
					}else{
						takeTimeLogin = userMark.getTakeTime();
					}
				}else if(operateType==2){
					if(userMark.getOperateType()==1){
						takeTimeLogin = userMark.getTakeTime();
					}else{
						takeTimeLogin = 0;
					}
				}else{
					
				}
				operateType = userMark.getOperateType();
			}else{//不是同一个设备的数据
				System.out.println(useTimes+":"+serialNumber);
				if(operateType!=0){
					Usermark us = new Usermark();
					us.setSerialNumber(serialNumber);
					us.setTakeTime(useTimes);
					us.setUpTime(DateUtils.formtDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
					userMarks.add(us);
				}
				useTimes = 0;
				serialNumber = userMark.getSerialNumber();
				operateType = userMark.getOperateType();
				if(operateType==1){
					takeTimeLogin = userMark.getTakeTime();
				}else{
					takeTimeLogin = 0;
				}
			}
		}*/
	}
}
