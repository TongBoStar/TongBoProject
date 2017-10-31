package com.terrence.crm.dol.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
  
/**   
* 简单邮件（不带附件的邮件）发送器   
http://www.bt285.cn BT下载
*/    
public class SimpleMailSender  {    
/**   
  * 以文本格式发送邮件   
  * @param mailInfo 待发送的邮件的信息   
  */    
    public boolean sendTextMail(MailSenderInfo mailInfo) {    
      // 判断是否需要身份认证    
      MyAuthenticator authenticator = null;    
      Properties pro = mailInfo.getProperties();   
      if (mailInfo.isValidate()) {    
      // 如果需要身份认证，则创建一个密码验证器    
        authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword());    
      }   
      // 根据邮件会话属性和密码验证器构造一个发送邮件的session    
      Session sendMailSession = Session.getDefaultInstance(pro,authenticator);    
      try {    
      // 根据session创建一个邮件消息    
      Message mailMessage = new MimeMessage(sendMailSession);    
      // 创建邮件发送者地址    
      Address from = new InternetAddress(mailInfo.getFromAddress());    
      // 设置邮件消息的发送者    
      mailMessage.setFrom(from);    
      // 创建邮件的接收者地址，并设置到邮件消息中    
      Address to = new InternetAddress(mailInfo.getToAddress());    
      mailMessage.setRecipient(Message.RecipientType.TO,to);    
      // 设置邮件消息的主题    
      mailMessage.setSubject(mailInfo.getSubject());    
      // 设置邮件消息发送的时间    
      mailMessage.setSentDate(new Date());    
      // 设置邮件消息的主要内容    
      String mailContent = mailInfo.getContent();    
      mailMessage.setText(mailContent);    
      // 发送邮件    
      Transport.send(mailMessage);   
      return true;    
      } catch (MessagingException ex) {    
          ex.printStackTrace();    
      }    
      return false;    
    }    
       
    /**   
      * 以HTML格式发送邮件   
      * @param mailInfo 待发送的邮件信息   
      */    
    public static boolean sendHtmlMail(MailSenderInfo mailInfo){    
      // 判断是否需要身份认证    
      MyAuthenticator authenticator = null;   
      Properties pro = mailInfo.getProperties();   
      //如果需要身份认证，则创建一个密码验证器     
      if (mailInfo.isValidate()) {    
        authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword());   
      }    
      // 根据邮件会话属性和密码验证器构造一个发送邮件的session    
      Session sendMailSession = Session.getDefaultInstance(pro,authenticator);    
      try {    
      // 根据session创建一个邮件消息    
      Message mailMessage = new MimeMessage(sendMailSession);    
      // 创建邮件发送者地址    
      Address from = new InternetAddress(mailInfo.getFromAddress());    
      // 设置邮件消息的发送者    
      mailMessage.setFrom(from);    
      // 创建邮件的接收者地址，并设置到邮件消息中    
      Address to = new InternetAddress(mailInfo.getToAddress());    
      // Message.RecipientType.TO属性表示接收者的类型为TO    
      mailMessage.setRecipient(Message.RecipientType.TO,to);    
      // 设置邮件消息的主题    
      mailMessage.setSubject(mailInfo.getSubject());    
      // 设置邮件消息发送的时间    
      mailMessage.setSentDate(new Date());    
      // MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象    
      Multipart mainPart = new MimeMultipart();    
      // 创建一个包含HTML内容的MimeBodyPart    
      BodyPart html = new MimeBodyPart();    
      // 设置HTML内容    
      html.setContent(mailInfo.getContent(), "text/html; charset=utf-8");    
      mainPart.addBodyPart(html);    
      // 将MiniMultipart对象设置为邮件内容    
      mailMessage.setContent(mainPart);    
      // 发送邮件    
      Transport.send(mailMessage);    
      return true;    
      } catch (MessagingException ex) {    
          ex.printStackTrace();    
      }    
      return false;    
    }    
    public static void Main(String[] args) {
    	// 这个类主要是设置邮件 
    	//MailSenderInfo mailInfo = new MailSenderInfo();
    	/*mailInfo.setMailServerHost("smtp.126.com");// 发送邮箱的服务器（163的邮箱就为：smtp.163.com） 
        mailInfo.setMailServerPort("25"); 
    	mailInfo.setValidate(true); 
    	mailInfo.setUserName("*****"); // 邮箱账户   
    	mailInfo.setPassword("*****");// 邮箱密码 
    	mailInfo.setFromAddress("15029010036@126.com"); // 发送人的邮箱地址   
    	mailInfo.setToAddress("121374067@qq.com"); // 要发送的邮箱地址   
    	mailInfo.setSubject("**的主页"); // 邮箱标题
    	// 邮件内容 
    	// mailInfo.setContent("你好！");  //文本格式的邮件内容    
    	// html页面格式的邮件内容  
    	mailInfo.setContent("<div "+
    	+"style='width:500px;height:100px;background-color:yellow;text-align:center;color:red;font-size:20px;border:solid red;'><b><a"+
    	+"href='http://121374067.qzone.qq.com/'>欢迎来到我的主页！</a></b></div>");
    	 // 这个类主要来发送邮件 
    	 SimpleMailSender sms = new SimpleMailSender();
    	 //boolean flag = sms.sendTextMail(mailInfo);// 发送文体格式    
    	boolean flag = sms.sendHtmlMail(mailInfo);// 发送html格式    
    	if(flag){
    	   System.out.println("发送成功！");
    	}else{
    		System.out.println("发送失败！");     
        } */
    	SimpleMailSender sms=new SimpleMailSender();
        }
}   
