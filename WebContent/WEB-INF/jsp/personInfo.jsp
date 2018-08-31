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
		<style type="text/css">
         .devicePic{width:200px; height:200px; border:1px dotted;}
         .devicePic img{width:100%;height:100%;}
         .detailPicDiv{width:400px; height:300px; border:1px dotted;}
          .detailPicDiv img{width:100%;height:100%;}
         </style> 
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
											个人中心
										</div>
											<div class="hr hr-24"></div>
									<div class="space-24"></div>
							<form id="personForm" class="form-horizontal">
										<input type="hidden" id="myuserId" value="${myuser.tUserId}"> 
										<input type="hidden" id="mypersonId" value="${tperson.tPresonId}"> 
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 用户姓名：</label>

										<div class="col-sm-9">
											<input type="text" id="mytCname" placeholder="中文姓名" class="col-xs-10 col-sm-5" value="${tperson.tCname}"/>
										</div>
									</div>
								
								<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1">性别：</label>

										<div class="col-sm-9">
											<select class="selectpicker" id="mygender" data-style="btn-primary" style="width:100px;">
                                    <option value="男">男</option>
									  <option value="女">女</option>
    							</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1">角色：</label>

										<div class="col-sm-9">
											<input type="text" id="juese" class="col-xs-10 col-sm-5" value="${myuser.tRole}" disabled/>
										</div>
									</div>
									<div class="space-4"></div>
										<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 手机号：</label>

										<div class="col-sm-9">
											<input type="text" id="mobilenum" name="person.tMobile" placeholder="请输入个人手机号" class="col-xs-10 col-sm-5" value="${tperson.tMobile}"/>
										</div>
									</div>
									
									<div class="form-group">
                                <label class="control-label col-md-3">科室</label>
                                <div class="col-md-9">
                                <select id="mykeshixiala" class="selectpicker" data-style="btn-primary" style="width:100px;">
                                     
                                </select> 
                                    
                                </div>
                            </div>

										<div class="space-4"></div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 电子邮件</label>

										<div class="col-sm-9">
											<input type="text" id="myemail" name="person.tEmail" placeholder="电子邮件地址" class="col-xs-10 col-sm-5" value="${tperson.tEmail}" />
										</div>
									</div>
									<div class="space-4"></div>
                            <div class="form-group">
                             <label class="control-label col-md-3">个人头像</label>
                             <div class="col-md-9" style="width:300px;">
                                     <div class="devicePic">
                                     <input id="fileToUpload" style="display: none" type="file" name="devicePicName">
									
										<img id="mypicID" src="${myappurl}resource/img/avatar5.png"  alt="无头像"/>
										<input type="button" value="选择图片" onclick="choosePic()">
										<input type="button" value="上传" onclick="ajaxUpload()">
									</div>
                                </div>
                            </div>
									
									

									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" id="mysub" onclick="updatePerson();">
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
					删除消息
				</h4>
			</div>
			<div class="modal-body">
				确定要删除数据么？
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

var attUpdateID='${tperson.tAttid}';
$(document).ready(function(){
	getUpdateDropDown('科室','mykeshixiala','${tperson.tDicId}');
	$("#mygender").val("${tperson.tGender}");
	 imgURL="${tperson.tAtturl}/${tperson.tAttname}";
		if(imgURL!="/")
			{
				$("#mypicID").attr("src",imgURL);    
			}
	  
	
});

  function updatePerson()
  {
	  $.ajax({
	        cache: true,
	        type: "POST",
	        url:"${myappurl}updatePerson.do",
	        data : {
	        	tUserId:$("#myuserId").val(),
	        	tPresonId:$("#mypersonId").val(),
	        	tCname : $("#mytCname").val(),
	        	tMobile : $("#mobilenum").val(),
	        	tEmail : $("#myemail").val(),
	        	tGender : $("#mygender").val(),
	        	tDicId:$("#mykeshixiala").val()
			},
	        async: false,
	        success: function(data) {
	        	if(data==true)
	        		{
	        			alert('更新成功!');
	        			 window.location.href="goToPersonInfo.do";
	        		}else{
	        			alert('更新失败!');
	        		}
	        }
	    }); 
	  
  }
  
  function mypost()
  {
	  $("#picform").ajaxSubmit();
	  
  }

function openDeleteConfirmWin()
{
	   		$('#myModal').modal('show');   
}
	
function openAddWin()
{
	   		$('#addComWin').modal('show');   
}


function ajaxUpload()
{   
	  $.ajaxFileUpload({  
          url:'${myappurl}myupload.do',  
          secureuri:false,  
          fileElementId:'fileToUpload',//file标签的id  
          dataType: 'json',//返回数据的类型  
          data:{
        	  deviceId: '${tperson.tPresonId}',
        	  mytAttid:attUpdateID,
        	  attType:'headicon'
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
	
</script>
</html>

    