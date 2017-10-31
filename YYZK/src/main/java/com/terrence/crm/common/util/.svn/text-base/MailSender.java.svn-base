package com.terrence.crm.common.util;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;
/**
 * @version 1.0
 * @author Luo Yong  <luoyong@voicesoft.cn>
 * Created on : 2009-9-16, 17:06:09
 * Copyright© 2009 Voicesoft Communications International Inc.All rights reserved.
 * Description 邮件发送器
 */
public class MailSender {
    final static Logger logger = Logger.getLogger(MailSender.class);
    /**
     * 发送邮件方法
     * @param emailAddr
     * @param mailTitle
     * @param mailConcept
     * @param fileAttachment
     * @throws java.lang.Exception
     */
    public static void sendMail(final String emailAddr, final String mailTitle,
            final String mailConcept, final String fileAttachment) throws Exception {
        logger.info("sending... To: " + emailAddr + " Mail Title: " + mailTitle + " fileAttachment: " + fileAttachment);
        Properties props = new Properties();
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        props.load(classLoader.getResourceAsStream("mail.properties"));
        // props.list(System.out);
        
        /*String smtp = "smtp.163.com";
        String username="abtianliyuan";
        String password="ohblue123456,.;";
        String from = "abtianliyuan@163.com";
        
        String[] to = {"tlybj2015@163.com","tlyterrence@163.com"};//abtianliyuan@.com
        
        //String[] copyto = {"xxx@qq.com"};
        String[] copyto = {"tlynewcity@163.com","ohjoneterrence@163.com"};
        
        String subject = "关于年会的通知2015";
        String content = "关于年会的通知2015";
       String filename = "D:\\路线-车辆-桌次.xls";*/
        
        final String username = props.getProperty("mail.username");
        final String password = props.getProperty("mail.password");
        final String mailFrom = props.getProperty("mail.from");
        
        Session mailSession = Session.getDefaultInstance(props,
                new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        mailSession.setDebug(false);
        Transport transport = mailSession.getTransport();
        MimeMessage message = new MimeMessage(mailSession);
        message.setSubject(mailTitle);
        message.setFrom(new InternetAddress(mailFrom));
        message.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(
                emailAddr, false));
        // create the message part
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        // fill message
        // messageBodyPart.setText("");
        messageBodyPart.setContent(mailConcept, "text/html; charset=utf-8");
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
        if (fileAttachment != null) {
            // Part two is attachment
            messageBodyPart = new MimeBodyPart();
            DataSource source = new FileDataSource(fileAttachment);
            messageBodyPart.setDataHandler(new DataHandler(source));
            String fileName = new String(fileAttachment.getBytes("UTF-8"),
                    "UTF-8");
            int pos = fileName.lastIndexOf("//");
            //int pos = fileName.lastIndexOf(File.separator);
            fileName = fileName.substring(pos + 1);
            messageBodyPart.setFileName(fileName);
            multipart.addBodyPart(messageBodyPart);
        // Put parts in message
        }
        message.setContent(multipart);
        transport.connect();
        transport.sendMessage(message, message.getRecipients(Message.RecipientType.BCC));
        transport.close();
        logger.info("end!  To: " + emailAddr + " Mail Title: " + mailTitle + " fileAttachment: " + fileAttachment);
    }
    /**
     * 异步方式发送邮件
     * @param emailAddr
     * @param mailTitle
     * @param mailConcept
     * @param fileAttachment
     */
    public static void sendMailByAsynchronous(final String emailAddr, final String mailTitle,
            final String mailConcept, final String fileAttachment) {

        new Thread(new Runnable() {
            public void run() {
                try {
                	Thread.sleep(9000);  
                    MailSender.sendMail(emailAddr, mailTitle, mailConcept,
                            fileAttachment);
                } catch (Exception ex) {
                    logger.error("mail sender error To: " + emailAddr + " Mail Title: " + mailTitle + " fileAttachment: " + fileAttachment, ex);
                }
            }
        }).start();
    }
    public static void main(String[] args) throws Exception {
        MailSender.sendMail("tlybj2015@163.com", "系统异常邮件报告1", "这里是呼叫中心管理系统的异常报告内容", "D:\\路线-车辆-桌次.xls");
        System.out.println("1");
        MailSender.sendMail("tlybj2015@163.com", "系统异常邮件报告2", "这里是呼叫中心管理系统的异常报告内容", "D:\\路线-车辆-桌次.xls");
        System.out.println("2");
    }
}

