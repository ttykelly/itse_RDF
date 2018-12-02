package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.mysql.jdbc.*;

import beanEntity.Key;
import utils.DataSourceUtils;


public class KeyDao 
{
	
	public static Connection conn;
	public static PreparedStatement pstat;
	public static String sql="";
	
	// 添加查询记录
	public void addKey(Key key) throws SQLException 
	{
		QueryRunner runner=new QueryRunner();
		Connection conn=DataSourceUtils.getConnection();
		String sql = "insert into key_info(usrID,key_word,input_time) values(?,?,?);";
		runner.update(conn, sql, new Object[]{key.getUserId(),key.getKeyWord(),key.getInputTime()});
	}
}

