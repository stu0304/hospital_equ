<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>resource/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>resource/easyui/themes/demo.css">
	<script type="text/javascript" src="<%=basePath%>resource/easyui/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resource/easyui/js/jquery.easyui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>resource/base.css">
	<script type="text/javascript" src="<%=basePath%>resource/myequ.js"></script>
	
