<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件管理</title>
</head>
<body>
    <table width="80%" border="1" cellspacing="0" cellpadding="5">
        <tr>
            <th width="4%">No</th>
            <th width="30%">Filename</th>
            <th width="30%">Notes</th>
            <th width="16%">Type</th>
            <th width="20%">&nbsp;</th>
        </tr>
        <c:choose>
            <c:when test="${tFilesList != null}">
                <c:forEach var="file" items="${tFilesList}" varStatus="counter">
                    <tr>
                        <td>${counter.index + 1}</td>
                        <td>${tFilesList.tFileName}</td>
                        <td>${tFilesList.tFileNote}</td>
                        <td>${tFilesList.tFileType}</td>
                        <td><div align="center"><a href="downloadFile.do?fileid=${tFilesList.tFileId}">下载</a> /
                            <a href="deleteFile.do?fileid=${tFilesList.tFileId}">删除</a></div>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>
    </table>
 
    <h2>上传文件</h2>
    <form action="fileupload.do" method="post" enctype="multipart/form-data">
        <table width="60%" border="1" cellspacing="0">
            <tr>
                <td width="35%"><strong>上传文件</strong></td>
                <td width="65%"><input type="file" name="file" /></td>
            </tr>
            <tr>
                <td><strong>摘要</strong></td>
                <td><input type="text" name="notes" width="60" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><input type="submit" name="submit" value="提交"/></td>
            </tr>
        </table>
    </form>
  </body>
</html>