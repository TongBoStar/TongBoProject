<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>机构信息</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/adminjs/organization.js"></script>
<style type="text/css">
.affirmlayer{top:10;left:10;width:500px;border:3px solid #E7EFF1;background:#fff;border-radius:5px!important;}
.affirmlayer h2{height:30px;border-bottom:1px solid #ccc;padding:5px 5px;margin:0px;font-size:14px;background:#E7EFF1;}
</style>
</head>
<body id="bodymark">
   	<%@ include file="/sysresources/common/topmsg.jsp"%>
       <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
       <%@ include file="/sysresources/common/top.jsp"%>
       <div id="wrapper">
           <%@ include file="/sysresources/common/menu.jsp"%>
           <div id="page-wrapper">
               <form name="queryForm" id="queryForm" action="" method="post" >
				<div class="portlet box portlet-grey">
					<div class="portlet-header">
						<div class="caption">
							<font style="margin-right:2px;font-size: 14px;">机构名称:</font><input name="organizationQuery.orgName" class="input160" placeholder="机构名称"/>
							<button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="search();">查询</button>
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toAdd();">添加</button>
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toEdit();">编辑</button>
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toDelete();">删除</button>
						</div>
						<div class="tools"><i class="fa fa-chevron-up"></i></i><i class="fa fa-times"></i></div>
					</div>
				</div>
               <div id="contentmark" style="overflow:auto; height:543px;width:auto;margin-bottom:3px;">
				<table class="table table-hover table-striped table-bordered table-advanced tablesorter">
					<thead>
						<tr>
							<th width="2%">
								<input type="checkbox" id="allcheckbox" style="width:15px;height:15px;" name="allcheckbox" onclick="$.antiSelectAllCheckboxes('queryForm', 'checkedIdList')" />
							</th>
							<th width="3%">序号</th>
							<th width="10%">机构名称</th>
							<th width="15%">机构地址</th>
							<th width="10%">机构网址</th>
							<th width="5%">机构负责人</th>
							<th width="5%">负责人电话</th>
							<th width="10%">描述</th>
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="organizationlistpage">
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
    <div id="inputDiv" class="affirmlayer" style="display: none; width: 520px;height: 300px;">
		<h2 style="font-family: 微软雅黑;">
			<b>机构信息</b>
			<a href="#" onclick="closeDiv('inputDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<form id="inputForm" name="inputForm">
				<input type="hidden" name="id" id="hiddenId"/>
				<table width="100%" class="my-table-form">
					<tbody>
						<tr>
					        <td align="right" width="20%">机构名称：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="orgName" id="orgName" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
						<tr>
					        <td align="right" width="20%">机构地址：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="orgAddress" id="orgAddress" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
						<tr>
					        <td align="right" width="20%">机构网址：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="orgUrl" id="orgUrl" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">机构负责人：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="orgCharger" id="orgCharger" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">负责人手机号：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="orgChargerTel" id="orgChargerTel" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">备注：</td>
					        <td width="70%" style="text-align:left;">
					        	<textarea id="orgDesc" name="orgDesc" class="textareaall_noborder" rows="3" cols="10" style="width:80%;"></textarea>
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
</body>
</html>