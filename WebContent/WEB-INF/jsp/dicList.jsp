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
											数据字典列表
										</div>
			<div class="widget-box">
											<div class="widget-body">
												<div class="widget-main">
													<form class="form-inline">
														数据项名称：<input type="text" id="myshujuxiang" class="input-large" placeholder="数据名称" />
														数据类型：<select id="myshujuTypeId" class="selectpicker" data-style="btn-primary" style="width:100px;" onChange="loadPage();"></select>
														 <button type="button" class="btn btn-purple btn-sm" onclick="loadPage()">
																			<i class="icon-search icon-on-right bigger-110"></i>
																			查询
																		</button>
															<button type="button" class="btn btn-sm btn-success" onclick="openAddDicWin();">
															<i class="icon-ok bigger-110"></i>
															添加
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
														<th class="center">数据项名称</th>
														<th class="center">数据类型</th>
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

		
		
        <div id="addDicWin" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <input type="hidden" id="hdic_id"> 
          <input type="hidden" id="hdic_code_id"> 
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">
                    <i class="icon-pencil"></i>
                    <span id="lblAddTitle" style="font-weight:bold">数据字典维护</span>
                </h4>
            </div>
            <form class="form-horizontal form-bordered form-row-strippe" id="ffAdd" action="" data-toggle="validator" enctype="multipart/form-data">
                  <input type="hidden" id="deviceHiddenID" name="tId"/></input>
                <div class="modal-body">
                    <div class="row">
                    <div class="col-md-12">
                            <div class="form-group">
                                <div class="control-label col-md-3">数据项名称</div>
                                <div class="col-md-9">
                                 <input id="addShujuxiangid" name="tCheckCircle" type="text" class="form-control" />                                       
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">数据项类型</label>
                                <div class="col-md-9">
                                   <input id="addShujuxiangTypeID" name="tCheckCircle" type="text" class="form-control"/> 
                                </div>
                            </div>
                        </div>
	                    
                    </div>
                </div>
                <div class="modal-footer bg-info">
                    <input type="hidden" id="ID" name="ID" />
                    <button type="button" onclick="updateDic();" class="btn blue">确定</button>
                    <button type="button" class="btn green" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 删除确认 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <input type="hidden" id="delDicHiddenID"/></input>
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
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="deleteDicCode()">
					确定
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

		<%@include file="commonJS.jsp" %>		
</body>

<script>

var pageIndex = 0;     //页面索引初始值   
var pageSize = 10; 

function deleteDicCode()
{
	  $.ajax({
	        type: "GET",
	        url:"${myappurl}deleteOneDicCodeJSON.do",
	        data : {
	        	tDicId: $('#delDicHiddenID').val()
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
	        }
	    }); 
}

function openDeleteConfirmWin(dic_id)
{
			$('#delDicHiddenID').val(dic_id);
	
	   		$('#myModal').modal('show');   
}
	
function openAddDicWin()
{
			$("#ffAdd")[0].reset();
	   		$('#addDicWin').modal('show');   
}

function submitAddDicWin()
{
	   		$('#addDicWin').modal('show');   
}

//打开更新窗口
function openUpdateWin(dic_ic)
{
	
	   $.get("<%=basePath%>getOneDicCodeJSON.do",
	   	    	  {
		   				tDicId: dic_ic
		       	   },
	   	    		function (data) {
	               var jsonArray = $.parseJSON(data);
	               //alert(jsonArray);
	               $('#hdic_id').val( jsonArray.tDicId);
	               $('#hdic_code_id').val(jsonArray.tDicCode);
	               $('#addShujuxiangid').val(jsonArray.tName);
	               $('#addShujuxiangTypeID').val(jsonArray.tType);
	               
	           });
	
	   $("#ffAdd")[0].reset();
	$('#addDicWin').modal('show');   
}

function loadPage(pageIndex,pageSize)
{
	   var mycontent = document.getElementById("mytbody");
	   var htmls ="";
	   mycontent.innerHTML="";

	   	    $.get("<%=basePath%>getAllDicJSON.do",
	   	    	  {
	   	    		tName: $("#myshujuxiang").val(),
	   	    		tType:$("#myshujuTypeId").val(),
	   	    		curpage:pageIndex,
	   	    		page_Size:pageSize
		       	   },
	   	    		function (data) {
	               var jsonArray = $.parseJSON(data);
	               var sno;
	               for(var temp in jsonArray)
	               	{
	            	        sno = parseInt(temp)+1;
	               	    	htmls+='<tr><td class="center">	<label><input type="checkbox" class="ace" />	<span class="lbl"></span></label></td><td class="center">'+sno+'</td>'
						+'<td class="center">'+jsonArray[temp].tName+'</td><td class="center">'+jsonArray[temp].tType+'</td><td class="center">'
						+'<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">'	
						+'<a class="green" href="javascript:openUpdateWin(\''+jsonArray[temp].tDicId+'\');"><i class="icon-pencil bigger-130"></i>	</a>'
						+'<a class="red" href="javascript:openDeleteConfirmWin(\''+jsonArray[temp].tDicId+'\');"><i class="icon-trash bigger-130"></i></a>	</div></td></tr>'
	               	}
	                   mycontent.innerHTML = htmls;
	           });
}

function selectDicTypeJSON()
{
	  var keshi = document.getElementById("myshujuTypeId");
	  var selectStr ="<option value=''>全部</option>";
	  $.get("<%=basePath%>selectDicTypeJSON.do",function (data) {
        var jsonArray = $.parseJSON(data);
        for(var temp in jsonArray)
        	{   
      	 		 selectStr+='<option value="'+jsonArray[temp].tType+'">'+jsonArray[temp].tType+'</option>';
        	}
        keshi.innerHTML=selectStr;
        
    });
	  
}

// 提交更新
function updateDic()
{       
	  $.ajax({
	        type: "GET",
	        url:"${myappurl}addOrUpdateJSON.do",
	        data : {
	        	tDicId: $('#hdic_id').val(),
	        	tDicCode:$('#hdic_code_id').val(),
	        	tName:$("#addShujuxiangid").val(),
	        	tType:$("#addShujuxiangTypeID").val()
	       
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

$(document).ready(function(){
	loadPage(pageIndex,pageSize);
	selectDicTypeJSON();
	mypagination(${allCodeNum},pageIndex,pageSize);
	
});

</script>
</html>

    