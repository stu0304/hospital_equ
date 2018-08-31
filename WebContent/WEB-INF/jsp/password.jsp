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
											密码重置
										</div>
											<div class="hr hr-24"></div>
									<div class="space-24"></div>
										<form class="form-horizontal" role="form">
									

								
									<div class="space-4"></div>

									<div class="space-4"></div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 原密码</label>
								<input type="hidden" id="myuserid" value="${myuser.tUserId}"/></input>
										<div class="col-sm-9">
											<input type="password" id="oldpwd" placeholder="Password" class="col-xs-10 col-sm-5" onblur="checkNullOrNot();"/>
											<span class="help-inline col-xs-12 col-sm-7">
												<span class="middle" id="oldpwdmsg" style="color:red;"></span>
											</span>
										
										</div>
									</div>
									<div class="space-4"></div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 新密码</label>

										<div class="col-sm-9">
											<input type="password" id="newpwd1" placeholder="Password" class="col-xs-10 col-sm-5" onblur="checkNullOrNot2();"/>
											<span class="help-inline col-xs-12 col-sm-7">
												<span class="middle" id="newpwd1msg" style="color:red;"></span>
											</span>
										</div>
									</div>
									<div class="space-4"></div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2" > 再次输入新密码</label>

										<div class="col-sm-9">
											<input type="password" id="newpwd2" placeholder="Password" class="col-xs-10 col-sm-5" onblur="checkNullOrNot3();"/>
										    	<span class="help-inline col-xs-12 col-sm-7">
												<span class="middle" id="newpwd2msg" style="color:red;"></span>
											</span>
										</div>
									</div>
									
										<div class="space-4"></div>

									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="button" id="mysubbtn" onclick="mysubUpdate();">
												<i class="icon-ok bigger-110"></i>
												提交
											</button>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset">
												<i class="icon-undo bigger-110"></i>
												重置
											</button>
										</div>
									</div>

									<div class="hr hr-24"></div>
									<div class="space-24"></div>
									
								</form>
									</div>
						</div><!-- /.row -->
						
						
					</div><!-- /.page-content -->
				</div><!-- /.main-content --> 

			</div><!-- /.main-container-inner -->

		</div><!-- /.main-container -->



		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改密码
				</h4>
			</div>
			<div class="modal-body">
				确定要更新密码么？
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="updatePwd();">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>
<script>
function openDeleteConfirmWin()
{
	   		$('#myModal').modal('show');   
}
	
function openAddWin()
{
	   		$('#addComWin').modal('show');   
}

function checkNullOrNot()
{
	if($("#oldpwd").val()=="")
		{
		$("#oldpwdmsg").html("原始密码不能为空!");
		$("#oldpwd").focus();
	    return false;
}
	checkOldPwd();
}

function checkNullOrNot2()
{
	if($("#newpwd1").val()=="")
	{
	$("#newpwd1msg").html("新密码不能为空!");
	$("#newpwd1").focus();
    return false;
	}else{
		$("#newpwd1msg").html("");
	}
}

function checkNullOrNot3()
{
	if($("#newpwd2").val()=="")
	{
	$("#newpwd2msg").html("重复新密码不能为空!");
	$("#newpwd2").focus();
    return false;
	}else{
		$("#newpwd2msg").html("");
	}
	
	if( $("#newpwd1").val()!=$("#newpwd2").val() )
			{    
			    $("#newpwd2msg").html("两次新密码输入不一致!");
				 return false;
			}
}

function checkOldPwd()
{   
	  $.ajax({
	        cache: true,
	        type: "GET",
	        url:"${myappurl}checkOriginalPwd.do",
	        data : {
	        	tUserId: $("#myuserid").val(),
	        	tUserPwd:$("#oldpwd").val()
	       
			},
	        async: false,
	        success: function(data) {
	        	if(data=="allok")
	        		{
	        			$("#oldpwdmsg").html("原始密码正确!");
	        			 $("#mysubbtn").removeAttr("disabled");
	        		}else{
	        			$("#mysubbtn").attr("disabled", true);
	        			$("#oldpwdmsg").html("原始密码不正确!");
	        		}
	        }
	    }); 
}

function mysubUpdate()
{
	$('#myModal').modal('show');   
	}

function updatePwd()
{   
	  $.ajax({
	        type: "GET",
	        url:"${myappurl}updateSysUser.do",
	        data : {
	        	tUserId: $("#myuserid").val(),
	        	tUserPwd:$("#newpwd2").val()
	       
			},
	        async: false,
	        success: function(data) {
	        	if(data==true)
	        		{
	        		       alert("更新成功!");
	        		       $('#myModal').modal('hide');   
	        		}else{
	        			alert("更新失败!");
	        		}
	        }
	    }); 
}



</script>
</html>

    