<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>生产领料</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/productmanage/callsliperp.js"></script>
<style type="text/css">
.affirmlayer{top:10;left:10;width:500px;border:3px solid #E7EFF1;background:#fff;border-radius:5px!important;}
.affirmlayer h2{height:30px;border-bottom:1px solid #ccc;padding:5px 5px;margin:0px;font-size:14px;background:#E7EFF1;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#contentmark").css('height',window.innerHeight-220);
	});
</script>
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
						单据编号：<input name="callslipErpQuery.takeno" class="input80"/>
						物料代码：<input name="callslipErpQuery.takeitemcode" class="input80"/>
						制单人：<input name="callslipErpQuery.zhidanren" class="input80"/>
						领料人：<input name="callslipErpQuery.lingliaoren" class="input80"/>
						发料仓库：<input name="callslipErpQuery.takestock" class="input80"/>
						<input type="hidden" id="counttype" name="counttype" value="1"/>
						<button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="search();">查询</button>
						<button id="syncbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="syncdata();">同步数据</button>
						<br/>
						<button id="detailbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:1px;margin-left:0px;" onclick="countByType(1);">生产领料</button>
						<button id="unionbtn1" type="button" class="btn btn-danger" style="border-radius:2px!important;margin-top:1px;" onclick="countByType(2);">当期领用已入库</button>
						<button id="unionbtn2" type="button" class="btn btn-danger" style="border-radius:2px!important;margin-top:1px;" onclick="countByType(3);">当期领用未入库</button>
						<button id="unionbtn3" type="button" class="btn btn-danger" style="border-radius:2px!important;margin-top:1px;" onclick="countByType(4);">其他</button>
					</div>
					<div class="tools"><i class="fa fa-chevron-up"></i></i><i class="fa fa-times"></i></div>
				</div>
			</div>
               <!--END TITLE & BREADCRUMB PAGE-->
               <!--BEGIN CONTENT-->
               <div id="contentmark" style="overflow:auto;width:auto;margin-bottom:3px;">
				<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="min-width: 2000px;width:100%;">
					<thead>
						<tr>
							<th width="5%">日期</th>
							<th width="5%">审核标志</th>
							<th width="8%">领料部门</th>
							<th width="8%">单据编号</th>
							<th width="8%">发料仓库</th>
							<th width="8%">成本对象</th>
							<th width="8%">物料代码</th>
							<th width="8%">物料名称</th>
							<th width="6%">规格型号</th>
							<th width="4%">单位</th>
							<th width="6%">批号</th>
							<th width="5%">数量</th>
							<th width="5%">单价</th>
							<th width="5%">金额</th>
							<th width="4%">领料</th>
							<th width="7%">源单单号</th>
							<th width="8%">新制令号</th>
							<th width="6%">制令号</th>
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="callsliperppage">
				   	</simpletable:pageToolbar>     
				   	<span id="totalTaxAmount" style="margin-left:1px;font-size:8px;"></span>
				   	<span id="totalFHTaxAmount" style="margin-left:1px;font-size:8px;"></span>
				   	<span id="totalKPTaxAmount" style="margin-left:1px;font-size:8px;"></span>
			   </div>
			</div>
               <!--END CONTENT-->
           </div>
           <!--BEGIN FOOTER-->
           <%@ include file="/sysresources/common/footer.jsp"%>
           <!--END FOOTER-->
           <!--END PAGE WRAPPER-->
       </div>
</body>
</html>