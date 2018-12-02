<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="beanEntity.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>注册成功</title>
	<link rel="stylesheet" href="css/main.css" type="text/css" />
	<script type="text/javascript" src="js/my.js"></script>
</head>

<body class="main">
<%
if(session.getAttribute("ruser")!=null)
{
%>
	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center">
					<table width="60%" border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<!-- <td style="width:98">
								<img src="/clientimages/IconTexto_WebDev_009.jpg" width="128" height="128" />
							</td> -->
							<td style="padding-top:30px">
								<font style="font-weight:bold; color:#FF0000">注册成功,别忘记激活帐户啊！</font><br />
								<br /> 
								 <font style="font-weight:bold; color:#FF0000">申请账号为：</font>
								 <%out.println(session.getAttribute("rid")); %>								 							
								<br />
								<br />
								<a href="${pageContext.request.contextPath}/client/RegisterLogin.jsp">
									<span id="second">10</span>秒后自动为您转跳回登录页
								</a>
							</td>
						</tr>
					</table>
					<h1>&nbsp;</h1></td>
			</tr>
		</table>
	</div>
	
<%
}
%>	
	
</body>
</html>
