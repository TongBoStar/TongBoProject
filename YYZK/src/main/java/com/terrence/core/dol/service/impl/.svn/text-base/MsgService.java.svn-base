package com.terrence.core.dol.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.exception.ServiceException;
import com.base.util.MailSenderInfo;
import com.base.util.MailSenderSimple;
import com.base.util.StringUtil;
import com.terrence.core.dol.bean.Msg;
import com.terrence.core.dol.dao.IMsgDao;
import com.terrence.core.dol.query.MsgQuery;
import com.terrence.core.dol.service.IMsgService;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.bean.Admin;
import com.terrence.crm.dol.dao.IAdminDao;

@Service
@Transactional
public class MsgService extends BaseService implements IMsgService {
   @Autowired
   @Qualifier("msgDao")
   private IMsgDao msgDao;
   @Autowired
   @Qualifier("adminDao")
   private IAdminDao adminDao;

   @Override
   public Page<Msg> findPage(Page<Msg> page,MsgQuery query) throws ServiceException {
       return msgDao.findPage(page, query);
   }

   @Override
   public List<Msg> findList(MsgQuery query) throws ServiceException {
	    return msgDao.findList(query);
   }

   @Override
   public Msg getById(Long id) throws ServiceException {
	    return msgDao.getById(id);
   }

   @Override
   public void saveOrUpdate(Msg entity) throws ServiceException {
	    msgDao.saveOrUpdate(entity);
   }

   @Override
   public Long save(Msg entity) throws ServiceException {
	    return msgDao.save(entity);
   }

   @Override
   public Integer update(Msg entity) throws ServiceException {
	    return msgDao.update(entity);
   }

   @Override
   public Integer deleteById(Long id) throws ServiceException {
	    return msgDao.deleteById(id);
   }

	@Override
	public void sendMsg(String toUserIds, String details, Long menuId) {
		// TODO Auto-generated method stub
		Date nowTime = new Date();
		String[] strToUserIds = toUserIds.split("\\,");
		for(String id : strToUserIds){
			if(!StringUtil.isNull(id)){
				//发系统消息
				Msg sysMsg = new Msg();
				sysMsg.setToUserId(Long.parseLong(id));
				sysMsg.setDetails(details);
				sysMsg.setState(0);
				sysMsg.setIsDel(0);
				sysMsg.setMenuId(menuId);
				sysMsg.setReceiveTime(nowTime);
				msgDao.save(sysMsg);
				
				//服务器不是win8 所以暂时先这样判断吧
				Properties props=System.getProperties();
				if(!props.getProperty("os.name").equals("Windows 8.1")){
					Admin user = adminDao.getById(Long.parseLong(id));
					//发邮件
					if(null!=user.getEmail() && !StringUtil.isNull(user.getEmail())){
						MailSenderInfo mailInfo = new MailSenderInfo();  
					    mailInfo.setMailServerHost("mail.terrence.com.cn");   
					    mailInfo.setMailServerPort("25");   
					    mailInfo.setValidate(true);   
					    mailInfo.setUserName("info.terrence@terrence.com.cn");   
					    mailInfo.setPassword("123456a");//您的邮箱密码   
					    mailInfo.setFromAddress("info.terrence@terrence.com.cn");   
					    mailInfo.setToAddress(user.getEmail());   
					    mailInfo.setSubject("系统消息");   
					    mailInfo.setContent(details);   
						//这个类主要来发送邮件  
					    MailSenderSimple sms = new MailSenderSimple();  
					    sms.sendTextMail(mailInfo);//发送文体格式
					    
					    
					}
				}

			}
		}
	}

	@Override
	public Long getCount(MsgQuery msgQuery) throws ServiceException {
		// TODO Auto-generated method stub
		return msgDao.getCount(msgQuery);
	}
}
