<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>物料管理</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/course/yyitem.js"></script>
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
							<font style="margin-right:2px;font-size: 14px;">物料代码:</font><input name="yyitemQuery.itemCodeQuery" class="input160"/>
							<font style="margin-right:2px;font-size: 14px;">物料名称:</font><input name="yyitemQuery.itemName" class="input160"/>
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
							<th width="4%">序号</th>
							<th width="15%">物料编码</th>
							<th width="10%">物料名称</th>
							<th width="10%">物料规格</th>
							<th width="5%">价格</th>
							<th width="5%">单位</th>
							<th width="5%">状态</th>
							<th width="25%">供应商</th>
							<th width="5%">BOM</th>
							<th width="10%">备注</th>
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="yyitemlistpage">
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
    <div id="inputDiv" class="affirmlayer" style="display: none; width: 520px;height: 325px;">
		<h2 style="font-family: 微软雅黑;">
			<b>物料信息</b>
			<a href="#" onclick="closeDiv('inputDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<form id="inputForm" name="inputForm">
				<input type="hidden" name="id" id="hiddenId"/>
				<table width="100%" class="my-table-form">
					<tbody>
						<tr>
					        <td align="right" width="20%">物料编码：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="itemCode" id="itemCode" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
						<tr>
					        <td align="right" width="20%">物料名称：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="itemName" id="itemName" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">物料规格：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="itemMode" id="itemMode" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">单位：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="funit" id="funit" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">价格：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="fprice" id="fprice" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">供应商：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="supplier" id="supplier" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					     <tr>
					        <td align="right" width="20%">状态：</td>
					        <td width="70%" style="text-align:left;">
								<select name="isrecommend" id="isrecommend" class="select120" style="width:80%;">
									<option value="1">使用</option><option value="0">禁用</option>
								</select>
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
</body>
</html>