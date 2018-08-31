<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var deviceidUpload="";
var attUpdateID="";

var pageIndex = 0;     //页面索引初始值   
var pageSize = 10;     //每页显示条数初始化，修改显示条数，修改这里即可   
  
  function openExcelImportDialog()
  {
	  $('#openExcelImport').modal('show');   
  }
function ajaxUploadExcel()
{   
	  $.ajaxFileUpload({  
          url:'${myappurl}importExcelDevice.do',  
          secureuri:false,  
          fileElementId:'excelToUpload',//file标签的id  
         // dataType: 'text',//返回数据的类型  
          data:{
        	 
          },//一同上传的数据  
          success: function (data, status) {  
        	  $('#openExcelImport').modal('hide');   
            	  loadPage(pageIndex,pageSize);
          }
         
      });  
	}
 

function exportExcel()
{
	 var deviceName=$('#deviceNameSearchID').val();
 	 var mydicCode = $('#mykeshixiala').val();
	
	 var exportExcelURL='${myappurl}getExcelDevice.do?curpage='+pageIndex+'&page_Size='+pageSize+'&tDicCode='+mydicCode+'&tDeviceName'+deviceName;
	 $("#myhref").attr("href",exportExcelURL);
	 $("#myhref")[0].click();
}
	
	
function openAddLogWin(equipId,equipName)
{
	$('#deviceLogHiddenID').val(equipId);
	$('#fixequipNameID').val(equipName);
	$('#fixpersonNameId').val('${myperson.tCname}');
	   		$('#addLogWin').modal('show');   
}

function submitLog()
{
	 var addurl='${myappurl}addOrUpdateLogJSON.do';
		$.ajax({
	        cache: false,
	        type: "post",
	        url:addurl,
	        data:{
				tEquipId:$('#deviceLogHiddenID').val(),
				tPresonId:'${myperson.tPresonId}',
				tLogAddtime:$('#equipLogDateId').val(),   
				tFixContent:$('#fixcontentId').val()
	        	},
	        async: false,
	        success: function(data) {
	         	if(data=="allok")
     		{
     		  loadPage(pageIndex,pageSize);
     		       alert("添加成功!");
     		      
     		}else{
     			  loadPage(pageIndex,pageSize);
     			alert("添加失败!");
     		}
	         	$('#addLogWin').modal('hide');   
	        	
	        }
	})
}
$('#mydatepicker').datetimepicker({
    language:  'zh-CN',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});

$('#umydatepicker').datetimepicker({
    language:  'zh-CN',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});

$('#mydatepickerLog').datetimepicker({
    language:  'zh-CN',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});

function loadPage(pageIndex,pageSize)
{
	   var mycontent = document.getElementById("mytbody");
	   var htmls ="";
	   mycontent.innerHTML="";

	   	    $.get("${myappurl}getAllDevices.do", 
	   	    	 {
	   	    	   tDeviceName: $('#deviceNameSearchID').val(),
	   	    	   tDicCode:$('#mykeshixiala').val(),
	   	    	curpage:pageIndex,
   	    		page_Size:pageSize
       	  		 }
	   	    		,function (data) {
	               var jsonArray = $.parseJSON(data);
	               var sno;
	               for(var temp in jsonArray)
	               	{
	            	   sno = parseInt(temp)+1;
	               	    htmls+='<tr><td class="center"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label>'
	               	    	+'</td><td class="center">'+sno+'</td><td class="center">'+jsonArray[temp].tDicCode+'</td><td class="center">'+jsonArray[temp].tDeviceName+'</td>'
	               	    	+'<td class="center">'+jsonArray[temp].tBuyDate+'</td><td class="center">'+jsonArray[temp].tCheckDate+'</td> '
	               	    	+'<td class="center">'+jsonArray[temp].tCheckCircle+'</td>'
	               	    	if(jsonArray[temp].tSid=='-1'){     
	               	    		htmls+='<td class="center" style="color:red">'+jsonArray[temp].leftDay+'</td>'
	               	    	}else{
	               	    		htmls+='<td class="center" style="color:blue">'+jsonArray[temp].leftDay+'</td>'
	               	    	}
	               	    	htmls+='<td class="center" style="color:blue">'+jsonArray[temp].tDnumber+'</td>	'
	               	    	+'<td class="center"><div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">'
	               	   	+"<a class='green' href=\"javascript:openAddLogWin('"+jsonArray[temp].tEquipId+"','"+jsonArray[temp].tDeviceName+"');\">"
               	    	   +'确认检修</a>'
							+"<a class='green' href=\"javascript:updateForm('"+jsonArray[temp].tEquipId+"');\">"
	               	    	+'<i class="icon-pencil bigger-130"></i></a>'
	               	    	+"<a class='red' href=\"javascript:openDeleteConfirmWin('"+jsonArray[temp].tEquipId+"');\">"
	               	    	+'<i class="icon-trash bigger-130"></i></a></div></td>'
	               	    	+"<td class='center'><a class='green' href=\"javascript:openConpanyWin('"+jsonArray[temp].tEquipId+"');\">详情</a></tr>";
	               	}
	               
	                   mycontent.innerHTML = htmls;
	           });
}

function updateForm(deviceid)
{
	deviceidUpload = deviceid;
	$('#updateWin').modal('show');   
	var ajaxCallUrl='${myappurl}getOneDevice.do';
	$.ajax({
        cache: true,
        type: "GET",
        url:ajaxCallUrl,
        data: {deviceidPra:deviceid},
        async: false,
        error: function(request) {
            alert("Connection error");
        },
        success: function(data) {
        	  var jsonArray = $.parseJSON(data);
        	  attUpdateID = jsonArray.tAttID;
              $("#udeviceHiddenID").val(jsonArray.tEquipId);
              $("#uDeviceNameID").val(jsonArray.tDeviceName);
              $("#umyupdateBuyDateId").val(jsonArray.tBuyDate);
              $("#utCheckCircleID").val(jsonArray.tCheckCircle);
              $("#utiqianYujingID").val(jsonArray.tDnumber);
              
              $("#mypicID").attr("src",jsonArray.tAtturl+jsonArray.tAttname);  
              getUpdateDropDown('科室','umyAddkeshixiala',jsonArray.keshiCode);
          	  getUpdateDropDown('供应商','GongYingshangxialaUpdate',jsonArray.supportCode);
              
        }
    });
	
}


function updateSubForm()
{
    var addurl='${myappurl}addDevice.do';
	$.ajax({
        cache: true,
        type: "POST",
        url:addurl,
        data:$('#updateDeviceMyForm').serialize(),// 你的formid
        async: false,
        error: function(request) {
            alert("Connection error");
        },
        success: function(data) {
            if(data>0){
            	$('#updateWin').modal('hide');   
         	  loadPage(pageIndex,pageSize);
            }
        }
    });
	
	}

function subForm()
{
    var addurl='${myappurl}addDevice.do';
	$.ajax({
        cache: true,
        type: "POST",
        url:addurl,
        data:$('#addDeviceMyForm').serialize(),// 你的formid
        async: false,
        error: function(request) {
            alert("Connection error");
        },
        success: function(data) {
            if(data>0){
            	$('#addWin').modal('hide');   
         	  loadPage(pageIndex,pageSize);
            }
        }
    });
	
	}
	
function openDeleteConfirmWin(deviceId)
{
	$('#mydeleteDeviceHiddenID').val(deviceId);
	
	   		$('#myModal').modal('show');   
}

function openFixConfirmWin()
{
	  $('#myFixModal').modal('show');   
}
	
function openAddWin()
{    
	$("#addDeviceMyForm")[0].reset();
	selectDropDownCommon('科室','myAddkeshixiala');
    $('#addWin').modal('show');   
}

function openConpanyWin(deviceID)
{

	var ajaxCallUrl='${myappurl}getDeviceDetail.do';
	$.ajax({
        cache: true,
        type: "GET",
        url:ajaxCallUrl,
        data: {deviceidPra:deviceID},
        async: false,
        error: function(request) {
            alert("Connection error");
        },
        success: function(data) {
        	  var jsonArray = $.parseJSON(data);
        	  
              $("#tAgencyNameID").val(jsonArray.tAgencyName);
              $("#tPermitNoID").val(jsonArray.tPermitNo);
              $("#tLicenseID").val(jsonArray.tLicense);
              $("#myDetailPicID").attr("src",jsonArray.tAtturl+jsonArray.tAttname);  
              
        }
    });
	$('#supportBtnID').attr({"disabled":"disabled"});
	
	$('#addComWin').modal('show');   
}

function DeleteWin()
{
	 var addurl='${myappurl}deleteDevice.do';
		$.ajax({
	        cache: false,
	        type: "post",
	        url:addurl,
	        data:{
	        	tEquipId:$('#mydeleteDeviceHiddenID').val()
	        	},
	        async: false,
	        error: function(request) {
	            alert("Connection error");
	        },
	        success: function(data) {
	            if(data>0){
	            	$('#myModal').modal('hide');   
	            	alert('删除成功');
	         	  loadPage(pageIndex,pageSize);
	            }else{
	            	alert('删除失败');
	            }
	        }
	    });
}
  

function mypagination(){

	
           //分页，PageCount是总条目数，这是必选参数，其它参数都是可选
           $("#Pagination").pagination(${allDeviceNum}, {
               callback: PageCallback,  
                  prev_text: "« 上一页",
               next_text: "下一页 »",
               items_per_page:pageSize,
              // num_edge_entries: 10,       //两侧首尾分页条目数
                 // num_display_entries: 6,    //连续分页主体部分分页条目数
                  current_page: pageIndex,   //当前页索引
           });
           //翻页调用   
           function PageCallback(index) {  
        	   pageIndex=index;
        	   loadPage(pageIndex,pageSize);
        	   
        	   
           }  
           //请求数据   
    
}

function ajaxUpload()
{   
	  $.ajaxFileUpload({  
          url:'${myappurl}myupload.do',  
          secureuri:false,  
          fileElementId:'fileToUpload',//file标签的id  
          dataType: 'json',//返回数据的类型  
          data:{
        	  deviceId:deviceidUpload,
        	  mytAttid:attUpdateID,
        	  attType:'shebei'
          },//一同上传的数据  
          success: function (data, status) {  
              $("#mypicID").attr("src",data.tAtturl+data.tAttname);  
             alert('上传成功!');
          }
         
      });  
	}

function choosePic()
{
	$("#fileToUpload").click();
}

$(function(){
	 $("#mypicID").click(function(){
		 $("#fileToUpload").click();
	  })
	  
	 })

   $(document).ready(function(){
	   loadPage(pageIndex,pageSize);
	   selectDropDownCommon('科室','mykeshixiala');
	   selectDropDownCommon('供应商','myAddGongYingshangxiala');
	   
	   mypagination();
   });
	   
	   
   
   

</script>
</head>
<body>

</body>
</html>