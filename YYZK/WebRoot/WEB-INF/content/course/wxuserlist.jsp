<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>微信用户信息</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/course/wxuser.js"></script>
<style type="text/css">
.affirmlayer{top:10;left:10;width:500px;border:3px solid #E7EFF1;background:#fff;border-radius:5px!important;}
.affirmlayer h2{height:30px;border-bottom:1px solid #ccc;padding:5px 5px;margin:0px;font-size:14px;background:#E7EFF1;}
.uploadify-queue {
    display:none;
}
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
							<font style="margin-right:2px;font-size: 14px;">昵称:</font><input name="wxuserQuery.nickname" class="input160" placeholder=""/>
							<font style="margin-right:2px;font-size: 14px;">姓名:</font><input name="wxuserQuery.username" class="input160" placeholder=""/>
							<button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="search();">查询</button>
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toEdit();">编辑</button>
							<button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="searchfromwx();">获取</button>
							<!-- <button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toAdd();">添加</button>
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toDelete();">删除</button> -->
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
							<th width="4%">序号</th>
							<th width="30%">昵称</th>
							<th width="8%">姓名</th>
							<th width="20%">微信号</th>
							<th width="7%">省市</th>
							<th width="5%">性别</th>
							<th width="4%">头像</th>
							<th width="15%">备注</th>
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="wxuserlistpage">
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
    <div id="inputDiv" class="affirmlayer" style="display: none; width: 520px;height: 295px;">
		<h2 style="font-family: 微软雅黑;">
			<b>微信用户信息</b>
			<a href="#" onclick="closeDiv('inputDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<form id="inputForm" name="inputForm">
				<input type="hidden" name="id" id="hiddenId"/>
				<table width="100%" class="my-table-form">
					<tbody>
						<tr>
					        <td align="right" width="20%">昵称：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="nickname" id="nickname" class="input160" style="width:80%;" readonly="readonly"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">姓名：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="username" id="username" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">微信号：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="wxCode" id="wxCode" class="input160" style="width:80%;" readonly="readonly"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">省：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="province" id="province" class="input160" style="width:80%;" readonly="readonly"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">市：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="city" id="city" class="input160" style="width:80%;" readonly="readonly"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">性别：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="sex" id="sex" class="input160" style="width:80%;" readonly="readonly"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					     <tr>
					        <td align="right" width="20%">备注：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="fmark" id="fmark" class="input160" style="width:80%;"/>
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
	<div id="cdiconDiv" class="affirmlayer" style="display: none; width: 300px;height: 300px;">
		<h2 style="font-family: 微软雅黑;">
			<b>头像</b>
			<a href="#" onclick="closeDiv('cdiconDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<img id="cdicon" style="width:295px;height:260px;"/>
		</div>
	</div>
</body>
</html>