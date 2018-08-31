<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.getSession().setAttribute("myappurl", basePath);
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
<!-- Custom Theme files -->
 <script type="text/javascript" src="<%=basePath%>resource/jquery/jquery.min.js"></script>
<link href="<%=basePath%>resource/css/loginstyle.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 


</head>
<body>
<div class="login">
	
	<div class="login-top">
	<h1>天津市总医院 <br/>医疗器械检修预警系统<br>(用户注册)</h1>
		<form>
			<input id="myUserName" type="text" placeholder="用户名">
			<input id="mypwd" type="password" placeholder="密码">
			<input id="tMobileID" type="text" placeholder="手机号">
			<input id="tEmailID" type="text" placeholder="Email">
	    </form>
	</div>
	<div class="login-bottom">
			<h3><a href="javascript:mylogin();">返回登陆</a>&nbsp <a href="javascript:myreg();">提交</a></h3>
	</div>
</div>	

<script type="text/javascript">
function mylogin(){
	window.location.href="goToLoginPage.do";
}

function myreg()
{
	 $.ajax({
	        cache: true,
	        type: "GET",
	        url:"${myappurl}addSysUser.do",
	        data : {
				tUserName : $("#myUserName").val(),
				tUserPwd : $("#mypwd").val(),
				tMobile:$("#tMobileID").val(),
				tEmail:$("#tEmailID").val()
			},
	        async: true,
	        success: function(data) {
	        	if(data=="allok")
	        		{
	        		alert("注册成功,请等待审核！");
	        		}else{
	        			alert("注册失败");
	        		}
	        }
	    }); 

	}

</script>

</body>
</html>