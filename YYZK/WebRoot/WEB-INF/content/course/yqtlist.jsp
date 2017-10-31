<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>一起听</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/course/yqt.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/css/stylemusic.css">
<style type="text/css">
.affirmlayer{top:10;left:10;width:500px;border:3px solid #E7EFF1;background:#fff;border-radius:5px!important;}
.affirmlayer h2{height:30px;border-bottom:1px solid #ccc;padding:5px 5px;margin:0px;font-size:14px;background:#E7EFF1;}
.uploadify-queue {
    display:none;
}
</style>
<script type="text/javascript">
window.onload=function(){
   var canvas=document.getElementById('canvas');
   if(canvas.getContext){
		var ctx=canvas.getContext("2d");
		ctx.beginPath();
		ctx.strokeStyle='darkgreen';
		ctx.lineCap='round';
		ctx.lineWidth=6;
		ctx.arc(160,160,150,0,Math.PI,false);
		ctx.stroke();
   }				   
}
</script>
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
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-2px;" onclick="toExport();">导出</button>
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
							<th width="20%">名称</th>
							<th width="6%">所属类型</th>
							<th width="6%">资源</th>
							<th width="5%">时长</th>
							<th width="5%">图标</th>
							<th width="30%">描述</th>
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="yqtlistpage">
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
			<b>一起看</b>
			<a href="#" onclick="closeDiv('inputDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<form id="inputForm" name="inputForm">
				<input type="hidden" name="id" id="hiddenId"/>
				<table width="100%" class="my-table-form">
					<tbody>
						<tr>
					        <td align="right" width="20%">名称：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="fname" id="fname" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">所属类型：</td>
					        <td width="70%" style="text-align:left;">
					        	<select id="ftype" name="ftype" class="select120" style="width:80%;">
					        		<option value="1">故事</option>
					        		<option value="2">儿歌</option>
					        		<option value="3">童话</option>
					        		<option value="4">国学</option>
					        	</select>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">时长：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="times" id="times" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					     <tr>
					        <td align="right" width="20%">图标：</td>
					        <td width="70%" style="text-align:left;">
								<div style="float:right;"><input name="upload" id="resIcon" type="file"/></div>
								<div>
									<input type="hidden" name="resIcon" id="filepath"/>
									<input class="input120" id="fileshow" style="width:80%;" readonly/>
								</div>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">资源地址：</td>
					        <td width="70%" style="text-align:left;">
								<div style="float:right;"><input name="upload" id="resourceUrl" type="file"/></div>
								<div>
									<input type="hidden" name="resourceUrl" id="filepathres"/>
									<input class="input120" id="fileshowres" style="width:80%;" readonly/>
								</div>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">描述：</td>
					        <td width="70%" style="text-align:left;">
					        	<textarea id="fdesc" name="fdesc" class="textareaall_noborder" rows="3" cols="10" style="width:80%;"></textarea>
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
	<div id="cdiconDiv" class="affirmlayer" style="display: none; width: 400px;height: 400px;">
		<h2 style="font-family: 微软雅黑;">
			<b>音乐试听</b>
			<a href="#" onclick="closeThisDiv('cdiconDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<div id="container">
				<canvas id="canvas" width="320" height="320">对不起，你的浏览器不支持Canvas标签！</canvas>
				<canvas id="progress" width="320" height="320"></canvas><!-- progress bar -->
				<div id="player">
					<audio id="audio" controls></audio>
					<div class="cover">
						<div class="controls">
							<div class="play_pause" id="play" title="Play" onClick="togglePlay()"><i>&#xe600;</i></div>
							<div class="play_pause" id="replay"  onclick="replayAudio()"><i>&#xe607;</i></div>
							<div class="voice"><i>&#xe608;</i><input id="volume" name="volume" min="0" max="1" step="0.1" type="range" onChange="setVolume()" /></div>
							<div id="musictimes">00:00/00:00</div>
						</div><!-- #controls -->
						<div class="info">
							<p class="song"><a href="javascript:void(0);" id="musicname"></a></p>
							<p class="author"><a href="javascript:void(0);"></a></p>
						</div>
					</div><!-- #cover -->
				</div><!-- #player -->
			</div><!-- #container -->
		</div>
	</div>
</body>
</html>