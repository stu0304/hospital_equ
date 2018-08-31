<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>医院设备控制台</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		
	
	</head>

	<body>
			<%@include file="header.jsp" %>

		<div class="main-container" id="main-container">

			<div class="main-container-inner">
             <%@include file="leftPage.jsp" %>
				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">

						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="#">首页</a>
							</li>
							<li class="active">控制台</li>
						</ul><!-- .breadcrumb -->

					</div>

					<div class="page-content">

						<div class="row">
							<div class="col-xs-12">
										<div class="table-header">
											设备维护日志
										</div>
			<div class="widget-box">

											<div class="widget-body">
												<div class="widget-main">
													<form class="form-inline">
														设备名称：<input type="text" id="myEquipNameId" class="input-large" placeholder="设备名称" />
														维修人员：<input type="text" id="myEquipFixPersonId" class="input-large" placeholder="维修人员姓名" />

													 <button type="button" class="btn btn-purple btn-sm" onclick="loadPage()">
																			<i class="icon-search icon-on-right bigger-110"></i>
																			查询
																		</button>
													</form>
												</div>
											</div>
										</div>
										<div class="table-responsive">
											<table id="sample-table-2" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th class="center">
															<label>
																<input type="checkbox" class="ace" />
																<span class="lbl"></span>
															</label>
														</th>
														<th class="center">序号</th>
														<th class="center">设备名称</th>
														<th class="center">维护人员</th>
													    <th class="center">维护日期</th>
														<th class="center">操作</th>
													</tr>
												</thead>

												<tbody id="mytbody">
												</tbody>
											</table>
										</div>
									</div>
										<div id="Pagination" class="center sabrosus"></div>
						
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content --> 

			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		
        <div id="addLogWin" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">
                    <i class="icon-pencil"></i>
                    <span id="lblAddTitle" style="font-weight:bold">设备维修日志信息</span>
                </h4>
            </div>
            <form class="form-horizontal form-bordered form-row-strippe" id="ffAdd" action="" data-toggle="validator" enctype="multipart/form-data">
                  <input type="hidden" id="deviceHiddenID"/></input>
                <div class="modal-body">
                    <div class="row">
                    <div class="col-md-12">
                            <div class="form-group">
                                <div class="control-label col-md-3">设备名称</div>
                                <div class="col-md-9">
                                 <input id="equipNameID" name="tCheckCircle" type="text" class="form-control" disabled/>                                       
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">维修人员</label>
                                <div class="col-md-9">
                                   <input id="epersonName" name="tCheckCircle" type="text" class="form-control" disabled/> 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">维修日期</label>
                                <div class="col-md-9">
                                <div id="fixdateID" class="input-group date form_date col-md-10"  data-date-format="yyyy-MM-dd " data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input name="tBuyDate" id="equipLogDateId" class="form-control" size="16" type="text" readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>   
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">维修日志记录</label>
                                <div class="col-md-9">
                                       <textarea class="form-control" rows="10" id="fixcontentId"></textarea> 
                                </div>
                            </div>
                        </div>
	                    
                    </div>
                </div>
                <div class="modal-footer bg-info">
                    <input type="hidden" id="elogID" name="ID" />
                    <button type="button" id="myupdateSubID" onclick="updateLog();" class="btn blue">确定</button>
                    <button type="button" class="btn green" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 删除确认 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					删除消息
				</h4>
			</div>
			<div class="modal-body">
				确定要删除数据么？
			</div>
			<div class="modal-footer">
			 <input type="hidden" id="deleteLogID"/>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="deleteLog()">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

		
</body>
<%@include file="commonJS.jsp" %>		
<script>
var pageIndex = 0;        
var pageSize = 10;        

$(document).ready(function(){
	loadPage(pageIndex,pageSize);
	mypagination(${allLogNum},pageIndex,pageSize);
	
});


function deleteLog()
{
	
	  $.ajax({
	        type: "GET",
	        url:"${myappurl}deleteOneLogJSON.do",
	        data : {
	        	tLogId: $('#deleteLogID').val()
			},
	        async: false,
	        success: function(data) {
	        	if(data=="allok")
	        		{
	         		$('#myModal').modal('hide');   
	        		   loadPage(pageIndex,pageSize);
	        		      
	        		}else{
	        			   loadPage(pageIndex,pageSize);
	        		}
	        	
	        	$('#addLogWin').modal('hide');   
	        }
	    }); 
}

function loadPage(pageIndex,pageSize)
{
	   var mycontent = document.getElementById("mytbody");
	   var htmls ="";
	   mycontent.innerHTML="";

	   	    $.get("<%=basePath%>getAllLogJSON.do",
	   	    	  {
	   	    		equipName: $("#myEquipNameId").val(),
	   	    		tPresonId:$("#myEquipFixPersonId").val(),
	   	    		curpage:pageIndex,
	   	    		page_Size:pageSize
		       	   },
	   	    		function (data) {
	               var jsonArray = $.parseJSON(data);
	               var sno;
	               for(var temp in jsonArray)
	               	{    
	            	        sno = parseInt(temp)+1;
							htmls+='<tr><td class="center"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></td><td class="center">'+sno+'</td><td class="center">'+jsonArray[temp].equipName+'</td><td class="center">'+jsonArray[temp].tPresonId+'</td><td class="center">'+jsonArray[temp].tLogAddtime+'</td><td class="center">'
							+'<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons"><a class="green" href="javascript:openAddWin(\''+jsonArray[temp].tLogId+'\');"><i class="icon-pencil bigger-130"></i></a><a class="red" href="javascript:openDeleteConfirmWin(\''+jsonArray[temp].tLogId+'\');"><i class="icon-trash bigger-130"></i></a>'
							+'<a class="blue" href="javascript:openAttWin(\''+jsonArray[temp].tLogId+'\');">详情</a></div></td></tr>';
	               	}
	                   mycontent.innerHTML = htmls;
	           });
}

function openDeleteConfirmWin(logid)
{
	 		$('#deleteLogID').val(logid);
	   		$('#myModal').modal('show');   
}
	
function openAddWin(logid)
{
	
	$("#myupdateSubID").removeAttr("disabled");
	$.get("<%=basePath%>getOneLogJSON.do",
 	    	  {
					tLogId: logid
	       	   },
 	    		function (data) {
             var jsonArray = $.parseJSON(data);
             $('#elogID').val( jsonArray.tLogId);
             $('#equipNameID').val(jsonArray.equipName);
             $('#epersonName').val(jsonArray.tPresonId);
             $('#equipLogDateId').val(jsonArray.tLogAddtime);
             $('#fixcontentId').val(jsonArray.tFixContent);
             $("#deviceHiddenID").val(jsonArray.tEquipId);
         });
	
	   		$('#addLogWin').modal('show');   
}

//提交更新
function updateLog()
{       
	  $.ajax({
	        type: "POST",
	        url:"${myappurl}addOrUpdateLogJSON.do",
	        data : {
	             tLogId: $('#elogID').val(),
	             tFixContent:$('#fixcontentId').val(),
	             tLogAddtime:$('#equipLogDateId').val(),
	             tEquipId:$('#deviceHiddenID').val()
			},
	        async: false,
	        success: function(data) {
	        	if(data=="allok")
	        		{
	        		   loadPage(pageIndex,pageSize);
	        		}else{
	        			   loadPage(pageIndex,pageSize);
	        		}
	        }
	    }); 
}

function openAttWin(logid)
{
	openAddWin(logid);	   	
	$("#myupdateSubID").attr("disabled", true);
	   		
}

$('#fixdateID').datetimepicker({
    language:  'zh-CN',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});


</script>
</html>

    