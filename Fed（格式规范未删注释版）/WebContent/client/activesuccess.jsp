<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/my.js"></script>
<title>注册成功</title>
</head>
<body>
<%
     if(session.getAttribute("ruser")!=null)
     {
%>
         注册成功！
         <a href="${ pageContext.request.contextPath }/client/RegisterLogin.jsp">
         <span id="second">5</span>秒后自动为您转跳回登录页</a>
<%
     }
%>
</body>
</html>