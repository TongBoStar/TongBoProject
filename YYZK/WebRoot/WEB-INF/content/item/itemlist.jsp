<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>项目列表</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/item/item.js"></script>
<style type="text/css">
.affirmlayer{top:10;left:10;width:500px;border:3px solid #E7EFF1;background:#fff;border-radius:5px!important;}
.affirmlayer h2{height:30px;border-bottom:1px solid #ccc;padding:5px 5px;margin:0px;font-size:14px;background:#E7EFF1;}
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
						<font style="margin-right:2px;font-size: 14px;">项目名称:</font>
						<input id="itemNameQuery" class="input160" name="itemQuery.itemName"/>
						<button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="search();">查询</button>
						<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toAdd();">添加</button>
						<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toEdit();">编辑</button>
						<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toDelete();">删除</button>
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
							<th width="2%">
								<input type="checkbox" id="allcheckbox" style="width:15px;height:15px;" name="allcheckbox" onclick="$.antiSelectAllCheckboxes('queryForm', 'checkedIdList')" />
							</th>
							<th width="2%">序号</th>
							<th width="20%">产品名称</th>
							<th width="10%">单价</th>
							<th width="20%">产品编号</th>
							<th width="10%">条形号码</th>
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="orderlistpage">
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
    <div id="inputDiv" class="affirmlayer" style="display: none; width: 520px;height: 220px;">
		<h2 style="font-family: 微软雅黑;">
			<b>项目信息</b>
			<a href="#" onclick="closeDiv('inputDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<form id="inputForm" name="inputForm">
				<input type="hidden" name="id" id="hiddenId"/>
				<table width="100%" class="my-table-form">
					<tbody>
						<tr>
					        <td align="right" width="20%">产品名称：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="itemName" id="itemName" class="inputall_noborder" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
						<tr>
					        <td align="right" width="20%">产品价格：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="itemPriceAux" id="itemPriceAux" class="inputall_noborder" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">产品编号：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="wxProductId" id="wxProductId" class="inputall_noborder" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">条形码：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="subjectCode" id="subjectCode" class="inputall_noborder" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					</tbody>
				</table>
			</form>
		</div>
		<div style="width:100%;text-align: center;height:auto;border-top: 1px solid #ccc;padding-top:3px;">
			<button type="button" class="btn btn-success btn-outlined" style="border-radius:2px!important;" onclick="save();">保存</button>
			<button type="button" class="btn btn-warning btn-outlined" style="border-radius:2px!important;" onclick="closeDiv('inputDiv');">取消</button>
	    </div>
	</div>
	<div id="cdiconDiv" class="affirmlayer" style="display: none; width: 300px;height: 200px;">
		<h2 style="font-family: 微软雅黑;">
			<b>条形码</b>
			<a href="#" onclick="closeDiv('cdiconDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<img id="cdicon" style="width:295px;height:120px;margin-top:20px;"/>
		</div>
	</div>
</body>
</html>