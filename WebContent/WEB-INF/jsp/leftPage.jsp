<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="sidebar" id="sidebar">
					<ul class="nav nav-list">
						<li class="active">
							<a href="">
								<i class="icon-dashboard"></i>
								<span class="menu-text"> 控制台 </span>
							</a>
						</li>
						<c:if test="${myuser.tRole=='维护人员'}">
						<li>
							<a href="goToEquipList.do">
								<i class="icon-desktop"></i>
								<span class="menu-text"> 设备管理 </span>
							</a>
						</li>
						<li>
							<a href="goToEquipLog.do">
								<i class="icon-picture"></i>
								<span class="menu-text"> 设备日志管理 </span>
							</a>
						</li>
						</c:if>
                        <c:if test="${myuser.tRole=='管理员'}">
                          	<li>
							<a href="goToEquipList.do">
								<i class="icon-desktop"></i>
								<span class="menu-text"> 设备管理 </span>
							</a>
						</li>
						<li>
							<a href="goToEquipLog.do">
								<i class="icon-calendar"></i>
								<span class="menu-text"> 设备日志管理 </span>
							</a>
						</li>
						<li>
							<a href="gotoSupport.do">
								<i class="icon-list-alt"></i>
								<span class="menu-text"> 供应商管理 </span>
							</a>
						</li>
					<li>
							<a href="goToDicList.do">
								<i class="icon-tag"></i>
								<span class="menu-text"> 数据字典管理 </span>
							</a>
						</li>
						<li>
							<a href="goToSysUser.do">
								<i class="icon-double-angle-right"></i>
								<span class="menu-text"> 用户管理 </span>
							</a>
						</li>
                        </c:if>
						<li>
							<a href="gotokeshishebei.do">
								<i class="icon-text-width"></i>
								<span class="menu-text"> 各科室设备统计 </span>
							</a>
						</li>
					</ul><!-- /.nav-list -->
				</div>
</body>
</html>