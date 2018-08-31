<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

var agencyID="";
var attID="";

var pageIndex = 0;     //页面索引初始值   
var pageSize = 10; 

function deleteAgency()
{
	  $.ajax({
	        type: "GET",
	        url:"${myappurl}deleteOneAgencyJSON.do",
	        data : {
	        	tAgencyId:agencyID
			},
	        async: false,
	        success: function(data) {
	        	if(data=="allok")
	        		{
	          		$('#myModal').modal('hide');   
	        		   loadPage(pageIndex,pageSize);
	        		       alert("删除成功!");
	        		      
	        		}else{
	        			   loadPage(pageIndex,pageSize);
	        			alert("删除失败!");
	        		}
	        }
	    }); 
}


function loadAttPage(myagencyId)
{
	   var mycontent = document.getElementById("myattShowID");
	   var htmls ="";
	   mycontent.innerHTML="";

	   	    $.get("${myappurl}getAllAttJSON.do",
	   	    	  {
	   	    			tAgencyId: myagencyId
		       	   },
	   	    		function (data) {
	               var jsonArray = $.parseJSON(data);
	               var sno;
	               for(var temp in jsonArray)
	               	{
	            	        sno = parseInt(temp)+1;
					htmls+='<div class="col-md-12"><div class="form-group"><div class="control-label col-md-3"></div><div class="col-md-9">'
	                         +'<a href="${myappurl}myDownLoadFile.do?tAttname='+jsonArray[temp].tAttname+'">'+sno+'.'+jsonArray[temp].tAttname+'  </a>'
	                         +'<a class="red" href="javascript:openDeleteConfirmATTWin(\''+jsonArray[temp].tAttid+'\');"><i class="icon-trash bigger-120"></i></a></div></div></div>'                  
	               	}
	                   mycontent.innerHTML = htmls;
	           });
	   	    
	   	 
}

function myajaxUpload()
{   
	  $.ajaxFileUpload({  
          url:'${myappurl}myuploadFile.do',  
          secureuri:false,  
          fileElementId:'myFujianID',//file标签的id  
          dataType: 'text',//返回数据的类型  
          data:{
        	  myObjectID:agencyID,
        	  attType:'fujian'
          },//一同上传的数据  
          success: function (data, status) {  
        	  loadAttPage(agencyID);
             alert('上传成功!');
             
          }
         
      });  
	}

function ajaxUpload()
{   
	  $.ajaxFileUpload({  
          url:'${myappurl}myuploadFile.do',  
          secureuri:false,  
          fileElementId:'myFujianID',//file标签的id  
          dataType: 'html',//返回数据的类型  
          data:{
        	  myObjectID:agencyID,
        	  attType:'fujian'
          },//一同上传的数据  
          success: function (data, status) {    
        	  alert(data);
          }
         
      });  
	}

function deleteAttByAttId()
{
	  $.ajax({
	        type: "GET",
	        url:"${myappurl}deleteOneAttJSON.do",
	        data : {
	        	tAttid:attID
			},
	        async: false,
	        success: function(data) {
	        	if(data=="allok")
	        		{
	        			$('#myAttDeleteConfirm').modal('hide');   
	        			loadAttPage(agencyID);
	        		       alert("删除成功!");
	        		}else{
	        			loadAttPage(agencyID);
	        			alert("删除失败!");
	        		}
	        }
	    }); 
}
function loadPage(pageIndex,pageSize)
{
	   var mycontent = document.getElementById("mytbody");
	   var htmls ="";
	   mycontent.innerHTML="";

	   	    $.get("${myappurl}getAllAgencySON.do",
	   	    	  {
	   	    		tAgencyName: $("#searchSupportNameID").val(),
	   	    		curpage:pageIndex,
	   	    		page_Size:pageSize
		       	   },
	   	    		function (data) {
	               var jsonArray = $.parseJSON(data);
	               var sno;
	               for(var temp in jsonArray)
	               	{
	            	        sno = parseInt(temp)+1;
						htmls+='<tr><td class="center">	<label><input type="checkbox" class="ace" /><span class="lbl"></span></label></td>'
						+'<td class="center">'+sno+'</td><td class="center">'+jsonArray[temp].tAgencyName+'</td>	<td class="center">'+jsonArray[temp].tLicense+'</td><td class="center">'+jsonArray[temp].tPermitNo+'</td>'
						+'<td class="center">	<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons"><a class="green" href="javascript:openUpdateWin(\''+jsonArray[temp].tAgencyId+'\');">'
						+'<i class="icon-pencil bigger-130"></i></a><a class="red" href="javascript:openDeleteConfirmWin(\''+jsonArray[temp].tAgencyId+'\');"><i class="icon-trash bigger-130"></i></a>'
						+'<a class="blue" href="javascript:openAttWin(\''+jsonArray[temp].tAgencyId+'\');">附件列表	</a></div></td></tr>'
	               	
	               	}
	                   mycontent.innerHTML = htmls;
	           });
}

function openAttWin(agency_Id)
{
		agencyID=agency_Id;
		loadAttPage(agencyID);
		$('#addAttWin').modal('show');   
	}
function openAddWin(agencyIDPara)
{
		$("#mySupportFormID")[0].reset();
		agencyID=agencyIDPara;
	   $('#addComWin').modal('show');   
}

function openDeleteConfirmWin(dic_id)
{
			agencyID=dic_id;
	   		$('#myModal').modal('show');   
}

function openDeleteConfirmATTWin(attid)
{
			attID=attid;
	   		$('#myAttDeleteConfirm').modal('show');   
}

//提交更新
function updateDic()
{       
	  $.ajax({
	        type: "GET",
	        url:"${myappurl}addOrUpdateAgencyJSON.do",
	        data : {
	        	tAgencyId: agencyID,
	        	tPermitNo:$('#tPermitNo').val(),
	        	tLicense:$("#tLicense").val(),
	        	tAgencyName:$("#tAgencyName").val()
	       
			},
	        async: false,
	        success: function(data) {
	        	if(data=="allok")
	        		{
	        		   loadPage(pageIndex,pageSize);
	        		       alert("更新成功!");
	        		      
	        		}else{
	        			   loadPage(pageIndex,pageSize);
	        			alert("更新失败!");
	        		}
	        }
	    }); 
}

//打开更新窗口
function openUpdateWin(dic_ic)
{      
	   $.get("${myappurl}getOneAgencyJSON.do",
	   	    	  {
		   				tAgencyId: dic_ic
		       	   },
	   	    		function (data) {
	               var jsonArray = $.parseJSON(data);
	               //alert(jsonArray);
	               agencyID=jsonArray.tAgencyId;
	               $('#tPermitNo').val(jsonArray.tPermitNo);
	               $('#tLicense').val(jsonArray.tLicense);
	               $('#tAgencyName').val(jsonArray.tAgencyName);
	               
	           });
	
	
	   $('#addComWin').modal('show');   
}

$(document).ready(function(){
	loadPage(pageIndex,pageSize);
	mypagination(${allAgencyNum},pageIndex,pageSize);
	
});
</script>
</head>
<body>

</body>
</html>