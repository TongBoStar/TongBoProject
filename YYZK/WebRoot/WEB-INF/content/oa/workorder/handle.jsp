<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告新增</title>
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/defaultform.css"/>
<!-- ztree -->
<script type="text/javascript" src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<!-- otherjs -->
<script type="text/javascript" src="${ctx}/resources/js/util.js"></script>
<script src="${ctx}/resources/plugins/other/jQuery.Hz2Py-min.js" type="text/javascript"></script>
<!--  -->
<script type="text/javascript" src="${ctx}/resources/plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
<style type="text/css">
.wu-example {
    position: relative;
    padding: 25px 15px 15px;
    background-color: #fafafa;
    box-shadow: inset 0 3px 6px rgba(0, 0, 0, .05);
    border-color: #e5e5e5 #eee #eee;
    border-style: solid;
    border-width: 1px 0;
}
.wu-example:after {
    position: absolute;
    top: 15px;
    left: 15px;
    font-size: 12px;
    font-weight: bold;
    color: #bbb;
    text-transform: uppercase;
    letter-spacing: 1px;
}


#picker {
    display: inline-block;
    line-height: 1.428571429;
    vertical-align: middle;
    margin: 0 12px 0 0;
}
#picker .webuploader-pick {
    padding: 6px 12px;
    display: block;
}


#uploader-demo .thumbnail {
    width: 100px;
    height: 100px;
}
#uploader-demo .thumbnail img {
    width: 100%;
}
.uploader-list {
    width: 100%;
    overflow: hidden;
}
.file-item {
    float: left;
    position: relative;
    margin: 0 20px 20px 0;
    padding: 4px;
}
.file-item .error {
    position: absolute;
    top: 4px;
    left: 4px;
    right: 4px;
    background: red;
    color: white;
    text-align: center;
    height: 20px;
    font-size: 14px;
    line-height: 23px;
}
.file-item .info {
    position: absolute;
    left: 4px;
    bottom: 4px;
    right: 4px;
    height: 20px;
    line-height: 20px;
    text-indent: 5px;
    background: rgba(0, 0, 0, 0.6);
    color: white;
    overflow: hidden;
    white-space: nowrap;
    text-overflow : ellipsis;
    font-size: 12px;
    z-index: 10;
}
.upload-state-done:after {
    content:"\e62a";
    font-family: "iconfont" !important;
    font-style: normal;
    font-weight: normal;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    font-size: 20px;
    position: absolute;
    bottom: 0;
    right: 4px;
    color: #4cae4c;
    z-index: 99;
}
.file-item .progress {
    position: absolute;
    right: 4px;
    bottom: 4px;
    height: 3px;
    left: 4px;
    height: 4px;
    overflow: hidden;
    z-index: 15;
    margin:0;
    padding: 0;
    border-radius: 0;
    background: transparent;
}
.file-item .progress span {
    display: block;
    overflow: hidden;
    width: 0;
    height: 100%;
    background: #d14 url(${ctx}/resources/plugins/webuploader/progress.png) repeat-x;
    -webit-transition: width 200ms linear;
    -moz-transition: width 200ms linear;
    -o-transition: width 200ms linear;
    -ms-transition: width 200ms linear;
    transition: width 200ms linear;
    -webkit-animation: progressmove 2s linear infinite;
    -moz-animation: progressmove 2s linear infinite;
    -o-animation: progressmove 2s linear infinite;
    -ms-animation: progressmove 2s linear infinite;
    animation: progressmove 2s linear infinite;
    -webkit-transform: translateZ(0);
}


.file-panel {
    position: absolute;
    height: 0;
    filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#80000000', endColorstr='#80000000')\0;
    background: rgba( 0, 0, 0, 0.5 );
    width: 100%;
    top: 0;
    left: 0;
    overflow: hidden;
    z-index: 300;
}

.file-panel span {
    width: 24px;
    height: 24px;
    display: inline;
    float: right;
    text-indent: -9999px;
    overflow: hidden;
    background: url(${ctx}/resources/plugins/webuploader/icons.png) no-repeat;
    margin: 5px 1px 1px;
    cursor: pointer;
}
.file-panel span.cancel {background-position: -48px -24px;}
.file-panel span.cancel:hover {background-position: -48px 0;}
</style>
<script type="text/javascript">
$(function () {
	
});

function closewin(){
	window.parent.closeWin();
}

function save(){
	iframeId = GetQueryString("iframeId");
	
	$('#form').form('submit',{
        onSubmit:function(){
            if($(this).form('enableValidation').form('validate')){
            	$.ajax({
    				type: "post",
    				url:'${ctx}/admin/oa/workorder/oa-work-order!handle.htm',
    				data:$('#form').serialize(),
    				dataType: "json",
    				async: false,
    				beforeSend:function(){},
    				success: function (data, textStatus) {
    					if(data.success){
    						$.messager.confirm('提示', '处理成功！', function(r){
    							var frames=window.top.window.document.getElementById(iframeId);
    							window.parent.closeWin();
    							frames.contentWindow.reload();
    						});
    					}else{
    						$.messager.confirm('提示', data.msg, function(r){
    							var frames=window.top.window.document.getElementById(iframeId);
    							window.parent.closeWin();
    							frames.contentWindow.reload();
    						});
    					}
    				},
    				error: function(XMLHttpRequest, textStatus, errorThrown) {
    					var error = XMLHttpRequest.responseText.match("<li>(.*?)\</li>");
    					if(error.length==2){
    						$.messager.confirm('提示', error[1], function(r){
    						});
    					}
 					}
    			});
            }
        }
    });
}

</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding: 3px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
			<div class="easyui-layout" data-options="fit:true,border:false">
				<div data-options="region:'north',border:false">
					<div id="toolbar" class="datagrid-toolbar">
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-save',plain:true" onclick="save()">保存</a>
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-close',plain:true" onclick="closewin()">关闭</a>
					</div>
				</div>
				<div data-options="region:'center',border:false" id="centerform">
					<form id="form" method="post">
						<s:hidden id="id" name="oaWorkOrder.id"></s:hidden>
						<s:hidden id="treatmentStatus" name="oaWorkOrder.treatmentStatus" value="1"></s:hidden>
						<table class="my-table-form">
							<tr>
				   				<th class="my-w80">标题</th>
				      			<td>
				      				<s:property value="oaWorkOrder.title"/>
				      			</td>
				        	</tr>
							<tr>
				   				<th class="my-w80">描述</th>
				      			<td>
				      				<s:property value="oaWorkOrder.remarks"/>
				        		</td>
				        	</tr>
				        	<!--  
				        	<tr>
				   				<th class="my-w80">处理结果</th>
				      			<td>
				      				<s:select theme="simple" list="#{0:'待处理',1:'已完成'}" cssStyle="width:80px;" cssClass="easyui-combobox" name="oaWorkOrder.treatmentStatus" id="treatmentStatus">
				      				</s:select>
				        		</td>
				        	</tr>
				        	-->
				        	<tr>
				   				<th class="my-w80">原因</th>
				      			<td>
				      				<s:textfield id="reason" name="oaWorkOrder.reason" theme="simple" cssClass="easyui-textbox" style="width:400px;" type="text" data-options="required:true"></s:textfield>
				        		</td>
				        	</tr>
				        	<tr>
				   				<th class="my-w80">解决方案</th>
				      			<td>
				      				<s:textarea id="solution" name="oaWorkOrder.solution" theme="simple" style="width:400px;height:100%" data-options="multiline:true,required:true" cssClass="easyui-textbox"></s:textarea>
				        		</td>
				        	</tr>
				        	<c:if test="${fn:length(oaWorkOrder.oaWorkOrderImgList) > 0}">
				        	<tr>
				        		<td colspan="2">
				        			<div id="uploader-demo" class="wu-example">
									    <!--用来存放item-->
									    <div id="fileList" class="uploader-list">
									    <c:forEach items="${oaWorkOrder.oaWorkOrderImgList}" var="info">
									    <a href="${ctx}/upload/workorder/it/${info.name}" target="_blank">
										<div class="file-item thumbnail">
											<img src="${ctx}/upload/workorder/it/${info.name}">
											<div class="info">${info.name}</div>
										</div>
										</a>
										</c:forEach>
									    </div>
									</div>
				        		</td>
				        	</tr>
				        	</c:if>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>