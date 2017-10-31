<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>表字段信息列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap3/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap3/js/bootstrap.min.js"></script>
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<script type="text/javascript">
var api = frameElement.api, W = api.opener;
$(document).ready(function() {
   $("#addStepBtn").click(function(){
        addStep();
	});
});
function addStep(){
	W.$.dialog({
		content: 'url:${ctx}/itemStep/addIndex.htm',
		lock: true,
		width:'620px',
		height:'460px',
		title:'步骤添加',
		parent:api,
	    ok: function(){
	    	iframe = this.iframe.contentWindow;
			$('#btn_sub', iframe.document).click();
			return false;
	    },
	    cancelVal: '关闭',
	    cancel: true
	});
}
</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding:3px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
			<table class="text-table-form">
			<thead>
				<tr><th>序号</th><th>名称</th><th>所需物品</th><th>内容</th><th>时长</th></tr>
			</thead>
			<tbody>
			<s:iterator value="itemStepList" status="status">
				<tr>
	      			<td>
	        			<s:text name="stepNo"></s:text>
	        		</td>
	        		<td>
	        			<s:text name="stepName"></s:text>
	        		</td>
	        		<td>
	        			<s:text name="stepNeeds"></s:text>
	        		</td>
	        		<td>
	        			<s:text name="stepContent"></s:text>
	        		</td>
	        		<td>
	        			<s:text name="stepTimes"></s:text>
	        		</td>
	        	</tr>
	        </s:iterator>
	        </tbody>
	        <tfoot>
	        	<tr><td colspan="5" style="text-align:left;">
	        		<button type="button" id="addStepBtn" class="btn btn-primary">添加步骤</button>
	        	</td></tr>
	        </tfoot>
	        </table>
		</div>
	</div>
</div>
</body>
</html>