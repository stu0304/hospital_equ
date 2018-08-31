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
											供应商列表
										</div>
			<div class="widget-box">

											<div class="widget-body">
												<div class="widget-main">
													<form class="form-inline">
														供应商：<input type="text" id="searchSupportNameID" class="input-large" placeholder="供应商名称" />

 																		<button type="button" class="btn btn-purple btn-sm" onclick="loadPage()">
																			<i class="icon-search icon-on-right bigger-110"></i>
																			查询
																		</button>
														
															<button type="button" class="btn btn-sm btn-success" onclick="openAddWin();">
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
														<th class="center">经销商名称</th>
														<th class="center">营业执照编号</th>
													    <th class="center">医疗器械经营许可证编号</th>
														<th class="center">操作</th>
													</tr>
												</thead>

												<tbody id="mytbody">
													<tr><td class="center">	<label><input type="checkbox" class="ace" /><span class="lbl"></span></label></td>
													<td class="center">123</td><td class="center">北京鼎鑫科技</td>	<td class="center">00076546</td><td class="center">08765645454</td>
													<td class="center">	<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons"><a class="green" href="javascript:openAddWin();">
													<i class="icon-pencil bigger-130"></i></a><a class="red" href="javascript:openDeleteConfirmWin();"><i class="icon-trash bigger-130"></i></a>
													<a class="blue" href="javascript:openAttWin();">附件列表	</a></div></td></tr>
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

		
		<!-- 附件列表 -->
		<div id="addAttWin" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">
                    <i class="icon-pencil"></i>
                    <span id="lblAddTitle" style="font-weight:bold">供应商附件列表</span>
                </h4>
            </div>
            <form class="form-horizontal form-bordered form-row-strippe" id="ffAdd" action="" data-toggle="validator" enctype="multipart/form-data">
                  <input type="hidden" id="deviceHiddenID" name="tId"/></input>
                <div class="modal-body">
                    <div class="row">
                    <div id="myattShowID">
                    
                    </div>
                    <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">附件上传</label>
                                <div class="col-md-9">
                                   <input id="myFujianID" name="myFileName" type="file" class="form-control"/> 
                                </div>
                            </div>
                        </div>
                                  </div>
                    
                </div>
                <div class="modal-footer bg-info">
                    <button type="button" onclick="myajaxUpload();" class="btn blue">上传</button>
                    <button type="button" class="btn green" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
		
        <div id="addComWin" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">
                    <i class="icon-pencil"></i>
                    <span id="lblAddTitle" style="font-weight:bold">供应商信息</span>
                </h4>
            </div>
            <form class="form-horizontal form-bordered form-row-strippe" id="mySupportFormID" data-toggle="validator" enctype="multipart/form-data">
                  <input type="hidden" id="deviceHiddenID" name="tId"/></input>
                <div class="modal-body">
                    <div class="row">
                    <div class="col-md-12">
                            <div class="form-group">
                                <div class="control-label col-md-3">供应商名称</div>
                                <div class="col-md-9">
                                 <input id="tAgencyName" name="tAgencyName" type="text" class="form-control" />                                       
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">营业执照编号</label>
                                <div class="col-md-9">
                                   <input id="tPermitNo" name="tPermitNo" type="text" class="form-control"/> 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">仪器经营许可证</label>
                                <div class="col-md-9">
                                   <input id="tLicense" name="tLicense" type="text" class="form-control"/> 
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
				<button type="button" class="btn btn-primary" onclick="deleteAgency()">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<div class="modal fade" id="myAttDeleteConfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
				<button type="button" class="btn btn-primary" onclick="deleteAttByAttId()">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
				<%@include file="commonJS.jsp" %>		
</body>
<%@ include file="js/supportJs.jsp" %>    

</html>

    