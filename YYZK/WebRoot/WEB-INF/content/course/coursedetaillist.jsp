<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>课时信息</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/course/coursedetail.js"></script>
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
							<font style="margin-right:2px;font-size: 14px;">课程名称:</font><input name="courseDetailQuery.album" class="input160" placeholder=""/>
							<font style="margin-right:2px;font-size: 14px;">课时名称:</font><input name="courseDetailQuery.courseDetailName" class="input160" placeholder=""/>
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
							<th width="3%">索引</th>
							<th width="4%">课时</th>
							<th width="15%">课程名称</th>
							<th width="15%">课时名称</th>
							<th width="6%">课时类型</th>
							<th width="6%">课时时长</th>
							<th width="10%">视频ID</th>
							<!-- <th width="8%">uuid</th>
							<th width="8%">vuid</th> -->
							<th width="5%">课时图标</th>
							<!-- <th width="12%">课时资源</th> -->
							<th width="10%">课时描述</th>
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="coursedetaillistpage">
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
    <div id="inputDiv" class="affirmlayer" style="display: none; width: 520px;height: 500px;">
		<h2 style="font-family: 微软雅黑;">
			<b>课时信息</b>
			<a href="#" onclick="closeDiv('inputDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<form id="inputForm" name="inputForm">
				<input type="hidden" name="id" id="hiddenId"/>
				<table width="100%" class="my-table-form">
					<tbody>
						<tr>
					        <td align="right" width="20%">课程名称：</td>
					        <td width="70%" style="text-align:left;">
					        	<select id="courseId" name="courseId" class="select120" style="width:80%;"></select>
					        </td>
					        <td width="10%"></td>
					    </tr>
						<tr>
					        <td align="right" width="20%">课时名称：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="courseDetailName" id="courseDetailName" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">课时序号：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="courseDetailNo" id="courseDetailNo" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">课时类型：</td>
					        <td width="70%" style="text-align:left;">
					        	<select id="courseDetailType" name="courseDetailType" class="select120" style="width:80%;" onchange="kslxchange();">
					        		<!-- <option value="1">纯文本</option>
					        		<option value="2">纯音乐</option>
					        		<option value="3">纯图片</option> -->
					        		<option value="4">依云视频</option>
					        		<option value="5">网络视频</option>
					        		<!-- <option value="6">图文混排</option>
					        		<option value="7">图音混排</option>
					        		<option value="8">图视混排</option>
					        		<option value="9">文视混排</option> -->
					        	</select>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">课时时长：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="courseDetailTimes" id="courseDetailTimes" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">视频ID：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="videoId" id="videoId" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">专辑：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="album" id="album" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <!-- <tr>
					        <td align="right" width="20%">uuid：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="uuid" id="uuid" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">vuid：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="vuid" id="vuid" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr> -->
					    <tr>
					        <td align="right" width="20%">课时图标：</td>
					        <td width="70%" style="text-align:left;">
								<div style="float:right;"><input name="upload" id="courseDetailIcon" type="file"/></div>
								<div>
									<input type="hidden" name="courseDetailIcon" id="filepath"/>
									<input class="input120" id="fileshow" style="width:80%;" readonly/>
								</div>
					        </td>
					        <td width="10%"><a href="javascript:void(0);" onclick="lookcdiconnow();">预览</a></td>
					     </tr>
					     <!-- <tr>
					        <td align="right" width="20%">课时资源：</td>
					        <td width="70%" style="text-align:left;">
								<div style="float:right;"><input name="upload" id="courseDetailRes" type="file"/></div>
								<div>
									<input type="hidden" name="courseDetailRes" id="filepathRes"/>
									<input class="input120" id="fileshowRes" style="width:80%;" readonly/>
								</div>
					        </td>
					        <td width="10%"></td>
					     </tr> -->
					     <tr>
					        <td align="right" width="20%">互动信息：</td>
					        <td width="70%" style="text-align:left;">
								<select id="interactId" name="interactId" class="select120" style="width:80%;"></select>
					        </td>
					        <td width="10%"></td>
					     </tr>
					     <tr>
					        <td align="right" width="20%">游戏名称：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="gameaward" id="gameaward" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">包名：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="gameawardpackage" id="gameawardpackage" class="input160" style="width:80%;"/>
					        </td>
					        <td width="10%"></td>
					    </tr>
					     <tr>
					        <td align="right" width="20%">课时描述：</td>
					        <td width="70%" style="text-align:left;">
					        	<textarea id="courseDetailDesc" name="courseDetailDesc" class="textareaall_noborder" rows="3" cols="10" style="width:80%;"></textarea>
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
			<b>课时图标</b>
			<a href="#" onclick="closeDiv('cdiconDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<img id="cdicon" style="width:295px;height:260px;"/>
		</div>
	</div>
</body>
</html>