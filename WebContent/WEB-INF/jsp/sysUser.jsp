<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="commonJS.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>医院设备控制台</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
											系统用户列表 
										</div>
<div class="widget-box">
											<div class="widget-body">
												<div class="widget-main">
													<form class="form-inline">
														用户名：<input type="text" id="searchUserNameId" class="input-large" placeholder="用户名称" />

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
														<th class="center">用户名</th>
														<th class="center">真实姓名</th>
															<th class="center">权限角色</th>
													    <th class="center">性别</th>
														<th class="center">科室</th>
														<th class="center">手机号</th>
														<th class="center">Email</th>
														<th class="center">操作</th>
													</tr>
												</thead>

												<tbody id="mytbody">

								
												</tbody>
											</table>
										</div>
									</div>
									<div class="center">
											<div id="Pagination" class="center sabrosus"></div>
						</div>
						
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content --> 

			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->


<div id="addComWin" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">
                    <i class="icon-pencil"></i>
                    <span id="lblAddTitle" style="font-weight:bold">用户信息</span>
                </h4>
            </div>
            <form class="form-horizontal form-bordered form-row-strippe" id="ffAdd" action="" data-toggle="validator" enctype="multipart/form-data">
                  <input type="hidden" id="deviceHiddenID" name="tId"/></input>
                <div class="modal-body">
                    <div class="row">
                    <div class="col-md-12">
                            <div class="form-group">
                                <div class="control-label col-md-3">用户姓名</div>
                                <div class="col-md-9">
                                 <input id="tCheckCircleID" name="tCheckCircle" type="text" class="form-control" />                                       
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">科室</label>
                                <div class="col-md-9">
                                  <select class="selectpicker" data-style="btn-primary" style="width:100px;">
                                    <option value="PA">外科</option>
									  <option value="CT">内科</option>
									  <option value="NY">妇科</option>
									  <option value="MD">男科</option>
    							</select>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">新密码</label>
                                <div class="col-md-9">
                                   <input id="tCheckCircleID" name="tCheckCircle" type="password" class="form-control"/> 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">新密码重复</label>
                                <div class="col-md-9">
                                   <input id="tCheckCircleID" name="tCheckCircle" type="password" class="form-control"/> 
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer bg-info">
                    <input type="hidden" id="ID" name="ID" />
                    <button type="button" onclick="subForm();" class="btn blue">确定</button>
                    <button type="button" class="btn green" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="addQuanxian" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">
                    <i class="icon-pencil"></i>
                    <span id="lblAddTitle" style="font-weight:bold">用户信息</span>
                </h4>
            </div>
            <form class="form-horizontal form-bordered form-row-strippe" id="ffAdd" action="" data-toggle="validator" enctype="multipart/form-data">
                  <input type="hidden" id="deviceHiddenID" name="tId"/></input>
                <div class="modal-body">
                    <div class="row">
                    <div class="col-md-12">
                            <div class="form-group">
                                <div class="control-label col-md-3">用户姓名</div>
                                <div class="col-md-9">
                                 <input id="quanxianRealName" name="tCheckCircle" type="text" />                                       
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                    <div class="col-md-12">
                            <div class="form-group">
                                <div class="control-label col-md-3">权限</div>
                                <div class="col-md-9">
                                  <select id="myquanxian" class="selectpicker" data-style="btn-primary" style="width:100px;">
    							</select>                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer bg-info">
               	<input type="hidden" id="roleUserId"> 
                    <button type="button" onclick="updateUserRole();" class="btn blue">确定</button>
                    <button type="button" class="btn green" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
		<div class="modal fade" id="myModalDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
				确定要删除用户么？
			</div>
			<div class="modal-footer">
			<input type="hidden" id="delUserId"> 
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="deleteUser();">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<div class="modal fade" id="myPwdReset" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				    密码重置
				</h4>
			</div>
			<div class="modal-body">
				确定要重置密码么？
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>
<script>

var pageIndex = 0;     //页面索引初始值   
var pageSize = 10; 
function searchUserName()
{   
	
	  $.ajax({
	        type: "GET",
	        url:"${myappurl}getAllSysUser.do",
	        data : {
	        	tUserName: $("#searchUserNameId").val()
			},
	        async: false,
	        success: function(data) {
	        	if(data==true)
	        		{
	        		   loadPage(pageIndex,pageSize);
	        		      
	        		}else{
	        			   loadPage(pageIndex,pageSize);
	        		}
	        	
	        }
	    }); 
}

function updateUserRole()
{   
	  $.ajax({
	        type: "GET",
	        url:"${myappurl}updateSysUser.do",
	        data : {
	        	tUserId: $("#roleUserId").val(),
	        	tRole:$("#myquanxian").val()
			},
	        async: false,
	        success: function(data) {
	        	if(data==true)
	        		{
	        		   loadPage(pageIndex,pageSize);
	        		   $('#addQuanxian').modal('hide');	        		      
	        		}else{
	        			   loadPage(pageIndex,pageSize);
	        			   $('#addQuanxian').modal('hide');
	        		}
	        }
	    }); 
}

function deleteUser()
{
    var myuserid = $('#delUserId').val();
	$.ajax({
        type: "GET",
        url:"${myappurl}updateSysUser.do",
        data : {
        	tUserId: myuserid,
        	tStatus:'-1'
		},
        async: false,
        success: function(data) {
        	if(data==true)
        		{
        		   loadPage(pageIndex,pageSize);
        		      
        		}else{
        			   loadPage(pageIndex,pageSize);
        		}
        }
    }); 
}

function pwdReset(myuserid)
{
	$.ajax({
        type: "GET",
        url:"${myappurl}updateSysUser.do",
        data : {
        	tUserId: myuserid,
        	tUserPwd:'00000000'
		},
        async: false,
        success: function(data) {
        	if(data==true)
        		{
        		    alert("密码重置成功!");
        		      
        		}else{
        			alert("密码重置失败!");
        		}
        }
    }); 
}

function updateUserStatus(myuserid)
{   
	  $.ajax({
	        type: "GET",
	        url:"${myappurl}updateSysUser.do",
	        data : {
	        	tUserId: myuserid,
	        	tStatus:1
	       
			},
	        async: false,
	        success: function(data) {
	        	if(data==true)
	        		{
	        		   loadPage(pageIndex,pageSize);
	        		       alert("审核成功!");
	        		      
	        		}else{
	        			   loadPage(pageIndex,pageSize);
	        			alert("审核失败!");
	        		}
	        }
	    }); 
}


function openDeleteConfirmWin(userid)
{
	         $('#delUserId').val(userid);
	   		$('#myModalDelete').modal('show');
	   		
}
	
function openAddWin()
{
	   		$('#myPwdReset').modal('show');   
}

function openQuanxianWin(myuserId,dicCode,realname)
{
	   		$('#addQuanxian').modal('show');   
	   		$("#roleUserId").val(myuserId);
	   		
	   		getUpdateDropDown('权限','myquanxian',dicCode);
	   		
	   		//$('#myquanxian').val(myrolename);   
	  		$('#quanxianRealName').val(realname);   
	   		
	   		
	   		
}

function subMyQuanXian()
{
	  $.ajax({
	        type: "GET",
	        url:"${myappurl}updateSysUser.do",
	        data : {
	        	tUserId: myuserid,
	        	tStatus:1
	       
			},
	        async: false,
	        success: function(data) {
	        	$('#addQuanxian').modal('hide');   
	        }
	    }); 
	  
	}

function loadPage(pageIndex,pageSize)
{
	   var mycontent = document.getElementById("mytbody");
	   var htmls ="";
	   mycontent.innerHTML="";
	  var searchName = $("#searchUserNameId").val();
	   	    $.get("<%=basePath%>getAllSysUser.do",
	   	    		{
	   	    	tUserName: searchName,
	   	 		curpage:pageIndex,
	    		page_Size:pageSize
	   	    		}, 
	   	    		function (data) {
	               var jsonArray = $.parseJSON(data);
	               for(var temp in jsonArray)
	               	{
	               	    	htmls+='<tr><td class="center"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></td>'
	               	    		+'<td class="center">'+jsonArray[temp].tUserName+'</td><td class="center">'+jsonArray[temp].tCname+'</td><td class="center">'+jsonArray[temp].tRole+'</td><td class="center">'+jsonArray[temp].tGender+'</td><td class="center">'+jsonArray[temp].tDicId+'</td><td class="center">'+jsonArray[temp].tMobile+'</td><td class="center">'+jsonArray[temp].tEmail+'</td>'
	               	    		+'<td class="center"><div class="visible-md visible-lg hidden-sm hidden-xs action-buttons"> ';
	               	    		if(jsonArray[temp].tStatus=='a'){
	               	    			htmls+='<button class="btn btn-xs btn-warning" onclick="updateUserStatus(\''+jsonArray[temp].tUserId+'\');">未审核</button>';
	               	    		}else{
	               	    			htmls+='<button class="btn btn-xs btn-success" onclick="updateUserStatus(\''+jsonArray[temp].tUserId+'\');">已审核</button>';
	               	    		}
	               	    		htmls+='<button class="btn btn-xs btn-info" onclick="openQuanxianWin(\''+jsonArray[temp].tUserId+'\',\''+jsonArray[temp].tRoleDicID+'\',\''+jsonArray[temp].tCname+'\')">权限分配</button>'
	               	    		+'<button class="btn btn-xs btn-danger" onclick="pwdReset(\''+jsonArray[temp].tUserId+'\');">密码重置	</button>'
	               	    		+'<a class="red" href="javascript:openDeleteConfirmWin(\''+jsonArray[temp].tUserId+'\');"><i class="icon-trash bigger-130"></i></a></div></td>	</tr>';
						
				
	               	}
	                   mycontent.innerHTML = htmls;
	           });
	   
}

function mypagination(){
           //分页，PageCount是总条目数，这是必选参数，其它参数都是可选
           $("#Pagination").pagination(${allSysUserNum}, {
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
        	   loadPage(index,pageSize);
        	   
        	   
           }  
           //请求数据   
    
}
$(document).ready(function(){
	   loadPage(pageIndex,pageSize);
	   getUpdateDropDown("权限","myquanxian","${myuser.tRole}");
	   mypagination();
});

</script>
</html>

    