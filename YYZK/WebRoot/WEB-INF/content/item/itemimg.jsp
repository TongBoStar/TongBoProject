<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>项目图片</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/item/itemimg.js"></script>
<style type="text/css">
.affirmlayer{top:10;left:10;width:500px;border:3px solid #E7EFF1;background:#fff;border-radius:5px!important;}
.affirmlayer h2{height:30px;border-bottom:1px solid #ccc;padding:5px 5px;margin:0px;font-size:14px;background:#E7EFF1;}
</style>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/webuploader/webuploader.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/webuploader/style.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/webuploader/webuploader.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/webuploader/upload.js?domain=${ctx}"></script>
</head>
<body id="bodymark">
   	<%@ include file="/sysresources/common/topmsg.jsp"%>
       <!--BEGIN BACK TO TOP-->
       <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
       <!--END BACK TO TOP-->
       <!--BEGIN TOPBAR-->
       <%@ include file="/sysresources/common/top.jsp"%>
       <!--END TOPBAR-->
       <div id="wrapper">
           <!--BEGIN SIDEBAR MENU-->
           <%@ include file="/sysresources/common/menu.jsp"%>
           <!--END SIDEBAR MENU-->
           <!--BEGIN PAGE WRAPPER-->
           <div id="page-wrapper">
               <!--BEGIN TITLE & BREADCRUMB PAGE-->
			<div class="portlet box portlet-grey">
				<div class="portlet-header">
					<div class="caption">
						<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="save();">保存</button>
						<button type="button" class="btn btn-warning" style="border-radius:2px!important;margin-top:-2px;" onclick="toEdit();">取消</button>
					</div>
					<div class="tools"><i class="fa fa-chevron-up"></i></i><i class="fa fa-times"></i></div>
				</div>
			</div>
               <!--END TITLE & BREADCRUMB PAGE-->
               <!--BEGIN CONTENT-->
               <div id="contentmark" style="overflow:auto; height:543px;width:auto;margin-bottom:3px;">
				<div style="height: auto;">
					<form id="inputForm">
						<input type="hidden" name="itemId" id="hiddenId" value="${param.itemId }"/>
						<table class="my-table-form">
				        	<tr>
				      			<td colspan="6">
				      				<div class="uploader">
				      					<ul id="isupload" class="filelist"></ul>
				      				</div>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td colspan="6" style="background-color: #ffffff">
				        			 <div id="uploader" class="uploader">
						                <div class="queueList">
						                    <div id="dndArea" class="placeholder">
						                        <div id="filePicker"></div>
						                        <p>或将照片拖到这里，最多可选6张</p>
						                    </div>
						                </div>
						                <div class="statusBar" style="display:none;">
						                    <div class="progress">
						                        <span class="text">0%</span>
						                        <span class="percentage"></span>
						                    </div><div class="info"></div>
						                    <div class="btns">
						                        <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
						                    </div>
						                </div>
						            </div>
				        		</td>
				        	</tr>
						</table>
					</form>
				</div>
			</div>
           </div>
           <!--BEGIN FOOTER-->
           <%@ include file="/sysresources/common/footer.jsp"%>
           <!--END FOOTER-->
           <!--END PAGE WRAPPER-->
     </div>
</body>
</html>