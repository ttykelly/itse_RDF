package service;

import java.sql.SQLException;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.security.auth.login.LoginException;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
import java.math.BigInteger;

import dao.UserDao;
import beanEntity.User;
import exception.ActiveUserException;
//import cn.itcast.bookStore.exception.RegisterException;
import utils.MailUtils;

public class UserService 
{
	private UserDao dao = new UserDao();

	public void activate(User user) throws AddressException,SQLException,MessagingException,Exception
	{
		int i = (dao.addUser(user)).intValue();
		// 只有是激活才能登录成功，否则提示“用户未激活”
		user.setId(i);
		System.out.println(i);
		/*// 发送激活邮件
	    String emailMsg = "感谢您注册RDF搜索引擎，点击<a href='http://localhost:8080/registerlogin/activeUser?activeCode="
				+ user.getActiveCode() + "'>&nbsp;激活&nbsp;</a>后使用。<br>为保障您的账户安全，请在24小时内完成激活操作";*/
	    MailUtils.sendMail(user.getEmail(), user.getActiveCode());
    }
	
	
	/*public void forgetPwd(User user) throws AddressException,SQLException,MessagingException,Exception
	 * {
		//更新激活码
		dao.updateacive(user.getActiveCode(),user.getId());
		// 发送验证邮件
	    String emailMsg = "感谢您注册RDF搜索引擎，点击<a href='http://localhost:8080/registerlogin/activeUser?activeCode="
				+ user.getActiveCode() + "'>&nbsp;激活&nbsp;</a>后使用。<br>为保障您的账户安全，请在24小时内完成激活操作";
	    MailUtils.sendMail2(user.getEmail(), user.getActiveCode(),user.getId(),user.getPassword());
    }*/

	// 激活用户
	public void activeUser(String activeCode) throws ActiveUserException,ParseException,java.text.ParseException
	{
		try 
		{
			// 根据激活码查找用户
			User user = dao.findUserByActiveCode(activeCode);
			if (user == null) 
			{
				throw new ActiveUserException("激活用户失败,未匹配");
			}

			// 判断激活码是否过期 24小时内激活有效.
			// 1.得到注册时间					
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String registTime = user.getRegistTime();
			try 
			{
			    Date date = formatter.parse(registTime);
			    long time = System.currentTimeMillis() - date.getTime();
			// 2.判断是否超时
			    if (time / 1000 / 60 / 60 > 24) 
			    {
				     throw new ActiveUserException("激活码过期");
			    }
			} 
			catch (ParseException e) 
			{
		        e.printStackTrace();
		    }	
			// 激活用户，就是修改用户的state状态
			dao.active(activeCode);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			throw new ActiveUserException("激活用户失败，sql");
		}
	}
	//验证用户
	public void changePwd(String activeCode) throws ActiveUserException,ParseException,java.text.ParseException,LoginException
	{
		try 
		{		
			// 根据激活码查找用户
			User user = dao.findUserByActiveCode(activeCode);
			if (user == null) 
			{
				throw new ActiveUserException("验证用户失败,未匹配");
			}

			// 判断激活码是否过期 24小时内激活有效.
			// 1.得到注册时间					
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String registTime = user.getRegistTime();
			try 
			{
			    Date date = formatter.parse(registTime);
			    long time = System.currentTimeMillis() - date.getTime();
			    // 2.判断是否超时
			    if (time / 1000 / 60 / 60 > 24) 
			    {
				    throw new ActiveUserException("激活码过期");
			    }
			} 
			catch (ParseException e) 
			{
		        e.printStackTrace();
		    }	
			// 激活用户，/就是修改用户的state状态
			//dao.active2(activeCode);
			user = dao.findUserByactive(user.getId(),user.getActiveCode());
			if (user == null) 
			{
				// 只有是验证才能登录成功，否则提示“用户未激活”
			    throw new LoginException("验证失败");
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			throw new LoginException("登录失败");
		}
			
	}

	// 登录操作
	public User login(int id, String password) throws LoginException 
	{
		try 
		{
			//根据登录时表单输入的用户名和密码，查找用户
			User user = dao.findUserByidAndPassword(id, password);
			//如果找到，还需要确定用户是否为激活用户
			if (user != null) 
			{
				// 只有是激活才能登录成功，否则提示“用户未激活”
				if (user.getState() == 1) 
				{
					return user;
				}
				throw new LoginException("用户未激活");
			}
			throw new LoginException("用户名或密码错误");
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			throw new LoginException("登录失败");
		}
	}
}
