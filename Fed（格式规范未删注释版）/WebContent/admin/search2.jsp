<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>搜索界面</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/style.css">
<script type="text/javascript">
function logout()
{	
	document.getElementById("form1").action="${pageContext.request.contextPath}/logout"
	document.getElementById("form1").submit();
}

function Addkey()
{	
	document.getElementById("form1").action="${pageContext.request.contextPath}/KeyServlet"
	document.getElementById("form1").submit();
}
document.onkeydown = function(e)
{
    var ev = document.all ? window.event : e;
    if(ev.keyCode==13) 
    {
        Addkey();
    }
}
</script>
</head>
<body>
<%
if(session.getAttribute("user")!=null)
{
%>
<form id="form1" name="form1" action="<%=request.getContextPath()%>/KeyServlet" method="post">
<div id="top-image">
  
   <input style="font-family:'YouYuan';font-size:24px;color:white;background-color:transparent;
   border:0;position:absolute;right:2%" type="button" value="退出登录" onclick="logout()">
   <div id="content" class="container center-block">
   <div class="jumbotron">
  <%--   <form action="<%=request.getContextPath()%>/logout">
		<input type="button" onclick="submit" value="退出登录">
	</form> --%>
      <div class="container">
        <h1>FedS</h1>
        <p>Start your searching by inputing key words with interval ";"</p>
        <div class="input-group input-group-lg">
          <input name="keyword" type="text" class="form-control" placeholder="input key word:" aria-describedby="sizing-addon1" onkeydown="">
          <!-- <span class="input-group-btn"> -->
          
          <!-- <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Options <span class="caret"></span></button>
		    <ul class="dropdown-menu" role="menu">
		      <li><a href="">Life-Science</a></li>
		      <li><a href="">Cross-Domain</a></li>
		      <li class="divider"></li>
		      <li><a href="">Default</a></li>
		    </ul>
          </span>
          -->
          </div>
      </div>
    </div>
  </div>
</div>
</form>

<script src="${pageContext.request.contextPath}/client/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/client/js/ios-parallax.js"></script> 
<script type="text/javascript">
$(document).ready(function() 
{
    $('#top-image').iosParallax
    (
       {
	      movementFactor: 50
       }
    );
}
);
</script>
<%} %>
</body>
</html>
