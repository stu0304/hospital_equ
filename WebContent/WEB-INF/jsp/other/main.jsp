<%@page import="com.equip.model.TSysUser"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include.jsp"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>系统首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%
	TSysUser tsu=(TSysUser)request.getSession().getAttribute("user");
	%>
	<script type="text/javascript">
 $(document).ready(function(){
		$("#nameClick").click(function(){
			$("#mainFrame").attr("src","<%=basePath%>/gotoUserImprove.do");
		})
	}) 

	</script>
	<style type="text/css">
	#nameClick{
	text-decoration:underline;
	}
	#nameClick:hover,#loginOutClick:hover{
		cursor:pointer;
	}
	#loginOutClick{
	float:right;
	margin-right:30px;
	text-decoration:none
	}
	</style>
  </head>
  
  <body>
 <body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:60px;">
	      <img alt="" src="resource/images/header.jpg">
	  </div> 
	  
	<div data-options="region:'west',split:true,title:'预约',href:'goToModuleTree.do' " style="width:20%;padding:10px;">
      <%--  <iframe src="<%=basePath%>goToModuleTree.do" frameborder="0"  height="100%" width="100%" scrolling="no"></iframe> --%>
    </div>
	<div data-options="region:'south',border:false" style="height:50px; padding:10px;"><p align="center">天津中医药大学药物研究院</p></div>
	<div data-options="region:'center',title:'当前登录用户：<a  id=nameClick><%=tsu.gettPerson().gettPersonName()==null||tsu.gettPerson().gettPersonName().equals("")?tsu.gettUserName():tsu.gettPerson().gettPersonName()%></a> <a id=loginOutClick  href=<%=basePath%>/loginOut.do target=_parent >退出系统</a>'">
	   <%--    <iframe id="mainFrame" src="<%=basePath%>/goToMySubscribeEquip.do"  frameborder="0" height="100%" width="90%" marginheight="0" marginwidth="0" scrolling="no"></iframe> --%>
	     <div id="mytabs" class="easyui-tabs" style="width:100%;height:100%">
    </div>
			
			
</body>
  </body>
</html>
