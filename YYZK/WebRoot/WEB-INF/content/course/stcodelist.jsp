<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>产品发货信息</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/course/stcode.js"></script>
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
               <!-- <input type="hidden" name="stcodeQuery.sadd" value="1"/> -->
				<div class="portlet box portlet-grey">
					<div class="portlet-header" style="padding:8px;">
						<div class="caption">
							<select id="selectitem" class="select120" style="width:80px;" onchange="selectitemc();">
								<option value=""></option>
								<option value="stcodeQuery.stCodeQuery">依云序列号</option>
								<option value="stcodeQuery.serialNumberQuery">出厂序列号</option>
								<option value="stcodeQuery.username">使用人</option>
								<option value="stcodeQuery.telNumber">手机号</option>
								<option value="stcodeQuery.fadressdetail">详细地址</option>
								<option value="stcodeQuery.invoiceHead">发票抬头</option>
								<option value="stcodeQuery.faddress">省市</option>
								<option value="stcodeQuery.customerservice">售后</option>
								<option value="stcodeQuery.feedback">回访</option>
								<option value="stcodeQuery.flowup">跟踪</option>
								<option value="stcodeQuery.fmark">备注</option>
							</select>
							<input id="inputselect" class="input80"/>
							<!-- <font style="margin-right:2px;font-size: 14px;">依云序列号:</font><input name="stcodeQuery.stCodeQuery" class="input100" placeholder=""/>
							<font style="margin-right:2px;font-size: 14px;">出厂序列号:</font><input name="stcodeQuery.serialNumberQuery" class="input100" placeholder=""/>
							<font style="margin-right:2px;font-size: 14px;">备注:</font><input name="stcodeQuery.fmark" class="input100" placeholder=""/> -->
							<font style="margin-right:2px;font-size: 14px;">颜色:</font>
							<select name="stcodeQuery.fcolor" class="select120" style="width:60px;"><option value=""></option><option value="1">甜心粉</option><option value="2">梦幻蓝</option></select>
							<font style="margin-right:2px;font-size: 14px;">品质:</font>
							<select name="stcodeQuery.quality" class="select120" style="width:60px;"><option value=""></option><option value="A">A</option><option value="B">B</option><option value="C">C</option></select>
							<font style="margin-right:2px;font-size: 14px;">状态:</font>
							<select name="stcodeQuery.fqty" class="select120" style="width:60px;"><option value=""></option><option value="1">已发货</option><option value="0">未发货</option></select>
							<font style="margin-right:2px;font-size: 14px;">赠品:</font>
							<select class="select120" style="width: 160px;font-size: 6px;" name="stcodeQuery.giveaway">
									<option value=""></option>
					        		<option value="7">学习卡+三脚架+优盘+幕布</option>
					        		<option value="1">学习卡+三脚架+优盘</option>
					        		<option value="12">幕布+三脚架+优盘</option>
					        		<option value="13">学习卡+三脚架+幕布</option>
					        		<option value="2">学习卡+三脚架</option>
					        		<option value="9">三脚架+幕布</option>
					        		<option value="3">学习卡+优盘</option>
					        		<option value="10">学习卡+幕布</option>
					        		<option value="8">优盘+幕布</option>
					        		<option value="4">学习卡</option>
					        		<option value="5">优盘</option>
					        		<option value="6">幕布</option>
					        		<option value="11">无</option>
					        	</select>
							<font style="margin-right:2px;font-size: 14px;">发货时间:</font>
							<input name="stcodeQuery.sendTimeStart" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input80" />-<input name="stcodeQuery.sendTimeEnd" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input80" />
							<button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="search();">查询</button>
							<!-- <button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toAdd();">添加</button> -->
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toEdit();">编辑</button>
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toEditBatch();">批改</button>
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toDelete();">删除</button>
						</div>
						<!-- <div class="tools"><i class="fa fa-chevron-up"></i></i><i class="fa fa-times"></i></div> -->
					</div>
				</div>
               <div id="contentmark" style="overflow:auto; height:543px;width:auto;margin-bottom:3px;">
				<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:3000px;">
					<thead>
						<tr>
							<th width="1%">
								<input type="checkbox" id="allcheckbox" style="width:15px;height:15px;" name="allcheckbox" onclick="$.antiSelectAllCheckboxes('queryForm', 'checkedIdList')" />
							</th>
							<th width="2%">序号</th>
							<th width="3%">依云序列号</th>
							<th width="3%">出厂序列号</th>
							<th width="2%">二维码</th>
							<th width="2%">使用人</th>
							<th width="3%">手机号</th>
							<th width="2%">代理商</th>
							<th width="4%">省市</th>
							<th width="8%">详细地址</th>
							<th width="2%">颜色</th>
							<th width="4%">发货时间</th>
							<th width="6%">创建时间</th>
							<th width="2%">发票</th>
							<th width="8%">发票抬头</th>
							<th width="8%">备注</th>
							<th width="2%">品质</th>
							<th width="2%">状态</th>
							<th width="3%">金额</th>
							<th width="5%">快递单号</th>
							<th width="3%">快递费</th>
							<th width="5%">赠品</th>
							<th width="8%">回访</th>
							<th width="8%">跟踪</th>
							<th width="8%">售后</th>
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="stcodelistpage">
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
    <div id="inputDiv" class="affirmlayer" style="display: none; width: 700px;height: 430px;">
		<h2 style="font-family: 微软雅黑;">
			<b>序列号信息</b>
			<a href="#" onclick="closeDiv('inputDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<form id="inputForm" name="inputForm">
				<input type="hidden" name="id" id="hiddenId"/>
				<table width="100%" class="my-table-form">
					<tbody>
						<tr>
					        <td align="right" width="20%">出厂序列号：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="serialNumber" id="serialNumber" class="input160" style="width:80%;" readonly="readonly"/>
					        </td>
					        <td align="right" width="20%">依云序列号：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="stCode" id="stCode" class="input160" style="width:80%;" readonly="readonly"/>
					        </td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">使用人：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="username" id="username" class="input160" style="width:80%;"/>
					        </td>
					        <td align="right" width="20%">手机号：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="telNumber" id="telNumber" class="input160" style="width:80%;"/>
					        </td>
					        
					    </tr>
					    <tr>
					        <td align="right" width="20%">省市：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="faddress" id="faddress" class="input160" style="width:80%;"/>
					        </td>
					        <td align="right" width="20%">详细地址：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="fadressdetail" id="fadressdetail" class="input160" style="width:80%;"/>
					        </td>
					    </tr>
					    <tr>
					       <td align="right" width="20%">赠品：</td>
					       <td width="30%" style="text-align:left;">
					        	<select class="select120" style="width: 80%;" name="giveaway" id="giveaway">
					        		<option value="7">学习卡+三脚架+优盘+幕布</option>
					        		<option value="1">学习卡+三脚架+优盘</option>
					        		<option value="12">幕布+三脚架+优盘</option>
					        		<option value="13">学习卡+三脚架+幕布</option>
					        		<option value="2">学习卡+三脚架</option>
					        		<option value="9">三脚架+幕布</option>
					        		<option value="3">学习卡+优盘</option>
					        		<option value="10">学习卡+幕布</option>
					        		<option value="8">优盘+幕布</option>
					        		<option value="4">学习卡</option>
					        		<option value="5">优盘</option>
					        		<option value="6">幕布</option>
					        		<option value="11">无</option>
					        	</select>
					        </td>
					        <td align="right" width="20%">发货状态：</td>
					        <td width="30%" style="text-align:left;">
					        	<select class="select120" style="width: 80%;" name="fqty" id="fqty"><option value="">------</option><option value="0">未发货</option><option value="1">已发货</option></select>
					        </td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">备注：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="fmark" id="fmark" class="input160" style="width:80%;"/>
					        </td>
					        <td align="right" width="20%">颜色：</td>
					        <td width="30%" style="text-align:left;">
					        	<select class="select120" style="width: 80%;" name="fcolor" id="fcolor"><option value="1">甜心粉</option><option value="2">梦幻蓝</option></select>
					        </td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">是否开票：</td>
					        <td width="30%" style="text-align:left;">
					        	<select class="select120" style="width: 80%;" name="isinvoice" id="isinvoice"><option value="0">否</option><option value="1">是</option></select>
					        </td>
					        <td align="right" width="20%">发票抬头：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="invoiceHead" id="invoiceHead" class="input160" style="width:80%;"/>
					        </td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">金额：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="famount" id="famount" class="input160" style="width:80%;"/>
					        </td>
					        <td align="right" width="20%">品质：</td>
					        <td width="30%" style="text-align:left;">
					        	<select class="select120" style="width: 80%;" name="quality" id="quality"><option value="A">A</option><option value="B">B</option><option value="C">C</option></select>
					        </td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">快递单号：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="tracknumber" id="tracknumber" class="input160" style="width:80%;"/>
					        </td>
					        <td align="right" width="20%">快递费用：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="trackamount" id="trackamount" class="input160" style="width:80%;"/>
					        </td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">回访记录：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="feedback" id="feedback" class="input160" style="width:80%;"/>
					        </td>
					        <td align="right" width="20%">后续跟踪：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="flowup" id="flowup" class="input160" style="width:80%;"/>
					        </td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">发货时间：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="sendTime" id="sendTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input160" style="width:80%;"/>
					        </td>
					        <td align="right" width="20%">售后：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="customerservice" id="customerservice" class="input160" style="width:80%;"/>
					        </td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">代理商：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="agentName" id="agentName" class="input160" style="width:80%;"/>
					        </td>
					        <td align="right" width="20%"></td>
					        <td width="30%" style="text-align:left;"></td>
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
	<div id="inputBatchDiv" class="affirmlayer" style="display: none; width: 700px;height: 300px;">
		<h2 style="font-family: 微软雅黑;">
			<b>序列号信息</b>
			<a href="#" onclick="closeDiv('inputBatchDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<form id="inputBatchForm" name="inputBatchForm">
				<input type="hidden" name="stCode" id="stCode2"/>
				<table width="100%" class="my-table-form">
					<tbody>
					    <tr>
					        <td align="right" width="20%">使用人：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="username" id="username2" class="input160" style="width:80%;"/>
					        </td>
					        <td align="right" width="20%">手机号：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="telNumber" id="telNumber2" class="input160" style="width:80%;"/>
					        </td>
					        
					    </tr>
					    <tr>
					        <td align="right" width="20%">省市：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="faddress" id="faddress2" class="input160" style="width:80%;"/>
					        </td>
					        <td align="right" width="20%">详细地址：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="fadressdetail" id="fadressdetail2" class="input160" style="width:80%;"/>
					        </td>
					    </tr>
					    <tr>
					       <td align="right" width="20%">赠品：</td>
					       <td width="30%" style="text-align:left;">
					        	<select class="select120" style="width: 80%;" name="giveaway" id="giveaway2">
					        		<option value="7">学习卡+三脚架+优盘+幕布</option>
					        		<option value="1">学习卡+三脚架+优盘</option>
					        		<option value="13">学习卡+三脚架+幕布</option>
					        		<option value="12">幕布+三脚架+优盘</option>
					        		<option value="2">学习卡+三脚架</option>
					        		<option value="9">三脚架+幕布</option>
					        		<option value="3">学习卡+优盘</option>
					        		<option value="10">学习卡+幕布</option>
					        		<option value="8">优盘+幕布</option>
					        		<option value="4">学习卡</option>
					        		<option value="5">优盘</option>
					        		<option value="6">幕布</option>
					        		<option value="11">无</option>
					        	</select>
					        </td>
					        <td align="right" width="20%">备注：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="fmark" id="fmark2" class="input160" style="width:80%;"/>
					        </td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">是否开票：</td>
					        <td width="30%" style="text-align:left;">
					        	<select class="select120" style="width: 80%;" name="isinvoice" id="isinvoice2"><option value="0">否</option><option value="1">是</option></select>
					        </td>
					        <td align="right" width="20%">发票抬头：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="invoiceHead" id="invoiceHead2" class="input160" style="width:80%;"/>
					        </td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">快递单号：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="tracknumber" id="tracknumber2" class="input160" style="width:80%;"/>
					        </td>
					        <td align="right" width="20%">发货时间：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="sendTime" id="sendTime2" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input160" style="width:80%;"/>
					        </td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">代理商：</td>
					        <td width="30%" style="text-align:left;">
					        	<input name="agentName" id="agentName2" class="input160" style="width:80%;"/>
					        </td>
					        <td align="right" width="20%">发货状态：</td>
					        <td width="30%" style="text-align:left;">
					        	<select class="select120" style="width: 80%;" name="fqty" id="fqty2"><option value="">------</option><option value="0">未发货</option><option value="1">已发货</option></select>
					        </td>
					    </tr>
					</tbody>
				</table>
			</form>
		</div>
		<div style="width:100%;text-align: center;height:auto;border-top: 1px solid #ccc;padding-top:3px;">
			<button type="button" class="btn btn-success btn-outlined" style="border-radius:2px!important;" onclick="saveBatch();">保存</button>
			<button type="button" class="btn btn-warning btn-outlined" style="border-radius:2px!important;" onclick="closeDiv('inputBatchDiv');">取消</button>
	    </div>
	</div>
	<div id="cdiconDiv" class="affirmlayer" style="display: none; width: 300px;height: 300px;">
		<h2 style="font-family: 微软雅黑;">
			<b>二维码</b>
			<a href="#" onclick="closeDiv('cdiconDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<img id="cdicon" style="width:295px;height:260px;"/>
		</div>
	</div>
</body>
</html>