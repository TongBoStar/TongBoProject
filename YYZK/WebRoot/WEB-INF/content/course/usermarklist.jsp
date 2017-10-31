<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>用户登录登出</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/course/usermarklog.js"></script>
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
							<font style="margin-right:2px;font-size: 14px;">依云序列号:</font><input name="usermarkQuery.stCode" class="input120" placeholder=""/>
							<font style="margin-right:2px;font-size: 14px;">出厂序列号:</font><input name="usermarkQuery.serialNumber" class="input120" placeholder=""/>
							<font style="margin-right:2px;font-size: 14px;">使用人:</font><input name="usermarkQuery.username" class="input80" placeholder=""/>
							<font style="margin-right:2px;font-size: 14px;">代理商:</font><input name="usermarkQuery.agentName" class="input80" placeholder=""/>
							<font style="margin-right:2px;font-size: 14px;">操作类型:</font><select class="select120" name="usermarkQuery.operateType">
								<option value="">全部</option>
								<option value="1">登录</option>
								<option value="2">退出</option>
							</select>
							<button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="search();">查询</button>
							<button id="searchbtn1" type="button" class="btn btn-danger" style="border-radius:2px!important;margin-top:-2px;" onclick="searchtype(1);">最新数据</button>
							<button id="searchbtn2" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="searchtype(2);">历史数据</button>
						</div>
						<div class="tools"><i class="fa fa-chevron-up"></i></i><i class="fa fa-times"></i></div>
					</div>
				</div>
               <div id="contentmark" style="overflow:auto; height:543px;width:auto;margin-bottom:3px;">
				<table class="table table-hover table-striped table-bordered table-advanced tablesorter">
					<thead>
						<tr>
							<!-- <th width="2%">
								<input type="checkbox" id="allcheckbox" style="width:15px;height:15px;" name="allcheckbox" onclick="$.antiSelectAllCheckboxes('queryForm', 'checkedIdList')" />
							</th> -->
							<th width="3%">序号</th>
							<th width="7%">依云序列号</th>
							<th width="7%">出厂序列号</th>
							<th width="5%">操作类型</th>
							<th width="15%">操作内容</th>
							<th width="4%">版本号</th>
							<th width="10%">使用人</th>
							<th width="5%">代理商</th>
							<th width="8%">手机号</th>
							<th width="10%">地址</th>
							<th width="12%">采集时间</th>
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="usermarklistpage">
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
</body>
</html>