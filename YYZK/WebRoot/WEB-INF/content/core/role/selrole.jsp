<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>部门选择</title>
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
<!-- ztree -->
<script type="text/javascript" src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/ztree/zTreeStyle.css"/>
<script type="text/javascript" src="${ctx}/resources/plugins/ztree/jquery.ztree.excheck-3.5.min.js"></script>
<style type="text/css">
ul.ztree {border: 1px solid #617775;width:220px;height:360px;overflow-y:scroll;overflow-x:auto;}
</style>
<script type="text/javascript">
var zTree;
$(function(){
	$.ajax({
		type: "post",
		url: '${ctx}/role/role!treeGrid.htm',
		dataType: "json",
		async: false,
		success: function (data, textStatus) {
			var setting = {	
				data: {
					key:{
						name:"name"
					},
					simpleData:{
						enable:true,
						idKey:"id",
						pIdKey:"pId",
						rootPId: 0
					}
				},
				callback:{
					onClick:function(event, treeId, treeNode) {
						//$("#hidTreeId").val(treeNode.id);
						//$("#hidTreeName").val(treeNode.name);
					},
					onCheck:function(event, treeId, treeNode) {
						var ids="",names="";
						$.each(zTree.getCheckedNodes(true),function(index,obj){
							ids = ids + obj.id+",";
							names = names + obj.name+",";
						});
						$("#hidTreeId").val(ids);
						$("#hidTreeName").val(names);
					}		
				},
				check:{
					chkboxType:{ "Y": "", "N": "" },
					enable: true
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