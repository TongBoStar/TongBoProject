<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>销售系统</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/course/incominfo.js"></script>
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
							<font style="margin-right:2px;font-size: 14px;">名称:</font><input name="moduleQuery.orgName" class="input160" placeholder="名称"/>
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
							<th width="4%">成员编号</th>
							<th width="3%">级别</th>
							<th width="10%">订单编号</th>
							<th width="10%">下单时间</th>
							<th width="10%">书童编号</th>
							<th width="10%">固定利润</th>
							<th width="10%">客户满意奖</th>
							<th width="10%">一级推荐奖励</th>
							<th width="10%">二级推荐奖励</th>
							<th width="10%">家族贡献分</th>
							<th width="5%">订单状态</th>
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="incominfolistpage">
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
			<b>销售信息</b>
			<a href="#" onclick="closeDiv('inputDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<form id="inputForm" name="inputForm">
				<input type="hidden" name="id" id="hiddenId"/>
				<table width="100%" class="my-table-form">
					<tbody>
						<tr>
					        <td align="right" width="20%">微信号：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="orderWxCode" id="orderWxCode" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
						<tr>
					        <td align="right" width="20%">订单编号：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="orderCode" id="orderCode" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">订单时间：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="orderTime" id="orderTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input100"  style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">书童编号：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="stseqCode" id="stseqCode" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">归属人编号：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="adminCode" id="adminCode" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">单据来源：</td>
					        <td width="70%" style="text-align:left;">
					        	<select name="orderSource" id="orderSource" class="select120" style="width:80%;">
					        		<option value="2">淘宝/天猫</option>
					        		<option value="3">京东</option>
					        		<option value="4">其他</option>
					        		<option value="1">微信小店</option>
					        	</select>
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