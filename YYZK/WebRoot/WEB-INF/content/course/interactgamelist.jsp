<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>互动信息</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/course/interactgamelist.js"></script>
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
							<font style="margin-right:2px;font-size: 14px;">互动名称:</font><input name="interactGameQuery.fname" class="input160" placeholder="互动名称"/>
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
							<th width="10%">互动名称</th>
							<th width="6%">类型</th>
							<th width="35%">互动内容</th>
							<th width="10%">答案</th>
							<th width="10%">背景图片</th>
							<th width="14%">互动描述</th>
							<th width="6%">操作</th>
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="interactgamelistpage">
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
    <div id="inputDiv" class="affirmlayer" style="display: none; width: 520px;height: 360px;">
		<h2 style="font-family: 微软雅黑;">
			<b>互动信息</b>
			<a href="#" onclick="closeDiv('inputDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<form id="inputForm" name="inputForm">
				<input type="hidden" name="id" id="hiddenId"/>
				<table width="100%" class="my-table-form">
					<tbody>
						<tr>
					        <td align="right" width="20%">互动名称：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="fname" id="fname" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">所属类型：</td>
					        <td width="70%" style="text-align:left;">
					        	<select class="select120" style="width:80%;" id="ftype" name="ftype" onchange="changetype();">
					        		<option value="1">猜对错</option>
					        		<option value="2">滑动连连看</option>
					        	</select>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">互动内容：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="fcontent" id="fcontent" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">答案：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="fanswer" id="fanswer" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">图标：</td>
					        <td width="70%" style="text-align:left;">
					        	<div style="float:right;"><input name="upload" id="interactIcon" type="file"/></div>
								<div>
									<input type="hidden" name="interactIcon" id="filepathinter"/>
									<input class="input120" id="fileshowinter" style="width:80%;" readonly/>
								</div>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">奖励游戏：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="gameaward" id="gameaward" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">游戏包名：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="gameawardpackage" id="gameawardpackage" class="input160" style="width:80%;"/>
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
	<div id="gameentryDiv" class="affirmlayer" style="display: none; width: 520px;height: 420px;">
		<h2 style="font-family: 微软雅黑;">
			<b>互动内容</b>
			<a href="#" onclick="closeDiv('gameentryDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<form id="inputentryForm" name="inputentryForm">
				<input type="hidden" name="id" id="hiddenId"/>
				<input type="hidden" name="gameId" id="hiddengameId"/>
				<table width="100%" class="my-table-form">
					<tbody id="contentimages"></tbody>
				</table>
				<table width="100%" class="my-table-form">
					<tbody>
						<tr id="tagNameTR">
					        <td align="right" width="20%">标签名称：</td>
					        <td width="70%" style="text-align:left;">
					        	<div style="float:right;"><input name="upload" id="tagName" type="file"/></div>
								<div>
									<input type="hidden" name="tagName" id="filepath"/>
									<input class="input120" id="fileshow" style="width:80%;" readonly/>
								</div>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr id="equalNumberTR">
					        <td align="right" width="20%">顺序号：</td>
					        <td width="70%" style="text-align:left;"><input class="input120" id="equalNumber" name="equalNumber" style="width:80%;" readonly/></td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">资源图片：</td>
					        <td width="70%" style="text-align:left;">
								<div style="float:right;"><input name="upload" id="resImg" type="file"/></div>
								<div>
									<input type="hidden" name="resImg" id="filepathres"/>
									<input class="input120" id="fileshowres" style="width:80%;" readonly/>
								</div>
					        </td>
					        <td width="10%"></td>
					     </tr>
					</tbody>
				</table>
			</form>
		</div>
		<div style="width:100%;text-align: center;height:auto;border-top: 1px solid #ccc;padding-top:3px;">
			<button type="button" class="btn btn-success btn-outlined" style="border-radius:2px!important;" onclick="saveentry();">保存</button>
			<button type="button" class="btn btn-warning btn-outlined" style="border-radius:2px!important;" onclick="closeDiv('gameentryDiv');">取消</button>
	    </div>
	</div>
	<div id="cdiconDiv" class="affirmlayer" style="display: none; width: 500px;height: 500px;">
		<h2 style="font-family: 微软雅黑;">
			<b>背景图片</b>
			<a href="#" onclick="closeDiv('cdiconDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<img id="cdicon" style="width:495px;height:460px;"/>
		</div>
	</div>
</body>
</html>