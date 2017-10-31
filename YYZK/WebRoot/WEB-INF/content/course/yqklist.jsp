<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>一起看</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/course/yqk.js"></script>
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
							<font style="margin-right:2px;font-size: 14px;">名称:</font>
							<input name="yqkQuery.fname" class="input160" placeholder=""/>
							<font style="margin-right:2px;font-size: 14px;">专辑:</font>
							<input name="yqkQuery.ftypeName" class="input160" placeholder=""/>
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
							<th width="15%">专辑</th>
							<th width="5%">时长</th>
							<th width="4%">集数</th>
							<th width="10%">视频ID</th>
							<!-- <th width="10%">专辑</th>
							<th width="10%">uuid</th>
							<th width="10%">vuid</th> -->
							<th width="5%">图标</th>
							<!-- <th width="10%">资源地址</th> -->
							<th width="15%">描述</th>
						</tr>
					</thead>
					<tbody id="data-body"></tbody>
				</table>
			</div>
			</form>
			<div class="pages" style="position:fixed;bottom:2px;">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="yqklistpage">
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
    <div id="inputDiv" class="affirmlayer" style="display: none; width: 520px;height: 420px;">
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
					        	<select id="ftype" name="ftype" class="select120" style="width:80%;"></select>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">资源类型：</td>
					        <td width="70%" style="text-align:left;">
					        	<select id="resourceType" name="resourceType" class="select120" style="width:80%;" onchange="changerestype();">
					        		<option value="1">外网链接</option>
					        		<option value="2">本地上传</option>
					        	</select>
					        </td>
					        <td width="10%"></td>
					    </tr>
					    <tr>
					        <td align="right" width="20%">时长：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="times" id="times" class="input160" value="20" style="width:80%;"/>
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
					        <td align="right" width="20%">集数：</td>
					        <td width="70%" style="text-align:left;">
					        	<input name="videoseq" id="videoseq" class="input160" style="width:80%;"/>
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
					        <td align="right" width="20%">图标：</td>
					        <td width="70%" style="text-align:left;">
								<div style="float:right;"><input name="upload" id="resIcon" type="file"/></div>
								<div>
									<input type="hidden" name="resIcon" id="filepath"/>
									<input class="input120" id="fileshow" style="width:80%;" readonly/>
								</div>
					        </td>
					        <td width="10%"><a href="javascript:void(0);" onclick="lookcdiconnow();">预览</a></td>
					     </tr>
					    <!--  <tr>
					        <td align="right" width="20%">资源地址：</td>
					        <td width="70%" style="text-align:left;">
								<div style="float:right;"><input name="upload" id="resourceUrl" type="file"/></div>
								<div>
									<input type="hidden" name="resourceUrl" id="filepathres"/>
									<input class="input120" id="fileshowres" style="width:80%;"/>
								</div>
					        </td>
					        <td width="10%"></td>
					     </tr> -->
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
	<div id="cdiconDiv" class="affirmlayer" style="display: none; width: 300px;height: 300px;">
		<h2 style="font-family: 微软雅黑;">
			<b>一起看图标</b>
			<a href="#" onclick="closeDiv('cdiconDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<img id="cdicon" style="width:295px;height:260px;"/>
		</div>
	</div>
</body>
</html>