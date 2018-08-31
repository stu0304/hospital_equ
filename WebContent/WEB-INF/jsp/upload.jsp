<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=basePath%>resource/jquery/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/uploadFile/ajaxfileupload.js"></script>
  <style type="text/css">
         .devicePic{width:200px; height:200px; border:1px dotted;}
         .devicePic img{width:100%;height:100%;}
         </style> 
<script type="text/javascript">  
function ajaxUpload()
{   
	  $.ajaxFileUpload({  
          url:'<%=basePath%>myupload.do',  
          secureuri:false,  
          fileElementId:'fileToUpload',//file标签的id  
          dataType: 'json',//返回数据的类型  
          data:{
        	  deviceId:'logan'},//一同上传的数据  
          success: function (data, status) {  
              $("#mypicID").attr("src",data.tAtturl+data.tAttname);  
            
          }
         
      });  
	}

$(function () {
    $("#mybtnUploadID").click(function () {
    	ajaxUpload();
    })
})

function io()
{
	  var url = serverUrlBase + "/server/images/" + mapid + "/files/png";
      var xhr = new XMLHttpRequest();
      xhr.open('GET', url, true);
      xhr.responseType = "blob";
      xhr.setRequestHeader("client_type", "DESKTOP_WEB");
      xhr.setRequestHeader("desktop_web_access_key", _desktop_web_access_key);
      xhr.onload = function() {
          if (this.status == 200) {
              var blob = this.response;
              var img = document.createElement("img");
              img.onload = function(e) {
                  window.URL.revokeObjectURL(img.src); 
              };
              img.src = window.URL.createObjectURL(blob);
              $("#imgcontainer").html(img);    
          }
      }
      xhr.send();
	}
</script>  
</head>
<body>
  
                <input id="fileToUpload" type="file" name="devicePicName">
                                     <div class="devicePic">
										<img id="mypicID" src="" alt="无图片"/>
										<button id="mybtnUploadID">上传</button>
									</div>
</body>
</html>