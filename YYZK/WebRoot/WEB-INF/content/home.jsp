<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>依云智酷系统首页</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/home.js"></script>
<style type="text/css">
.affirmlayer{top:10;left:10;width:500px;border:3px solid #E7EFF1;background:#fff;border-radius:5px!important;}
.affirmlayer h2{height:30px;border-bottom:1px solid #ccc;padding:5px 5px;margin:0px;font-size:14px;background:#E7EFF1;}
.middle-demo{
	height: 4em;
	line-height: 4em;
	overflow: hidden;
}
.uploadify-queue {
    display:none;
}
</style>
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
             <form name="queryForm" id="queryForm" action="" method="post" >
	<div class="portlet box portlet-grey">
		<div class="portlet-header">
			<div class="caption">
				消息名称：<input name="messageQuery.name" id="messagename" class="input120"/>
				状态：
				<select class="select80" name="messageQuery.status">
					<option value="1">未处理</option>
					<option value="">全部</option>
					<option value="2">已处理</option>
				</select>
				时间：
				<input name="messageQuery.createdateBegin"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input120" />-
				<input name="messageQuery.createdateEnd"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input120" />
				<button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="search();">查询</button>
				<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="addDiv();">添加</button>
				<!-- <button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toGenTwoDimcode();">生成二维码</button>
				<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="doexe();">调用exe</button>
				<security:authorize ifAnyGranted="ROLE_PIKING_ADD">
				扫描序列号:<input class="input160" id="scancode"> 
				</security:authorize> -->
			</div>
			<div class="tools"><i class="fa fa-chevron-up"></i></i><i class="fa fa-times"></i></div>
		</div>
	</div>
             <!--END TITLE & BREADCRUMB PAGE-->
             <!--BEGIN CONTENT-->
             <div id="contentmark" style="overflow:auto; height:543px;width:auto;margin-bottom:3px;">
		<table class="table table-hover table-striped table-bordered table-advanced tablesorter">
			<thead>
				<tr>
					<!-- <th width="3%">
						<input type="checkbox" id="allcheckbox" name="allcheckbox" onclick="$.antiSelectAllCheckboxes('queryForm', 'checkedIdList')" />
					</th> -->
					<th width="5%">序号</th>
					<th width="15%">消息名称</th>
					<th width="50%">消息内容</th>
					<th width="15%">时间</th>
					<th width="5%">状态</th>
					<th width="10%">操作</th>
				</tr>
			</thead>
			<tbody id="home-data-body"></tbody>
		</table>
	</div>
	</form>
	<div class="pages" style="position:fixed;bottom:2px;">            		
	   	<div class="ps-right">            	
		   	<simpletable:pageToolbar page="${page}" id="messagepage">
		   	</simpletable:pageToolbar>            
	   </div>
	</div>
             <!--END CONTENT-->
         </div>
         <!--BEGIN FOOTER-->
         <%@ include file="/sysresources/common/footer.jsp"%>
         <!--END FOOTER-->
         <!--END PAGE WRAPPER-->
     </div>
    <div id="inputDiv" class="affirmlayer" style="display:none; width: 500px;height: 270px;">
		<h2 syle="height:20px;">
		<b>信息添加</b>
		<a href="#" onclick="closeDiv('inputDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height:auto;">
			<form id="inputForm" name="inputForm">
			<input name="type" id="type" type="hidden" value="2"/>
		    <table class="my-table-form">
		      <tr>
		        <td align="right">消息名称：<input name="id" id="hiddenid" type="hidden"/></td>
		        <td style="text-align: left;">
		        	<input  name="name" id="name" value="" class="input120" style="width:200px;"/> 
		        </td>
		      </tr>
		      <tr>
		        <td align="right">上传文件：</td>
		        <td>
		        	<input name="url" id="url"  type="hidden"/>
					<div style="float: left;"><input name="fileName" id="fileName" type="text" readonly="readonly" class="input120" style="width: 200px;"/></div>
					<div style="margin-left: 220px;"><input name="upload" id="fileUpload" type="file"/></div>
          		</td>
		      </tr>
		      <tr>
		        <td align="right">消息内容：</td>
		        <td style="text-align: left;">
		        	<textarea name="content" id="content" style="width:400px;" rows="5" cols="20"></textarea> 
		        </td>
		      </tr>
		    </table>
		   	</form>
		</div>
		<div style="width:100%;text-align: center;height:auto;border-top: 1px solid #ccc;padding-top:3px;">
			<button type="button" class="btn btn-success btn-outlined" style="border-radius:5px!important;" onclick="save();">保存</button>
			<button type="button" class="btn btn-warning btn-outlined" style="border-radius:5px!important;" onclick="closeDiv('inputDiv');">取消</button>
	    </div>
	</div>
	<div id="showDiv" class="affirmlayer" style="display: none; width: 823px;height: 600px;overflow:auto;">
		<h2 syle="height:20px;">
			<b>文件预览</b>
			<a href="#" onclick="closeDiv('showDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<a id="viewerPlaceHolder"
			style="width: 820px; height: 550px; display: block"></a>
	</div>
	<div id="twoDimcodeDiv" class="affirmlayer" style="display:none; width: 500px;height: 400px;">
		<h2 syle="height:20px;">
		<b>二维码生成</b>
		<a href="#" onclick="closeDiv('twoDimcodeDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height:330px;overflow:auto;">
		    <table class="my-table-form" style="min-height:300px;">
		      <tr>
		        <td align="right"><input name="seqcode" class="input120"/></td>
		        <td id="twodimcode1" style="text-align: left;">
		        </td>
		      </tr>
		    </table>
		</div>
		<div style="width:100%;text-align: center;height:auto;border-top: 1px solid #ccc;padding-top:3px;">
			<button type="button" class="btn btn-success btn-outlined" style="border-radius:5px!important;" onclick="genTwoDimcode();">保存</button>
			<button type="button" class="btn btn-warning btn-outlined" style="border-radius:5px!important;" onclick="closeDiv('twoDimcodeDiv');">取消</button>
	    </div>
	</div>
</body>
</html>