<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>用户行为轨迹</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/course/stuselog.js"></script>
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
							<font style="margin-right:2px;font-size: 14px;">依云序列号:</font><input name="stuselogQuery.stCode" class="input120" placeholder="" value="${param.stCode }"/>
							<font style="margin-right:2px;font-size: 14px;">出厂序列号:</font><input name="stuselogQuery.serialNumber" class="input120" placeholder=""/>
							<select class="select120" name="stuselogQuery.operateModuleMark">
								<option value="">全部</option>
								<option value="IndexActivity">主界面</option>
								<option value="voice">语音对话</option>
								<option value="PlayerActivity">视频播放</option>
								<option value="YiYunQiMengActivity">依云启蒙</option>
								<option value="YiQiTingActivity">一起听</option>
								<option value="YiQiKanActivity">一起看</option>
								<option value="YiQiWanActivity">一起玩</option>
								<option value="UnityPlayerActivity">3D互动</option>
								<option value="Login">上线</option>
								<option value="Logout">下线</option>
							</select>
							<select class="select120" name="stuselogQuery.operateTypeMark">
								<option value="">全部</option>
								<option value="stayTime">页面停留</option>
								<option value="ask">问题</option>
								<option value="answer">回答</option>
								<option value="study">学习</option>
								<option value="playgame">玩游戏</option>
								<option value="playGameTime">游戏时长</option>
								<option value="music">播放音乐</option>
								<option value="playvideo">播放视频</option>
								<option value="sendWX">发送消息</option>
								<option value="receiveWX">接收消息</option>
								<option value="loginTime">上线</option>
								<option value="logoutTime">下线</option>
							</select>
							<button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="search();">查询</button>
							<font style="margin-right:2px;font-size: 14px;">解析日期:</font><input name="stuselogQuery.takeTime" id="takeTimeQUery" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input120" placeholder=""/>
							<button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="parseUserLog();">解析</button>
							<!-- <button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="search();">轨迹</button>
							<button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="search();">明细</button> -->
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
							<th width="8%">依云序列号</th>
							<th width="8%">出厂序列号</th>
							<th width="8%">操作模块</th>
							<th width="8%">操作类型</th>
							<th width="43%">操作内容</th>
							<th width="7%">时长</th>
							<th width="15%">采集时间</th>
							<!-- <th width="12%">上报时间</th> -->
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="stuseloglistpage">
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