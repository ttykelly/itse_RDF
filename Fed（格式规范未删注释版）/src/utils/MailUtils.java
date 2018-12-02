package utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
/**
 * 发送邮件的工具类
 */
public class MailUtils 
{
	/**
     * 
     * @param to:代表给谁发邮件
     * @param code：代表激活码是什么
     * @throws MessagingException 
     * @throws AddressException 
     */
    
		public static void sendMail(String to,String code) throws Exception
		{
	        //1.创建连接对象，连接到邮箱服务器
	        
	        Properties props = new Properties();
			props.setProperty("mail.transport.protocol", "SMTP");
			props.setProperty("mail.host", "smtp.qq.com");
			props.setProperty("mail.smtp.auth", "true");// 指定验证为true

			// 创建验证器
			Authenticator auth = new Authenticator() 
			{
				public PasswordAuthentication getPasswordAuthentication() 
				{
					return new PasswordAuthentication("2627656663", "btjknwltmtmkdjai");
				}
			};
	        
			Session session = Session.getInstance(props, auth);
	        
	        //2.创建邮件对象
	        MimeMessage message = new MimeMessage(session);
	          //2.1设置发件人
	            /**
	             * service@mac.com是一个字符串，
	             * 将字符串转换成地址：new InternetAddress("service@mac.com")
	             */
	           message.setFrom(new InternetAddress("2627656663@qq.com"));
	        
	         //2.2设置收件人
	         message.setRecipient(RecipientType.TO, new InternetAddress(to));
	        
	         //2.3设置邮件主题
	         message.setSubject("这是一封激活邮件！");
	        
	         //2.4设置邮件正文
	         /**
	          *   ?code="+code+"  :表示从外面传入一个激活码
	          */
	         message.setContent("<h1>来自RDF搜索引擎的激活邮件，激活请点击以下链接：</h1> <h3>  <a href='http://localhost:8080/registerlogin/activeUser?code="+code+"'> http://localhost:8080/registerlogin/activeUser?code="+code+" </a></h3>", "text/html;charset=UTF-8");
	        
	         //3.发送一封激活邮件
	         Transport.send(message);
	    }
	
}
