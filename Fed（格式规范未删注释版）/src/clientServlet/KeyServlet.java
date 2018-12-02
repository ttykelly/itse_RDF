package clientServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.io.PrintWriter;

import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beanEntity.Key;
import dao.KeyDao;

/**
 * Servlet implementation class KeyServlet
 */
@WebServlet("/KeyServlet")
public class KeyServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KeyServlet() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doGet(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String keyword=new String(request.getParameter("keyword").getBytes("ISO8859_1"),"utf-8");
		Date current_date = new Date(); 
		SimpleDateFormat  SimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = SimpleDateFormat.format(current_date.getTime());
		HttpSession session = request.getSession();
		//从session中获取对象
		System.out.println(session.getAttribute("userid"));
		System.out.println("!!!!");
		//如果是匿名输入uid默认为10077;s
		int uid = 10077;
		if(session.getAttribute("userid")!=null)
		{
			uid=(int)session.getAttribute("userid");
			System.out.println("!!!!");
		}  
		Key key = new Key();
	    key.setUserId(uid);
		key.setKeyWord(keyword);
		key.setInputTime(date);
		KeyDao dao = new KeyDao();
		try 
		{
			   dao.addKey(key);
			   response.sendRedirect(request.getContextPath()+"/client/result.jsp?keyword="+keyword);
		} 
		catch (SQLException e) 
		{
			   // TODO Auto-generated catch block
			   e.printStackTrace();
		}
		System.out.println("测试成功！！");
	}

}
