package com.terrence.crm.dol.utils;


 
import java.io.UnsupportedEncodingException;
import java.util.Properties;
 
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
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
import javax.mail.internet.MimeUtility;
 
 
public class EmailManager { 
 
    private Properties props; //系统属性 
    private Session session; //邮件会话对象 
    private MimeMessage mimeMsg; //MIME邮件对象 
    private Multipart mp; //Multipart对象,邮件内容,标题,附件等内容均添加到其中后再生成MimeMessage对象 
      
    /**
     * Constructor
     * @param smtp 邮件发送服务器
     */
    public EmailManager(){
        props = System.getProperties();   
        props.put("mail.smtp.auth","false"); 
        session = Session.getDefaultInstance(props, null);
        session.setDebug(true);
        mimeMsg = new MimeMessage(session);
        mp = new MimeMultipart(); 
    } 
 
    /**
     * Constructor
     * @param smtp 邮件发送服务器
     */
    public EmailManager(String smtp, String username, String password){ 
        props = System.getProperties();
        props.put("mail.smtp.auth","true"); 
        props.put("mail.smtp.host", smtp);
        props.put("username", username);
        props.put("password", password);
        session = Session.getDefaultInstance(props, null);
        session.setDebug(true);
        mimeMsg = new MimeMessage(session);
        mp = new MimeMultipart(); 
    } 
    /** 
     * 发送邮件
     */ 
    public boolean sendMail(String from, String[] to, String[] copyto, String subject, String content, 
    		String filename,String filename2 ) {
    	String toList = null;
		String toListcs = null;
		String toListms = null;
		
    	try {
            //设置发信人
            mimeMsg.setFrom(new InternetAddress(from)); 
            //设置接收人
            /*for (int i = 0; i < to.length; i++) {
                mimeMsg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to[i])); 
            }
            */
            if (to != null) {
				toList = getMailList(to);
				InternetAddress[] iaToList = new InternetAddress()
						.parse(toList);
				mimeMsg.setRecipients(Message.RecipientType.TO, iaToList); // 收件人
			}
            
            
            //设置抄送人
            /*for (int i = 0; i < copyto.length; i++) {
                mimeMsg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(copyto[i])); 
            }*/
            
            
            // 抄送
			if (copyto != null) {
				toListcs = getMailList(copyto);
				InternetAddress[] iaToListcs = new InternetAddress()
						.parse(toListcs);
				mimeMsg.setRecipients(Message.RecipientType.CC, iaToListcs); // 抄送人
			}
			
            
            //设置主题
            mimeMsg.setSubject(subject);
            //设置正文
            BodyPart bp = new MimeBodyPart(); 
            bp.setContent(content, "text/html;charset=utf-8");
            mp.addBodyPart(bp);
            //设置附件
            if(null!=filename&&!"".equals(filename)){
            	bp = new MimeBodyPart();
                FileDataSource fileds = new FileDataSource(filename); 
                bp.setDataHandler(new DataHandler(fileds)); 
                bp.setFileName(MimeUtility.encodeText(fileds.getName(),"UTF-8","B"));
                mp.addBodyPart(bp); 
            }
             //设置附件2
            if(null!=filename2&&!"".equals(filename2)){
            	bp = new MimeBodyPart();
                FileDataSource fileds2 = new FileDataSource(filename2); 
                bp.setDataHandler(new DataHandler(fileds2)); 
                bp.setFileName(MimeUtility.encodeText(fileds2.getName(),"UTF-8","B"));
                mp.addBodyPart(bp); 
            }
            mimeMsg.setContent(mp); 
            mimeMsg.saveChanges(); 
            //发送邮件
            if(props.get("mail.smtp.auth").equals("true")){
                Transport transport = session.getTransport("smtp"); 
                transport.connect((String)props.get("mail.smtp.host"), (String)props.get("username"), (String)props.get("password")); 
                if (to != null) {
                	transport.sendMessage(mimeMsg, mimeMsg.getRecipients(Message.RecipientType.TO)); 
                }
                if (copyto != null) {
                	transport.sendMessage(mimeMsg, mimeMsg.getRecipients(Message.RecipientType.CC)); 
                }
                transport.close(); 
            }else{
                Transport.send(mimeMsg);
            }
            System.out.println("邮件发送成功");
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            
        }
        return true;
    }
    /** 
     * 发送邮件
     */ 
    public boolean sendMail(String from, String[] to, String[] copyto, String subject, String content, 
    		String filename) {
    	String toList = null;
		String toListcs = null;
		String toListms = null;
		
    	try {
            //设置发信人
            mimeMsg.setFrom(new InternetAddress(from)); 
            //设置接收人
            /*for (int i = 0; i < to.length; i++) {
                mimeMsg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to[i])); 
            }
            */
            if (to != null) {
				toList = getMailList(to);
				InternetAddress[] iaToList = new InternetAddress()
						.parse(toList);
				mimeMsg.setRecipients(Message.RecipientType.TO, iaToList); // 收件人
			}
            
            
            //设置抄送人
            /*for (int i = 0; i < copyto.length; i++) {
                mimeMsg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(copyto[i])); 
            }*/
            
            
            // 抄送
			if (copyto != null) {
				toListcs = getMailList(copyto);
				InternetAddress[] iaToListcs = new InternetAddress()
						.parse(toListcs);
				mimeMsg.setRecipients(Message.RecipientType.CC, iaToListcs); // 抄送人
			}
			
            
            //设置主题
            mimeMsg.setSubject(subject);
            //设置正文
            BodyPart bp = new MimeBodyPart(); 
            bp.setContent(content, "text/html;charset=utf-8");
            mp.addBodyPart(bp);
            //设置附件
            if(null!=filename&&!"".equals(filename)){
            	bp = new MimeBodyPart();
                FileDataSource fileds = new FileDataSource(filename); 
                bp.setDataHandler(new DataHandler(fileds)); 
                bp.setFileName(MimeUtility.encodeText(fileds.getName(),"UTF-8","B"));
                mp.addBodyPart(bp); 
            }
            mimeMsg.setContent(mp); 
            mimeMsg.saveChanges(); 
            //发送邮件
            if(props.get("mail.smtp.auth").equals("true")){
                Transport transport = session.getTransport("smtp"); 
                transport.connect((String)props.get("mail.smtp.host"), (String)props.get("username"), (String)props.get("password")); 
                if (to != null) {
                	transport.sendMessage(mimeMsg, mimeMsg.getRecipients(Message.RecipientType.TO)); 
                }
                if (copyto != null) {
                	transport.sendMessage(mimeMsg, mimeMsg.getRecipients(Message.RecipientType.CC)); 
                }
                transport.close(); 
            }else{
                Transport.send(mimeMsg);
            }
            System.out.println("邮件发送成功");
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            
        }
        return true;
    }
    private String getMailList(String[] mailArray) {

		StringBuffer toList = new StringBuffer();
		int length = mailArray.length;
		if (mailArray != null && length < 2) {
			toList.append(mailArray[0]);
		} else {
			for (int i = 0; i < length; i++) {
				toList.append(mailArray[i]);
				if (i != (length - 1)) {
					toList.append(",");
				}

			}
		}
		return toList.toString();

	}
    /**
     * 不出现附件乱码
     * @param args
     */
    public static void main(String[] args){
        String smtp = "smtp.163.com";
        String username="abtianliyuan";
        String password="ohblue123456,.;";
        String from = "abtianliyuan@163.com";
        
        String[] to = {"tlybj2015@163.com","tlyterrence@163.com"};//abtianliyuan@.com
        
        //String[] copyto = {"xxx@qq.com"};
        String[] copyto = {"tlynewcity@163.com","ohjoneterrence@163.com"};
        
        String subject = "关于年会的通知2015";
        String content = "关于年会的通知2015";
       String filename = "D:\\路线-车辆-桌次.xls";
       EmailManager email = new EmailManager(smtp, username, password);
       email.sendMail(from, to, copyto, subject, content, filename);
    }
     
}
