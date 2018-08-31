<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
			<link href="<%=basePath%>resource/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<%=basePath%>resource/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=basePath%>resource/css/ace.min.css" />
		<link rel="stylesheet" href="<%=basePath%>resource/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="<%=basePath%>resource/css/ace-skins.min.css" />
		<script type="text/javascript" src="<%=basePath%>resource/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>resource/bootstrap/bootstrap.min.js"></script>
		<link rel="stylesheet" href="<%=basePath%>resource/bootstrap/bootstrap-datetimepicker.min.css" />
		<script type="text/javascript" src="<%=basePath%>resource/bootstrap/bootstrap-datetimepicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>resource/bootstrap/bootstrap-datetimepicker.zh-CN.js"></script>
		<link rel="stylesheet" href="<%=basePath%>resource/jquery/pagination.css" />
<script type="text/javascript" src="<%=basePath%>resource/jquery/jquery.paging.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/uploadFile/ajaxfileupload.js"></script>    		
    	<style type="text/css">
         .headImgDiv{width:40px; height:40px;}
          .headImgDiv img{width:100%;height:100%;}
         </style> 
    		<div class="navbar navbar-default" id="navbar">
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<i class="icon-leaf"></i>
							天津市总医院医疗器械检修预警系统
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->
<div class="navbar-header pull-right" role="navigation">
					<ul class="nav navbar-nav">
					<li>
			               <div style="padding:5px;" class="headImgDiv"><img id="myHeadIconID" class="nav-user-photo" src="${myappurl}resource/img/avatar5.png" alt="无头像" /></div>
					</li>
					<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<span class="user-info">${myuser.tUserName}</span>
								<i class="icon-caret-down"></i>
								<span class="user-info">${myuser.tRole}</span>
				</a>
				<ul class="dropdown-menu" style="min-width:50%; align:center">
					<li><a href="goToPersonInfo.do">个人中心</a></li>
					<li><a href="goToChangePwd.do">密码修改</a></li>
					<li><a href="mylogout.do">退出系统</a></li>
				</ul>
			</li>
		</ul>
				</div><!-- /.navbar-header -->
					</div><!-- /.container -->
		</div>
<script>
   $(document).ready(function(){
	   		var imgURL="${tperson.tAtturl}/${tperson.tAttname}";
	   		if(imgURL!="/")
	   			{
	   		 		$("#myHeadIconID").attr("src",imgURL);  
	   			}
   });
</script>		