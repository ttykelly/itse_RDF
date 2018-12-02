package clientServlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.PrintWriter;

import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beanEntity.User;
import dao.UserDao;
import service.UserService;

public class LoginServlet extends HttpServlet 
{

    public void destroy() 
    {
		   super.destroy(); // Just puts "destroy" string in log
		   // Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		   doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		   System.out.println("adafd");
		   response.setContentType("text/html");
		   response.setCharacterEncoding("utf-8");
		   PrintWriter out = response.getWriter();
		   
		   int id1 = Integer.valueOf(request.getParameter("did"));
		   String pwd = new String(request.getParameter("dpassword").getBytes("ISO8859_1"),"utf-8");
		   
		   Date current_date = new Date(); 
		   SimpleDateFormat  SimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		   String date = SimpleDateFormat.format(current_date.getTime());
		   
		   User user = new User();
		  // User user1 = null;
		   user.setId(id1);
		   user.setPassword(pwd);
		   user.setLoginTime(date);
		   String role = user.getRole();
		   String ddate=user.getLoginTime();
		   
		// 2.调用service完成登录操作。
		    UserDao dao = new UserDao();
			UserService service = new UserService();
			try 
			{
				user = service.login(id1, pwd);				
				// 3.登录成功，将用户存储到session中.
				dao.updateLogintime(ddate,id1);
				request.getSession().setAttribute("userid", user.getId());
				request.getSession().setAttribute("luser", user);
				// 获取用户的角色，其中用户的角色分普通用户和超级用户两种
				// 如果是管理员，就进入到网上书城的后台管理系统；否则进入我的账户页面
				if ("管理员".equals(role)) 
				{
					response.sendRedirect(request.getContextPath() +  "/admin/search2.jsp");
				} 
				else 
				{
					response.sendRedirect(request.getContextPath() + "/client/search2.jsp");
				}
			} 
			catch (LoginException e) 
			{
				// 如果出现问题，将错误信息存储到request范围，并跳转回登录页面显示错误信息
				e.printStackTrace();
				request.setAttribute("register_message", e.getMessage());
				response.sendRedirect(request.getContextPath()+"/client/loginerror.jsp");
				return;
			}
			catch (SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	   
	
	public void init() throws ServletException 
	{
		   // Put your code here
	}
}

