<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>微信账号信息</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/adminjs/wxinfo.js"></script>
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
							<font style="margin-right:2px;font-size: 14px;">帐号名称:</font><input name="activityInfoQuery.activityName" class="input160" placeholder="活动名称"/>
							<button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="search();">查询</button>
							<!-- <button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toAdd();">添加</button>
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toEdit();">编辑</button>
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
							<th width="3%">序号</th>
							<th width="10%">帐号名称</th>
							<th width="5%">帐号类型</th>
							<th width="10%">应用ID</th>
							<th width="10%">应用密钥</th>
							<th width="10%">token</th>
							<th width="10%">access_token</th>
							<th width="5%">token过期时间</th>
							<th width="10%">jsapi_ticket</th>
							<th width="5%">签名随机串</th>
							<th width="5%">签名</th>
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="wxinfolistpage">
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
    <div id="inputDiv" class="affirmlayer" style="display: none; width: 520px;height: 620px;">
		<h2 style="font-family: 微软雅黑;">
			<b>帐号信息</b>
			<a href="#" onclick="closeDiv('inputDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<form id="inputForm" name="inputForm">
				<input type="hidden" name="id" id="hiddenId"/>
				<table width="100%" class="my-table-form">
					<tbody>
						<tr>
					        <td align="right" width="20%">帐号名称：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="activityItemName" id="activityItemName" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">商家名称：</td>
					        <td width="70%" style="text-align:left;">
					        	<select id="orgId" name="orgId" class="input120" style="width:80%;"></select>
					        </td>
					        <td width="10%"></td>
					     </tr>
						<tr>
					        <td align="right" width="20%">活动类型：</td>
					        <td width="70%" style="text-align:left;">
					        	<select id="activityType" name="activityType" class="input120" style="width:80%;">
					        		<option value="1">拼单</option>
					        		<option value="2">抽奖</option>
					        	</select>
					        </td>
					        <td width="10%"></td>
					     </tr>
						<tr>
					        <td align="right" width="20%">现价：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="priceAux" id="priceAux" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">原价：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="pricePlan" id="pricePlan" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">开始时间：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="startTime" id="startTime" class="input160" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">结束时间：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="endTime" id="endTime" class="input160" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">单数限制：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="orderLimit" id="orderLimit" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">人数限制：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="userLimit" id="userLimit" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					      <tr>
					        <td align="right" width="20%">次数限制：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="timesLimit" id="timesLimit" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">有效期：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="expiryDate" id="expiryDate" class="input160" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">领取地点：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="takeAddress" id="takeAddress" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">支付方式：</td>
					        <td width="70%" style="text-align:left;">
					        	<select name="payType" id="payType" class="input120" style="width:80%;">
					        		<option value="1">微信支付</option>
					        		<option value="2">到店支付</option>
					        	</select>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">活动简介：</td>
					        <td width="70%" style="text-align:left;">
					        	<textarea name="activityDesc" id="activityDesc" class="textareaall_noborder" rows="3" cols="10" style="width:80%;"></textarea>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">活动规则：</td>
					        <td width="70%" style="text-align:left;">
					        	<textarea name="activityRole" id="activityRole" class="textareaall_noborder" rows="3" cols="10" style="width:80%;"></textarea>
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