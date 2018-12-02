<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<title>登录</title>
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/sign-up-login.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/inputEffect.css" />
<link rel="stylesheet" href="css/tooltips.css" />
<link rel="stylesheet" href="css/spop.min.css" />

<script src="js/jquery.min.js"></script>
<script src="js/snow.js"></script>
<script src="js/jquery.pure.tooltips.js"></script>
<script src="js/spop.min.js"></script>
<script>	
	(function() 
	{
	  	// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
	  	if (!String.prototype.trim) 
	  	{
	  		(function() 
	  		{
	  			// Make sure we trim BOM and NBSP
	  			var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
	  			String.prototype.trim = function() 
	  			{
	  				return this.replace(rtrim, '');
	  			};
			  }
			)
			();
		}
	  	
		[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach
		( 
			function( inputEl ) 
			{
			    // in case the input is already filled..
			    if( inputEl.value.trim() !== '' ) 
			    {
				  classie.add( inputEl.parentNode, 'input--filled' );
			    }
			    // events:
			    inputEl.addEventListener( 'focus', onInputFocus );
			    inputEl.addEventListener( 'blur', onInputBlur );
		    } 
		);
		
		function onInputFocus( ev ) 
		{
			classie.add( ev.target.parentNode, 'input--filled' );
		}
		
		function onInputBlur( ev ) 
		{
			if( ev.target.value.trim() === '' ) 
			{
				classie.remove( ev.target.parentNode, 'input--filled' );
			}
		}
		
	}
	) 
	();
	
	$(function() 
	{	
		$('#login #login-password').focus
		(
			function() 
		    {
			    $('.login-owl').addClass('password');
		    }).blur
		    (
		        function() 
		        {
			        $('.login-owl').removeClass('password');
		        }
		    );		
		$('#login #register-password').focus
		(
			function() 
			{
			    $('.register-owl').addClass('password');
		    }).blur
		    (
		    	function() 
		    	{
			        $('.register-owl').removeClass('password');
		        }
		    );
		$('#login #register-repassword').focus
		(
			function() 
			{
			    $('.register-owl').addClass('password');
		    }).blur
		    (
		    	function() 
		    	{
			        $('.register-owl').removeClass('password');
		        }
		    );
		$('#login #forget-password').focus
		(
			function() 
			{
			    $('.forget-owl').addClass('password');
		    }).blur
		    (
		    	function() 
		    	{
			        $('.forget-owl').removeClass('password');
		        }
		    );
	});
	
	function goto_register()
	{
		$("#register-username").val("");
		$("#register-password").val("");
		$("#register-repassword").val("");
		$("#tab-2").prop("checked",true);
	}
	
	function goto_login()
	{
		$("#login-username").val("");
		$("#login-password").val("");
		$("#tab-1").prop("checked",true);
	}
	
	function goto_forget()
	{
		$("#forget-userid").val("");
		$("#forget-password").val("");
		$("#forget-repassword").val("");
		$("#tab-3").prop("checked",true);
	}
	
	function login()
	{//登录
		var username = $("#login-username").val(),
			password = $("#login-password").val(),
			validatecode = null,
			flag = true;
		//判断用户名是否为空
		if(!username)
		{
			$.pt
			(
				{
        		   target: $("#login-username"),
        		   position: 'r',
        		   align: 't',
        		   width: 'auto',
        		   height: 'auto',
        		   content:"用户名不能为空"
        	    }
			);
			flag = false;
			return false;
		}
      //判断密码是否为空
		if(!password)
		{
			$.pt
			(
				{
        		   target: $("#login-password"),
        		   position: 'r',
        		   align: 't',
        		   width: 'auto',
        		   height: 'auto',
        		   content:"密码不能为空"
        	    }
			);
			flag = false;
			return false;
		}
		return flag;
	}
	//注册
	function register()
	{
		var username = $("#register-username").val(),
			password = $("#register-password").val(),
			repassword = $("#register-repassword").val(),
         /* phonenumber = $("#register-phonenumber").val(), */ 
			email = $("#register-email").val(),
			flag = true,
			validatecode = null;
		//判断用户名密码是否为空
		var regExp = new RegExp("[0-9a-zA-Z]{1}[0-9a-zA-Z\_]{3,11}$");
		if(!username)
		{
			$.pt
			(
				{
        		   target: $("#register-username"),
        		   position: 'r',
        		   align: 't',
        		   width: 'auto',
        		   height: 'auto',
        		   content:"用户名不能为空"
        	    }
			);
			flag = false;
			return false;
		}
		else if(!regExp.test(username))
		{
			$.pt
			(
				{
        		   target: $("#register-username"),
        		   position: 'r',
        		   align: 't',
        		   width: 'auto',
        		   height: 'auto',
        		   content:"用户名必须是字母或数字开头的4-12位组合(包括下划线)"
        	   }
			);
			flag = false;
			return false;
		} 
		if(password == "")
		{
			$.pt
			(
				{
        		   target: $("#register-password"),
        		   position: 'r',
        		   align: 't',
        		   width: 'auto',
        		   height: 'auto',
        		   content:"密码不能为空"
        	    }
			);
			flag = false;
			return false;
		} 
		else if(password != repassword)
		{
			$.pt
			(
				{
	        	   target: $("#register-repassword"),
	        	   position: 'r',
	        	   align: 't',
	        	   width: 'auto',
	        	   height: 'auto',
	        	   content:"两次输入的密码不一致"
	        	 }
			);
			flag = false;
			return false;
		}
		//邮箱格式不合法
		var regExp = new RegExp("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$");
		if(!email)
		{
			$.pt
			(
				{
        		   target: $("#register-email"),
        		   position: 'r',
        		   align: 't',
        		   width: 'auto',
        		   height: 'auto',
        		   content:"邮箱不能为空"
        	    }
			);
			flag = false;
			return false;
		}
		else if(!regExp.test(email))
		{
				$.pt
				(
					{
	        		   target: $("#register-email"),
	        		   position: 'r',
	        		   align: 't',
	        		   width: 'auto',
	        		   height: 'auto',
	        		   content:"邮箱格式不合法"
	        	    }
				);
				flag = false;
				return false;
		}
		return flag;
	}
	
	//重置密码
	function forget()
	{
		var username = $("#forget-userid").val(),
			password = $("#forget-password").val(),
			email = $("#forget-email").val(),
			repassword = $("#forget-repassword").val(),
			flag = true,
			validatecode = null;
		//判断用户名是否为空
		if(!username)
		{
			$.pt
			(
				{
        		   target: $("#forget-userid"),
        		   position: 'r',
        		   align: 't',
        		   width: 'auto',
        		   height: 'auto',
        		   content:"用户名不能为空"
        	    }
			);
			flag = false;
			return false;
		}
		//判断邮箱是否为空
		/* var regex = new Regex("^[\w-]+@([\w-]+\.)+[a-zA-Z]{2,4}$"); */
		if(!email)
		{
			$.pt
			(
				{
        		   target: $("#forget-email"),
        		   position: 'r',
        		   align: 't',
        		   width: 'auto',
        		   height: 'auto',
        		   content:"邮箱不能为空"
        	    }
			);
			flag = false;
			return false;
		}
		/* else if(!regex.test(email)){
			$.pt
			(
				{
        		   target: $("#forget-email"),
        		   position: 'r',
        		   align: 't',
        		   width: 'auto',
        		   height: 'auto',
        		   content:"邮箱格式不合法"
        	    }
			);
			flag = false;
			return false;
		}  */
		//判断密码是否为空、两次输入密码是否一致
		if(!password)
		{
			$.pt
			(
				{
        		   target: $("#forget-password"),
        		   position: 'r',
        		   align: 't',
        		   width: 'auto',
        		   height: 'auto',
        		   content:"密码不能为空"
        	    }
			);
			flag = false;
			return false;
		}
		else if(password != repassword)
		{
			$.pt
			(
				{
	        		target: $("#register-repassword"),
	        		position: 'r',
	        		align: 't',
	        		width: 'auto',
	        		height: 'auto',
	        		content:"两次输入的密码不一致"
	        	}
			);
		    flag = false;
		    return false;
		}
		return flag;
	}
	/* 	if(flag)
	{
		return false;
	}
	else
	{//重置密码
		spop
		(
			{			
				template: '<h4 class="spop-title">重置密码成功</h4>即将于3秒后返回登录',
				position: 'top-center',
				style: 'success',
				autoclose: 3000,
				onOpen : function()
				{
					var second = 2;
					var showPop = setInterval(function()
						{
						    if(second == 0)
						    {
							    clearInterval(showPop);
						    }
						$('.spop-body').html('<h4 class="spop-title">重置密码成功</h4>即将于'+second+'秒后返回登录');
						second--;
						},1000);
				},
				onClose : function()
				{
					goto_login();
				}
			}
		); */
			

</script>
<style type="text/css">
html{width: 100%; height: 100%;}

body
{
	background-repeat: no-repeat;

	background-position: center center #2D0F0F;

	background-color: #00BDDC;

	background-image: url(images/497c4fb82d5fd00159370cc1dbd9230a.jpg);

	background-size: 100% 100%;
}

.snow-container { position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 100001; }

</style>
</head>
<body>
	<!-- 雪花背景 -->
	<div class="snow-container"></div>
	<!-- 登录控件 -->
	<div id="login">
		<input id="tab-1" type="radio" name="tab" class="sign-in hidden" checked />
		<input id="tab-2" type="radio" name="tab" class="sign-up hidden" />
		<input id="tab-3" type="radio" name="tab" class="sign-out hidden" />
		<div class="wrapper">
			<!-- 登录页面 -->
			<div class="login sign-in-htm">
				<form class="container offset1 loginform" action="<%=request.getContextPath()%>/clientServlet/LoginServlet" method="post" onsubmit="return login();">
					<!-- 猫头鹰控件 -->
					<div id="owl-login" class="login-owl">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad input-container">
						<section class="content">
							<span class="input input--hideo">
								<input name="did" class="input__field input__field--hideo" type="text" id="login-username" 
									autocomplete="off" placeholder="请输入用户账号" tabindex="1"  />
								<label class="input__label input__label--hideo" for="login-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							
							</span>
							<span class="input input--hideo">
								<input name="dpassword" class="input__field input__field--hideo" type="password" id="login-password" placeholder="请输入密码" tabindex="2" />
								<label class="input__label input__label--hideo" for="login-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
						
						</section>
					</div>
					<div class="form-actions">
						<!-- <a tabindex="4" class="btn pull-left btn-link text-muted" onClick="goto_forget()">忘记密码?</a> -->
						<a tabindex="5" class="btn btn-link text-muted" onClick="goto_register()">注册</a>
						<input class="btn btn-primary" type="submit" tabindex="3" name="submit" value="登录" 
							style="color:white;"/>
					</div>
				</form>
			</div>
			<!-- 忘记密码页面 -->
			<!-- <div class="login sign-out-htm">
				<form action="#" method="post" class="container offset1 loginform" onsubmit="return forget();">
					猫头鹰控件
					<div id="owl-login" class="forget-owl">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad input-container">
						<section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="forget-userid" autocomplete="off" placeholder="请输入用户ID"/>
								<label class="input__label input__label--hideo" for="forget-userid">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="forget-email" autocomplete="off" placeholder="请输入邮箱"/>
								<label class="input__label input__label--hideo" for="forget-email">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="forget-password" autocomplete="off" placeholder="请输入新密码"/>
								<label class="input__label input__label--hideo" for="forget-password">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="forget-repassword" placeholder="请再次输入密码" />
								<label class="input__label input__label--hideo" for="forget-repassword">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
						</section>
					</div>
					<div class="form-actions">
						<a class="btn pull-left btn-link text-muted" onClick="goto_login()">返回登录</a>

						<input class="btn btn-primary" type="button" onClick="forget()" value="重置密码" 
							style="color:white;"/>
					</div>
				</form>
			</div> -->
			<!-- 注册页面 -->
			<div class="login sign-up-htm">
				<form action="<%=request.getContextPath()%>/clientServlet/RegisterServlet" method="post" class="container offset1 loginform" onsubmit="return register();">
					<!-- 猫头鹰控件 -->
					<div id="owl-login" class="register-owl">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad input-container">
						<section class="content">
							<span class="input input--hideo">
								<input name="username" class="input__field input__field--hideo" type="text" id="register-username" 
									autocomplete="off" placeholder="请输入昵称" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input name="password" class="input__field input__field--hideo" type="password" id="register-password" placeholder="请输入密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="register-repassword" placeholder="请确认密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-repassword">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>

							<span class="input input--hideo">
								<input name="email" class="input__field input__field--hideo" type="text" id="register-email" autocomplete="off"  placeholder="请输入邮箱"/>
								<label class="input__label input__label--hideo" for="register-email">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
						</section>
					</div>
					<div class="form-actions">
						<a class="btn pull-left btn-link text-muted" onClick="goto_login()">返回登录</a>
						<!-- <input class="btn btn-primary" type="submit" onClick="submit" value="注册" 
							style="color:white;"/> -->
							<input class="btn btn-primary" type="submit" name="submit" value="注册" 
							style="color:white;"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>