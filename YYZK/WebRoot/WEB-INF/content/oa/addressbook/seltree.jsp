<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- date -->
<script type="text/javascript" src="${ctx}/resources/plugins/my97/WdatePicker.js"></script>
<!-- validform -->
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<!-- ztree -->
<script src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/ztree/zTreeStyle.css"/>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<title>用户管理</title>
<style type="text/css">
ul.ztree {border: 1px solid #617775;width:220px;height:360px;overflow-y:scroll;overflow-x:auto;}
</style>
<script type="text/javascript">
var zTree;
$(function(){
	$.ajax({
		type: "post",
		url: '${ctx}/module/module!tree.htm',
		dataType: "json",
		async: false,
		success: function (data, textStatus) {
			var setting = {	
				data: {
					key:{
						name:"text"
					},
					simpleData:{
						enable:true,
						idKey:"id",
						pIdKey:"pid",
						rootPId: 0
					}
				},
				callback:{
					onClick:function(event, treeId, treeNode) {
						//alert(treeNode.id+"==="+treeNode.text);
						$("#hidTreeId").val(treeNode.id);
						$("#hidTreeName").val(treeNode.text);
					}
				}
			};
			zTree = $.fn.zTree.init($("#treedept"), setting, data);
		}
	});
});
</script>
</head>
<body>
	<table>
		<tr>
			<td valign="top">
				<ul id="treedept" class="ztree"></ul>
			</td>
		</tr>
		<input style="display:none" id="hidTreeId" />
		<input style="display:none" id="hidTreeName" />
	</table>
</body>
</html>