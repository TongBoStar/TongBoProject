<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    				url:'${ctx}/admin/oa/workorder/oa-work-order!networkEdit.htm',
    				data:$('#form').serialize(),
    				dataType: "json",
    				async: false,
    				beforeSend:function(){},
    				success: function (data, textStatus) {
    					if(data.type=="add"){
    						$.messager.confirm('提示', '新增成功！', function(r){
    							var frames=window.top.window.document.getElementById(iframeId);
    							window.parent.closeWin();
    							frames.contentWindow.reload();
    						});
    					}else{
    						$.messager.confirm('提示', "修改成功！", function(r){
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
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-iconsave',plain:true" onclick="save()">保存</a>
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-iconclose',plain:true" onclick="closewin()">关闭</a>
					</div>
				</div>
				<div data-options="region:'center',border:false" id="centerform">
					<form id="form" method="post">
						<s:hidden id="id" name="oaWorkOrderNetwork.id"></s:hidden>
						<table class="my-table-form">
							<tr>
				   				<th class="my-w80">姓名</th>
				      			<td>
									<s:textfield id="realName" name="oaWorkOrderNetwork.realName" theme="simple" cssClass="easyui-textbox" style="width:400px;" type="text" data-options="required:true"></s:textfield>
				      				
				        		</td>
				        	</tr>
							<tr>
				   				<th class="my-w80">邮件</th>
				      			<td>
									<s:textfield id="email" name="oaWorkOrderNetwork.email" theme="simple" cssClass="easyui-textbox" style="width:400px;" type="text" data-options="required:true"></s:textfield>
				      				
				        		</td>
				        	</tr>
							<tr>
				   				<th class="my-w80">微信</th>
				      			<td>
									<s:textfield id="weixin" name="oaWorkOrderNetwork.weixin" theme="simple" cssClass="easyui-textbox" style="width:400px;" type="text" data-options="required:true"></s:textfield>
				      				
				        		</td>
				        	</tr>
							<tr>
				   				<th class="my-w80">状态</th>
				      			<td>
				      				
				        		</td>
				        	</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>