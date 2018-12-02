package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpSession;

import java.sql.*;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import java.math.BigInteger;
//import com.mysql.jdbc.*;

import beanEntity.User;
import utils.MailUtils;
import utils.C3p0Utils;
import utils.DataSourceUtils;

public class UserDao 
{
	public static Connection conn;
	public static PreparedStatement pstat;
	public static String sql="";
	
	// ����û�
	public BigInteger addUser(User user) throws SQLException 
	{	
		QueryRunner qr = new QueryRunner();
		conn = (Connection)DataSourceUtils.getConnection();
		sql = "insert into user_info(username,password,email,telephone,registTime,activeCode) values (?,?,?,?,?,?);";
		qr.update(conn,sql, new Object[]{user.getUsername(),user.getPassword(),user.getEmail(),user.getTelephone(),user.getRegistTime(),user.getActiveCode()});			
		//BigInteger id = BigInteger.ZERO ;
		return (BigInteger)qr.query(conn, "SELECT LAST_INSERT_ID()", new ScalarHandler(1)); 
	}
	
	// ���ݼ���������û�
	public User findUserByActiveCode(String activeCode) throws SQLException 
	{
		sql = "select * from user_info where activeCode=?";
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		return runner.query(sql, new BeanHandler<User>(User.class), activeCode);
	}
		
	public int findidByActiveCode(String activeCode) throws SQLException 
	{
		sql = "select * from user_info where activeCode=?";
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		return runner.query(conn, sql, new ScalarHandler<Integer>(),activeCode); 
	}
	
	//�����û�
	public void active(String activeCode) throws SQLException 
	{
		String sql = "update user_info set state=? where activeCode=?";
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		runner.update(sql, 1, activeCode);
	}
/*	//������֤״̬
	public void active2(String activeCode) throws SQLException 
	{
		String sql = "update user_info set state1=? where activeCode=?";
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		runner.update(sql, 1, activeCode);
	}*/
	
	//���¼�����
	public void updateacive(String activeCode,int iid) throws SQLException 
	{
		String sql = "update user_info set activeCode=? where id=?";
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		runner.update(sql,activeCode,iid);
	}
	
	/**
	* 
	* �û���¼
	*/
	public void updateLogintime(String t,int id) throws SQLException 
	{	
	   QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
	   conn = (Connection)DataSourceUtils.getConnection();
	   sql = "update user_info set user_login_time=? where id=?";
	   runner.update(sql,t,id);	
	}
	
	public User findUserByidAndPassword(int id,String pwd) throws SQLException
	{
	   QueryRunner runner = new QueryRunner();
	   conn = (Connection)DataSourceUtils.getConnection();
	   sql = "select * from user_info where id=? and password=?";
	   return runner.query(conn,sql, new BeanHandler<User>(User.class),id,pwd);
	}	
	
	public User findUserByactive(int id,String activecode) throws SQLException
	{
	   QueryRunner runner = new QueryRunner();
	   conn = (Connection)DataSourceUtils.getConnection();
	   sql = "select * from user_info where id=? and activeCode=?";
	   return runner.query(conn,sql, new BeanHandler<User>(User.class),id,activecode);
	}
	
	public void changepwd(String pwd1,int iid) throws SQLException 
	{
		String sql = "update user_info set password=? where id=?";
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		runner.update(sql, pwd1, iid);
	}
	
}